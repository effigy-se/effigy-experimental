/datum/admin_help
	var/effigy_player_id
	var/effigy_ticket_id
	var/effigy_linked = NO_LINK

/datum/admin_help/proc/set_effigy_ticket_id(source, datum/admin_help/ticket, datum/http_response/response)
	SIGNAL_HANDLER
	if(!CONFIG_GET(flag/effigy_api_enabled))
		CRASH("[source] ticket [ticket] attempted to set Effigy ticket ID without Effigy API enabled")

	log_effigy_api("Processing API response: [ticket.id] [ticket.effigy_player_id]")
	if(ticket != src)
		return
	if(effigy_linked == LINK_SUCCESS)
		return
	if(response["errorCode"])
		effigy_linked = LINK_FAIL
		log_effigy_api("ERROR: Ticket [id] received API response [response["errorCode"]] [response["errorMessage"]]")
		message_admins(span_boldwarning("Effigy Game Services: Ticket ID [id] received API response [response["errorCode"]] [response["errorMessage"]]."))
		to_chat(usr, alert_boxed_message(RED, "Effigy Game Services error: Ticket ID received API response [response["errorCode"]]."), MESSAGE_TYPE_SYSTEM)
		return
	effigy_linked = LINK_SUCCESS
	effigy_ticket_id = response["id"]

/datum/admin_help/proc/AddInteraction(formatted_message, player_message, cattempt)
	if(CONFIG_GET(flag/effigy_api_enabled))
		var/attempt
		if(cattempt)
			attempt = cattempt
		else
			attempt = 1
		if(effigy_linked == LINK_PENDING)
			if(attempt <= 3)
				addtimer(CALLBACK(src, PROC_REF(AddInteraction), formatted_message, player_message, attempt), 1.5 SECONDS)
				attempt++
				return
			else
				effigy_linked = LINK_FAIL

	if(!isnull(usr) && usr.ckey != initiator_ckey)
		admins_involved |= usr.ckey
		if(heard_by_no_admins)
			heard_by_no_admins = FALSE
			send2adminchat(initiator_ckey, "Ticket #[id]: Answered by [key_name(usr)]")

	ticket_interactions += "[time_stamp()]: [formatted_message]"
	if(!isnull(player_message))
		player_interactions += "[time_stamp()]: [player_message]"

		if(!CONFIG_GET(flag/effigy_api_enabled))
			return

		var/ef_type = EFFIGY_MESSAGE_TICKET_INTERACTION
		var/int_id = id
		var/link_id = SSeffigy.ckey_to_effigy_id(usr.ckey)
		if(!link_id)
			effigy_linked = LINK_FAIL
			stack_trace("Unable to find an Effigy account link for ckey [usr.ckey]")
			link_id = EFFIGY_UNKNOWN_PLAYER
		var/box = SOCIAL_DISTRICT_AHELP
		var/ticket_id = effigy_ticket_id
		var/message = strip_html_full(player_message)
		var/title = strip_html_full(name)
		var/request = SSeffigy.create_message_request(ef_type, int_id, link_id, ticket_id, box, title, message)
		log_effigy_api("Sending ticket interaction: [id] [effigy_player_id] [box]")
		INVOKE_ASYNC(SSeffigy, TYPE_PROC_REF(/datum/controller/subsystem/effigy, send_message_request), request, src)

/datum/admin_help/proc/send_ticket_url(initiator)
	to_chat(initiator, alert_boxed_message(PINK, "You can view this ticket in the portal at: <a href=\"https://effigy.se/ticket/[effigy_ticket_id]/\">https://effigy.se/ticket/[effigy_ticket_id]/</a>"), confidential = TRUE)

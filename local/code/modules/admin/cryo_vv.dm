/**
 * EXTRA MOB VV
 */
/mob/vv_get_dropdown()
	. = ..()
	VV_DROPDOWN_OPTION("", "---------")
	VV_DROPDOWN_OPTION(VV_HK_SEND_CRYO, "Send to Cryo")
	VV_DROPDOWN_OPTION(VV_HK_RELOAD_PREFS, "Reload Prefs")

/mob/vv_do_topic(list/href_list)
	. = ..()
	if(href_list[VV_HK_SEND_CRYO])
		vv_send_cryo()


	if(href_list[VV_HK_RELOAD_PREFS])
		vv_load_prefs()

/**
 * Sends said person to a cryopod.
 */
/mob/proc/vv_send_cryo()
	if(!check_rights(R_SPAWN))
		return

	var/send_notice = tgui_alert(usr, "Add a paper notice about sending [name] into a cryopod?", "Leave a paper?", list("No", "Yes", "Cancel"))
	if(send_notice != "Yes" && send_notice != "No")
		return

	//log/message
	to_chat(usr, "Put [src] in cryopod.")
	log_admin("[key_name(usr)] has put [key_name(src)] into a cryopod.")
	var/msg = span_notice("[key_name_admin(usr)] has put [key_name(src)] into a cryopod from [ADMIN_VERBOSEJMP(src)].")
	message_admins(msg)
	admin_ticket_log(src, msg)

	send_notice = send_notice == "Yes"
	send_to_cryo(send_notice)

/**
 * Overrides someones mob with their loaded prefs.
 */
/mob/proc/vv_load_prefs()
	if(!check_rights(R_ADMIN))
		return

	if(!client)
		to_chat(usr, span_warning("No client found!"))
		return

	if(!ishuman(src))
		to_chat(usr, span_warning("Mob is not human!"))
		return

	var/notice = tgui_alert(usr, "Are you sure you want to load the clients current prefs onto their mob?", "Load Preferences", list("Yes", "No"))
	if(notice != "Yes")
		return

	client?.prefs?.apply_prefs_to(src)
	var/msg = span_notice("[key_name_admin(usr)] has loaded [key_name(src)]'s preferences onto their current mob [ADMIN_VERBOSEJMP(src)].")
	message_admins(msg)
	admin_ticket_log(src, msg)

/// Send player in not-quiet cryopod. If with_paper = TRUE, place a paper with notification under player.
/mob/proc/send_to_cryo(with_paper = FALSE)
	//effect
	playsound(loc, 'sound/effects/magic/Repulse.ogg', 100, 1)
	var/datum/effect_system/spark_spread/quantum/sparks = new
	sparks.set_up(10, 1, loc)
	sparks.attach(loc)
	sparks.start()

	//make a paper if need
	if(with_paper)
		var/obj/item/paper/cryo_paper = new /obj/item/paper(loc)
		cryo_paper.name = "Notification - [name]"
		cryo_paper.add_raw_text("Our sincerest apologies, [name][job ? ", [job]," : ""] had to be sent back in Cryogenic Storage for reasons that cannot be elaborated on at the moment.<br><br>Sincerely,<br><i>Nanotrasen Anti-Sudden Sleep Disorder Agency</i>")
		cryo_paper.update_appearance()
	//find cryopod
	for(var/obj/machinery/cryopod/cryo in GLOB.valid_cryopods)
		if(!cryo.occupant && cryo.state_open && !cryo.panel_open) //free, opened, and panel closed?
			if(buckled)
				buckled.unbuckle_mob(src, TRUE)
			if(buckled_mobs)
				for(var/mob/buckled_mob in buckled_mobs)
					unbuckle_mob(buckled_mob)
			cryo.close_machine(src) //put player
			break

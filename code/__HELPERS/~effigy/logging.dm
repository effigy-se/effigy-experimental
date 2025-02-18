#define PREF "PREF"
#define ICON "ICON"

/proc/debug_effigy(type, message)
	var/msg_type = type
	if(isnull(type))
		msg_type = "GAME"
	to_chat(world, span_debugcyan("\[[span_debugwhite("EF")]]\[[span_debugyellow(msg_type)]\] [message]"))

/proc/log_effigy_api(text, list/data, notify_admins = FALSE, notify_span = "adminnotice")
	logger.Log(LOG_CATEGORY_EFFIGY_API, text, data)
	if(notify_admins)
		message_admins("<span class='[notify_span]'>[text]</span>")

/proc/log_events(text, list/data, notify_admins = FALSE, notify_span = "adminnotice")
	logger.Log(LOG_CATEGORY_EVENTS, text, data)
	if(notify_admins)
		message_admins("<span class='[notify_span]'>[text]</span>")

/// This logs subtle/r emotes if the conflig flag is enabled
/proc/log_subtle(text, list/data)
	logger.Log(LOG_CATEGORY_EMOTE_SUBTLE, text, data)

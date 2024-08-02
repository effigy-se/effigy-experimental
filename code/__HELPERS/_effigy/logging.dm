#define PREF "PREF"

/proc/debug_effigy(message, type)
	var/msg_type = type
	if(isnull(type))
		msg_type = "GAME"
	to_chat(world, span_debugcyan("\[[span_debugwhite("EF")]]\[[span_debugyellow(msg_type)]\] [message]"))

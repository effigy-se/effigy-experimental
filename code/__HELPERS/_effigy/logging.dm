#define PREF "PREF"
#define ICON "ICON"

/proc/debug_effigy(message, type)
	var/msg_type = type
	if(isnull(type))
		msg_type = "GAME"
	to_chat(world, span_debugcyan("\[[span_debugwhite("EF")]]\[[span_debugyellow(msg_type)]\] [message]"))

// debug_effigy("Applying DNA feature [dna_identifier] on [target] containing [value]", PREF)

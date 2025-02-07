/obj/effect/landmark/latejoin_interlink
	name = "JoinLateInterlink"

/obj/effect/landmark/latejoin_interlink/Initialize(mapload)
	..()
	SSjob.latejoin_interlink_trackers += loc
	return INITIALIZE_HINT_QDEL

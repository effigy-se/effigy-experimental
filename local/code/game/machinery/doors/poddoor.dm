/obj/machinery/door/poddoor
	icon = 'local/icons/obj/doors/blast_door.dmi'

/obj/machinery/door/poddoor/animation_length(animation)
	switch(animation)
		if(DOOR_OPENING_ANIMATION)
			return 1.1 SECONDS
		if(DOOR_CLOSING_ANIMATION)
			return 1.1 SECONDS

/obj/machinery/door/poddoor/animation_segment_delay(animation)
	switch(animation)
		if(DOOR_OPENING_PASSABLE)
			return 0.75 SECONDS
		if(DOOR_OPENING_FINISHED)
			return 1.1 SECONDS
		if(DOOR_CLOSING_UNPASSABLE)
			return 0.35 SECONDS
		if(DOOR_CLOSING_FINISHED)
			return 1.1 SECONDS


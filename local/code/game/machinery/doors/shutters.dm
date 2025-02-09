/obj/machinery/door/poddoor/shutters
	icon = 'local/icons/obj/doors/shutters.dmi'
	animation_sound = 'local/sound/machines/shutters.ogg'

/obj/machinery/door/poddoor/shutters/animation_length(animation)
	switch(animation)
		if(DOOR_OPENING_ANIMATION)
			return 2.3 SECONDS
		if(DOOR_CLOSING_ANIMATION)
			return 2.3 SECONDS

/obj/machinery/door/poddoor/shutters/animation_segment_delay(animation)
	switch(animation)
		if(DOOR_OPENING_PASSABLE)
			return 0.98 SECONDS
		if(DOOR_OPENING_FINISHED)
			return 2.3 SECONDS
		if(DOOR_CLOSING_UNPASSABLE)
			return 0.21 SECONDS
		if(DOOR_CLOSING_FINISHED)
			return 2.3 SECONDS

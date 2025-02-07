/obj/machinery/button/showtime/broadcast_team
	name = "broadcast button"
	desc = "Use this button to allow entertainment monitors to broadcast the show, live on air."
	device_type = /obj/item/assembly/control/showtime/broadcast_team
	icon_state = "button"
	id = "showtime_bt"

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/button/showtime/broadcast_team, 24)

/obj/item/assembly/control/showtime/broadcast_team
	tv_network_id = "broadcast"
	tv_show_name = "Broadcast Team's Homebrew Extravaganza"
	tv_starters = list( \
		"Returning live from your station!", \
		)
	tv_enders = list( \
		"We'll be back after the break!", \
		)

/obj/machinery/computer/security/telescreen/broadcast_team
	name = "\improper Broadcast Teams' telescreen"
	desc = "A telescreen used to preview a show's cameras prior to air."
	network = list("broadcast")
	frame_type = /obj/item/wallframe/telescreen/broadcast_team

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/computer/security/telescreen/broadcast_team, 32)

/obj/item/wallframe/telescreen/broadcast_team
	name = "\improper Broadcast Teams' telescreen frame"
	result_path = /obj/machinery/computer/security/telescreen/broadcast_team

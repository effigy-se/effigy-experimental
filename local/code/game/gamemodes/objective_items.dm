/datum/objective_item/steal/hypo
	targetitem = /obj/item/hypospray/mkii/deluxe/cmo

/obj/item/hypospray/mkii/deluxe/cmo/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/hypospray/mkii/deluxe/cmo)

/datum/objective_item/steal/traitor/rpd
	name = "a bluespace RPD"
	targetitem = /obj/item/pipe_dispenser/bluespace
	difficulty = 3
	steal_hint = "The Chief Engineer's personal rapid pipe dispenser. \
		Usually found amongst their engineering supplies on their person, in their belt, or otherwise in their locker."

/obj/item/pipe_dispenser/bluespace/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/pipe_dispenser/bluespace)

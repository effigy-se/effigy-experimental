/obj/structure/closet/secure_closet/salvage
	name = "salvage equipment locker"
	icon_state = "science"
	req_access = list(ACCESS_SCIENCE)

/obj/structure/closet/secure_closet/salvage/PopulateContents()
	. = ..()
	/* EffigyEdit TODO - Salvage
	new /obj/item/salvaging_hammer(src)
	new /obj/item/salvaging_hammer/cm2(src)
	new /obj/item/salvaging_hammer/cm3(src)
	new /obj/item/salvaging_hammer/cm4(src)
	new /obj/item/salvaging_hammer/cm5(src)
	new /obj/item/salvaging_hammer/cm6(src)
	new /obj/item/salvaging_hammer/cm10(src)
	new /obj/item/salvaging_brush(src)
	new /obj/item/salvaging_tape_measure(src)
	new /obj/item/salvage_handheld_scanner(src)
	new /obj/item/storage/belt/utility/salvage(src)
	*/
	new /obj/item/storage/bag/ore(src)
	new /obj/item/clothing/glasses/science(src)

/datum/supply_pack/costumes_toys/painting
	name = "Advanced Art Supplies"
	desc = "Bring out your artistic spirit with these advanced art supplies. Contains coloring supplies, cloth for canvas, and two easels to work with!"
	cost = CARGO_CRATE_VALUE * 2.2
	contains = list(
		/obj/structure/easel,
		/obj/structure/easel,
		/obj/item/toy/crayon/spraycan,
		/obj/item/toy/crayon/spraycan,
		/obj/item/storage/crayons,
		/obj/item/storage/crayons,
		/obj/item/toy/crayon/white,
		/obj/item/toy/crayon/white,
		/obj/item/toy/crayon/rainbow,
		/obj/item/toy/crayon/rainbow,
		/obj/item/stack/sheet/cloth/ten,
		/obj/item/stack/sheet/cloth/ten,
	)
	crate_name = "advanced art supplies"
	crate_type = /obj/structure/closet/crate/cardboard

/datum/supply_pack/misc/paintcan
	name = "Adaptive Paintcan"
	desc = "Give things a splash of color with this experimental color-changing can of paint! Sellers note: We are not responsible for lynchings carried out by angry janitors, security officers, or any other crewmembers as a result of you using this."
	cost = CARGO_CRATE_VALUE * 3.5
	contains = list(/obj/item/paint/anycolor)
	crate_name = "paint box"
	crate_type = /obj/structure/closet/crate/cardboard

/datum/supply_pack/misc/coloredsheets
	name = "Bedsheet Crate"
	desc = "Give your night life a splash of color with this crate filled with bedsheets! Contains a total of nine different-colored sheets."
	cost = CARGO_CRATE_VALUE * 2.5
	contains = list(
		/obj/item/bedsheet/blue,
		/obj/item/bedsheet/green,
		/obj/item/bedsheet/orange,
		/obj/item/bedsheet/purple,
		/obj/item/bedsheet/red,
		/obj/item/bedsheet/yellow,
		/obj/item/bedsheet/brown,
		/obj/item/bedsheet/black,
		/obj/item/bedsheet/rainbow,
	)
	crate_name = "bedsheets box"
	crate_type = /obj/structure/closet/crate/cardboard

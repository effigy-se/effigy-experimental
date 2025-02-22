/obj/item/bodypart/head/slugcat
	icon_greyscale = BODYPART_ICON_SLUGCAT
	limb_id = SPECIES_SLUGCAT
	is_dimorphic = FALSE

/obj/item/bodypart/chest/slugcat
	icon_greyscale = BODYPART_ICON_SLUGCAT
	limb_id = SPECIES_SLUGCAT

/obj/item/bodypart/arm/left/slugcat
	icon_greyscale = BODYPART_ICON_SLUGCAT
	limb_id = SPECIES_SLUGCAT

/obj/item/bodypart/arm/right/slugcat
	icon_greyscale = BODYPART_ICON_SLUGCAT
	limb_id = SPECIES_SLUGCAT

/obj/item/bodypart/leg/left/slugcat
	icon_greyscale = BODYPART_ICON_SLUGCAT
	limb_id = SPECIES_SLUGCAT

/obj/item/bodypart/leg/left/digitigrade/slugcat
	icon_greyscale = BODYPART_ICON_SLUGCAT

/obj/item/bodypart/leg/left/digitigrade/slugcat/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(limb_id == SPECIES_LIZARD)
		limb_id = SPECIES_SLUGCAT

/obj/item/bodypart/leg/right/slugcat
	icon_greyscale = BODYPART_ICON_SLUGCAT
	limb_id = SPECIES_SLUGCAT

/obj/item/bodypart/leg/right/digitigrade/slugcat
	icon_greyscale = BODYPART_ICON_SLUGCAT

/obj/item/bodypart/leg/right/digitigrade/slugcat/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(limb_id == SPECIES_LIZARD)
		limb_id = SPECIES_SLUGCAT

/obj/item/bodypart/head/anthro
	icon_greyscale = BODYPART_ICON_ANTHRO
	limb_id = SPECIES_ANTHRO
	is_dimorphic = FALSE

/obj/item/bodypart/chest/anthro
	icon_greyscale = BODYPART_ICON_ANTHRO
	limb_id = SPECIES_ANTHRO

/obj/item/bodypart/arm/left/anthro
	icon_greyscale = BODYPART_ICON_ANTHRO
	limb_id = SPECIES_ANTHRO

/obj/item/bodypart/arm/right/anthro
	icon_greyscale = BODYPART_ICON_ANTHRO
	limb_id = SPECIES_ANTHRO

/obj/item/bodypart/leg/left/anthro
	icon_greyscale = BODYPART_ICON_ANTHRO
	limb_id = SPECIES_ANTHRO

/obj/item/bodypart/leg/left/digitigrade/anthro
	icon_greyscale = BODYPART_ICON_ANTHRO

/obj/item/bodypart/leg/left/digitigrade/anthro/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(limb_id == SPECIES_LIZARD)
		limb_id = SPECIES_ANTHRO

/obj/item/bodypart/leg/right/anthro
	icon_greyscale = BODYPART_ICON_ANTHRO
	limb_id = SPECIES_ANTHRO

/obj/item/bodypart/leg/right/digitigrade/anthro
	icon_greyscale = BODYPART_ICON_ANTHRO

/obj/item/bodypart/leg/right/digitigrade/anthro/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(limb_id == SPECIES_LIZARD)
		limb_id = SPECIES_ANTHRO

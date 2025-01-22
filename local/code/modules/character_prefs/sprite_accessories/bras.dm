//Modular separation of Bras as a separate underwear option that displays below undershirts
/datum/sprite_accessory/bra
	icon = 'local/icons/mob/clothing/underwear.dmi'
	use_static = FALSE
	gender = FEMALE

/datum/sprite_accessory/bra/nude
	name = "Nude"
	icon_state = null
	gender = NEUTER

/datum/sprite_accessory/bra/bra
	name = "Bra"
	icon_state = "bra"

/datum/sprite_accessory/bra/bra_alt
	name = "Bra - Alt"
	icon_state = "bra_alt"

/datum/sprite_accessory/bra/bra_thin
	name = "Bra - Thin"
	icon_state = "bra_thin"

/datum/sprite_accessory/bra/sports_bra
	name = "Bra, Sports"
	icon_state = "sports_bra"

//Presets
/datum/sprite_accessory/bra/lizared
	name = "LIZARED Top"
	icon_state = "lizared_top"
	use_static = TRUE

//Fishnets
/datum/sprite_accessory/bra/fishnet_sleeves
	name = "Fishnet - Sleeved"
	icon_state = "fishnet_sleeves"
	use_static = TRUE

/datum/sprite_accessory/bra/fishnet_base
	name = "Fishnet - Sleeveless"
	icon_state = "fishnet_body"
	use_static = TRUE

/datum/sprite_accessory/bra/fishnet_sleeves/alt
	name = "Fishnet - Sleeved (Greyscale)"
	icon_state = "fishnet_sleeves_alt"
	use_static = FALSE

/datum/sprite_accessory/bra/fishnet_base/alt
	name = "Fishnet - Sleeveless (Greyscale)"
	icon_state = "fishnet_body_alt"
	use_static = FALSE

/datum/sprite_accessory/bra/pasties
	name = "Pasties"
	icon_state = "pasties"

/datum/sprite_accessory/bra/pasties_alt
	name = "Pasties (Alt)"
	icon_state = "pasties_alt"

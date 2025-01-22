//Modular Undershirts
/datum/sprite_accessory/undershirt
	icon = 'local/icons/mob/clothing/underwear.dmi'
	use_static = TRUE
	///Whether this underwear includes a bottom (For Leotards and the likes)
	var/hides_groin = FALSE

/datum/sprite_accessory/undershirt/tank_top_rainbow
	name = "Tank Top - Rainbow"
	icon_state = "tank_rainbow"

/datum/sprite_accessory/undershirt/tank_top_sun
	name = "Tank Top - Sun"
	icon_state = "tank_sun"

/datum/sprite_accessory/undershirt/corset
	name = "Corset"
	icon_state = "corset"
	gender = FEMALE
	hides_groin = TRUE //an undershirt-specific bit of code, so the corset has to be an undershirt... unless you want to refactor it

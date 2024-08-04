/datum/sprite_accessory
	///When the color selection is DNA_COLOR, this is the DNA extension block that is read from a character to get the saved mutant part color.
	var/dna_color
	var/list/color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro
	icon = 'local/icons/mob/mutant/sprite_accessories/tails.dmi'
	dna_color = "dna_tail_color"
	color_channels = SPRITE_ACCESSORY_DUAL_COLOR

/datum/sprite_accessory/tails/anthro/none
	name = "None"
	icon_state = "none"
	color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/fennec
	name = "Fennec (Dual)"
	icon_state = "fennec"

/datum/sprite_accessory/tails/anthro/murid
	name = "Murid (Single)"
	icon_state = "murid"
	color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/murid_two
	name = "Murid Alt (Single)"
	icon_state = "murid_two"
	color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/shark
	name = "Shark (Single)"
	icon_state = "shark"
	color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/hawk
	name = "Hawk (Dual)"
	icon_state = "hawk"

/datum/sprite_accessory/tails/anthro/otie
	name = "Otie (Single)"
	icon_state = "otie"
	color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/australian_shepherd
	name = "Australian Shepherd (Dual)"
	icon_state = "australianshepherd"

/datum/sprite_accessory/tails/anthro/wah
	name = "Wah (Dual)"
	icon_state = "wah"

/datum/sprite_accessory/tails/anthro/guilmon
	name = "Guilmon (Single)"
	icon_state = "guilmon"
	color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/rabbit
	name = "Rabbit (Single)"
	icon_state = "rabbit"
	color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/sabresun
	name = "Sabresun (Dual)"
	icon_state = "sabresun"

/datum/sprite_accessory/tails/anthro/sergal
	name = "Sergal (Dual)"
	icon_state = "sergal"

/datum/sprite_accessory/tails/anthro/tiger
	name = "Tiger (Triple)"
	icon_state = "tiger"
	color_channels = SPRITE_ACCESSORY_DUAL_COLOR

/datum/sprite_accessory/tails/anthro/eevee
	name = "Eevee (Dual)"
	icon_state = "eevee"

/datum/sprite_accessory/tails/anthro/husky
	name = "Husky (Dual)"
	icon_state = "husky"
/datum/sprite_accessory/tails/anthro/leopard
	name = "Leopard (Tertiary Conversion)"
	icon_state = "leopard"

/datum/sprite_accessory/frills
	dna_color = "dna_frills_color"

/datum/sprite_accessory/snouts
	dna_color = "dna_snout_color"

/datum/sprite_accessory
	///When the color selection is DNA_COLOR, this is the DNA extension block that is read from a character to get the saved mutant part color.
	var/dna_color

/datum/sprite_accessory/tails/anthro
	icon = 'local/icons/mob/mutant/sprite_accessories/tails.dmi'
	dna_color = "dna_tail_color"

/datum/sprite_accessory/tails/anthro/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/tails/anthro/fennec
	name = "Fennec"
	icon_state = "fennec"

/datum/sprite_accessory/tails/anthro/kitsune
	name = "Kitsune"
	icon_state = "kitsune"

/datum/sprite_accessory/frills
	dna_color = "dna_frills_color"

/datum/sprite_accessory/snouts
	dna_color = "dna_snout_color"

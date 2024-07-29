/datum/sprite_accessory
	///When the color selection is DNA_COLOR, this is the DNA extension block that is read from a character to get the saved mutant part color.
	var/dna_color

/datum/sprite_accessory/tails/anthro
	icon = 'local/icons/mob/mutant/sprite_accessories/tails.dmi'
	dna_color = "dna_tail_color"
	color_src = DNA_COLOR

/datum/bodypart_overlay/mutant/override_color(obj/item/bodypart/bodypart_owner)
	if(!ishuman(bodypart_owner.owner))
		return
	var/mob/living/carbon/human/human_owner = bodypart_owner.owner
	var/dna_color
	var/dna_feature = human_owner.dna.features[sprite_datum.dna_color]
	if(islist(dna_feature))
		dna_color = dna_feature[1]
	else
		dna_color = dna_feature
	if(!dna_color)
		debug_effigy("bodypart overlay [src] has no DNA color, using fallback.", PREF)
		dna_color = "#66CCFF"
		return dna_color

	debug_effigy("bodypart overlay [src] using DNA color [dna_color]", PREF)
	return dna_color

/datum/bodypart_overlay/mutant/frills
	color_source = ORGAN_COLOR_OVERRIDE

/datum/bodypart_overlay/mutant/snout
	color_source = ORGAN_COLOR_OVERRIDE

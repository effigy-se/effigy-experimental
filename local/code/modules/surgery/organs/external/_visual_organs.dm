/datum/bodypart_overlay/mutant/override_color(obj/item/bodypart/bodypart_owner)
	if(!ishuman(bodypart_owner.owner))
		return
	var/mob/living/carbon/human/human_owner = bodypart_owner.owner
	var/dna_color
	var/dna_feature = human_owner.dna.features[sprite_datum.dna_color]
	if(islist(dna_feature))
		//switch(component_layer)
		//	if(EXTERNAL_ADJACENT)
		dna_color = dna_feature[1]
		//	if(EXTERNAL_FRONT)
		//		dna_color = dna_feature[2]
		//	if(EXTERNAL_BEHIND)
		//		dna_color = dna_feature[3]
		//	else
		//		dna_color = dna_feature[1]
	else
		dna_color = dna_feature

	if(!dna_color)
		debug_effigy("bodypart overlay [src] has no DNA color, using fallback.", PREF)
		dna_color = "#66CCFF"
		return dna_color

	debug_effigy("bodypart overlay [src] found DNA color [dna_color]", PREF)
	return dna_color

/// Colors the given overlays list. bodypart_owner can be null.
/// This is different from the base procs as it allows for multiple overlays to be colored at once.
/// Useful for matrixed color mutant bodyparts.
/datum/bodypart_overlay/mutant/proc/color_overlays(list/image/overlays, layer, obj/item/bodypart/bodypart_owner)
	if(!sprite_datum || !overlays)
		return

	if(bodypart_owner?.is_husked)
		if(sprite_datum.color_src == DNA_INDEX_COLOR)
			draw_color = "#AAA" //HUSK_COLOR_LIST
		else
			draw_color = "#AAA" //The gray husk color

	var/i = 1 // Starts at 1 for color layers.

	for(var/index_to_color in eligible_indexes)
		if(index_to_color > length(overlays))
			break

		var/image/overlay = overlays[index_to_color]

		switch(sprite_datum.color_src)
			if(DNA_SOLO_COLOR)
				overlay.color = islist(draw_color) ? draw_color[i] : draw_color
				//overlay.alpha = alpha
			if(DNA_INDEX_COLOR)
				overlay.color = islist(draw_color) ? draw_color[i] : draw_color
				//overlay.alpha = alpha
				i++
			else
				overlay.color = bodypart_owner?.color
				//overlay.alpha = alpha


/datum/bodypart_overlay/mutant/frills
	color_source = ORGAN_COLOR_OVERRIDE

/datum/bodypart_overlay/mutant/snout
	color_source = ORGAN_COLOR_OVERRIDE

/datum/bodypart_overlay/mutant/cat_ears
	color_source = ORGAN_COLOR_OVERRIDE

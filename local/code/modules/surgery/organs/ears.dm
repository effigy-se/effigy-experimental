/datum/species/regenerate_organs(mob/living/carbon/target, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE)
	. = ..()
	if(target.dna.features["ears"] && !(type in GLOB.species_blacklist_no_mutant))
		if(target.dna.ear_type == NO_EARS)
			return .
		else if(target.dna.features["ears"] != /datum/sprite_accessory/ears/none::name && target.dna.features["ears"] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/organ_path = text2path("/obj/item/organ/ears/[target.dna.ear_type]")
			var/obj/item/organ/replacement = SSwardrobe.provide_type(organ_path)
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .

/// Bunny ears
//
/obj/item/organ/ears/anthro
	preference = "feature_anthro_ears"
	bodypart_overlay = /datum/bodypart_overlay/mutant/ears/anthro

/datum/bodypart_overlay/mutant/ears/anthro/get_global_feature_list()
	return SSaccessories.ears_list_anthro

/datum/species/regenerate_organs(mob/living/carbon/organ_holder, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE)
	. = ..()
	if(organ_holder.dna.features["ears"] && !(type in GLOB.species_blacklist_no_mutant))
		if(organ_holder.dna.ear_type == NO_EARS)
			return .
		else if(organ_holder.dna.features["ears"] != /datum/sprite_accessory/ears/none::name && organ_holder.dna.features["ears"] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/organ_path = text2path("/obj/item/organ/ears/[organ_holder.dna.ear_type]")
			var/obj/item/organ/replacement = SSwardrobe.provide_type(organ_path)
			replacement.Insert(organ_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .

/// Overwrite lives here
//	This is for the triple color channel
/datum/bodypart_overlay/mutant/ears
	layers = EXTERNAL_FRONT | EXTERNAL_FRONT_SECONDARY | EXTERNAL_FRONT_TERTIARY | EXTERNAL_ADJACENT | EXTERNAL_ADJACENT_SECONDARY | EXTERNAL_ADJACENT_TERTIARY | EXTERNAL_BEHIND | EXTERNAL_BEHIND_SECONDARY | EXTERNAL_BEHIND_TERTIARY
	feature_key = "ears"
	sprite_accessory_key = "ears"

/datum/bodypart_overlay/mutant/ears/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(limb == null)
		return ..()
	if(limb.owner == null)
		return ..()
	if(draw_layer == bitflag_to_layer(EXTERNAL_FRONT))
		overlay.color = limb.owner.dna.features["ears_tri_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT))
		overlay.color = limb.owner.dna.features["ears_tri_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND))
		overlay.color = limb.owner.dna.features["ears_tri_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_FRONT_SECONDARY))
		overlay.color = limb.owner.dna.features["ears_tri_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_SECONDARY))
		overlay.color = limb.owner.dna.features["ears_tri_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_SECONDARY))
		overlay.color = limb.owner.dna.features["ears_tri_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_FRONT_TERTIARY))
		overlay.color = limb.owner.dna.features["ears_tri_3"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_TERTIARY))
		overlay.color = limb.owner.dna.features["ears_tri_3"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_TERTIARY))
		overlay.color = limb.owner.dna.features["ears_tri_3"]
		return overlay
	return ..()

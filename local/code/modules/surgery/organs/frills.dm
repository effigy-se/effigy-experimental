/datum/bodypart_overlay/mutant/frills
	layers = EXTERNAL_ADJACENT | EXTERNAL_ADJACENT_SECONDARY | EXTERNAL_ADJACENT_TERTIARY

/datum/bodypart_overlay/mutant/frills/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(limb == null)
		return ..()
	if(limb.owner == null)
		return ..()
	if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT))
		overlay.color = limb.owner.dna.features["frills_tri_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_SECONDARY))
		overlay.color = limb.owner.dna.features["frills_tri_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_TERTIARY))
		overlay.color = limb.owner.dna.features["frills_tri_3"]
		return overlay
	return ..()

/datum/species/regenerate_organs(mob/living/carbon/organ_holder, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE)
	. = ..()
	if(organ_holder.dna.features["frills"])
		if(organ_holder.dna.features["frills"] != /datum/sprite_accessory/frills/none::name && organ_holder.dna.features["frills"] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/frills)
			replacement.Insert(organ_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .
	var/obj/item/organ/old_part = organ_holder.get_organ_slot(ORGAN_SLOT_EXTERNAL_FRILLS)
	if(old_part)
		old_part.Remove(organ_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		old_part.moveToNullspace()

/obj/item/organ/external/neck_fluff
	name = "fluff"
	desc = "Real fluffy."
	icon_state = "random_fly_1"
	preference = "feature_neck_fluff"
	bodypart_overlay = /datum/bodypart_overlay/mutant/neck_fluff
	organ_flags = ORGAN_UNREMOVABLE
	slot = ORGAN_SLOT_EXTERNAL_FLUFF
	dna_block = DNA_FRILLS_BLOCK

/datum/bodypart_overlay/mutant/neck_fluff
	feature_key = "neck_fluff"
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT

/datum/bodypart_overlay/mutant/neck_fluff/get_global_feature_list()
	return SSaccessories.neck_fluff_list

/datum/species/regenerate_organs(mob/living/carbon/organ_holder, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE)
	. = ..()
	if(organ_holder.dna.features["neck_fluff"])
		if(organ_holder.dna.features["neck_fluff"] != /datum/sprite_accessory/fluff/none::name && organ_holder.dna.features["neck_fluff"] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/external/neck_fluff)
			replacement.Insert(organ_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .
	var/obj/item/organ/old_part = organ_holder.get_organ_slot(ORGAN_SLOT_EXTERNAL_FLUFF)
	if(old_part)
		old_part.Remove(organ_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		old_part.moveToNullspace()

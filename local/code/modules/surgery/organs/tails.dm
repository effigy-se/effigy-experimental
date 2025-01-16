/datum/bodypart_overlay/mutant/tail
	layers = EXTERNAL_FRONT | EXTERNAL_FRONT_SECONDARY | EXTERNAL_FRONT_TERTIARY | EXTERNAL_BEHIND | EXTERNAL_BEHIND_SECONDARY | EXTERNAL_BEHIND_TERTIARY
	sprite_accessory_key = "tail"

/datum/bodypart_overlay/mutant/tail/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(limb == null)
		return ..()
	if(limb.owner == null)
		return ..()
	if(draw_layer == bitflag_to_layer(EXTERNAL_FRONT))
		overlay.color = limb.owner.dna.features["tail_tri_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND))
		overlay.color = limb.owner.dna.features["tail_tri_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_FRONT_SECONDARY))
		overlay.color = limb.owner.dna.features["tail_tri_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_SECONDARY))
		overlay.color = limb.owner.dna.features["tail_tri_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_FRONT_TERTIARY))
		overlay.color = limb.owner.dna.features["tail_tri_3"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_TERTIARY))
		overlay.color = limb.owner.dna.features["tail_tri_3"]
		return overlay
	return ..()

/datum/bodypart_overlay/mutant/tail/anthro
	feature_key = "tail_other"

/datum/bodypart_overlay/mutant/tail/anthro/get_global_feature_list()
	return SSaccessories.tails_list_anthro

/obj/item/organ/tail/anthro
	name = "anthro tail"
	desc = "debug nya"
	preference = "feature_anthro_tail"
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/anthro
	dna_block = DNA_TAIL_BLOCK

/datum/species/regenerate_organs(mob/living/carbon/organ_holder, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE)
	. = ..()
	if(organ_holder == null)
		return
	if(!ishuman(organ_holder))
		return

	if(organ_holder.dna.features["tail_lizard"] != /datum/sprite_accessory/tails/lizard/none::name && organ_holder.dna.features["tail_lizard"] != /datum/sprite_accessory/blank::name)
		var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/tail/lizard)
		replacement.Insert(organ_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		return .

	else if(organ_holder.dna.features["tail_cat"] != /datum/sprite_accessory/tails/felinid/cat/none::name && organ_holder.dna.features["tail_cat"] != /datum/sprite_accessory/blank::name)
		var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/tail/cat)
		replacement.Insert(organ_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		return .

	else if(organ_holder.dna.features["fish_tail"] != /datum/sprite_accessory/tails/fish/none::name && organ_holder.dna.features["fish_tail"] != /datum/sprite_accessory/blank::name)
		var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/tail/fish)
		replacement.Insert(organ_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		return .

	else if(organ_holder.dna.features["tail_monkey"] != /datum/sprite_accessory/tails/monkey/none::name && organ_holder.dna.features["tail_monkey"] != /datum/sprite_accessory/blank::name)
		var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/tail/monkey)
		replacement.Insert(organ_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		return .

	else if((organ_holder.dna.features["tail_other"] != /datum/sprite_accessory/tails/lizard/none::name && organ_holder.dna.features["tail_other"] != /datum/sprite_accessory/blank::name) && (organ_holder.dna.tail_type != NO_TAIL))
		var/obj/item/organ/organ_path = text2path("/obj/item/organ/tail/[organ_holder.dna.tail_type]")
		var/obj/item/organ/replacement = SSwardrobe.provide_type(organ_path)
		replacement.Insert(organ_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		return .

	var/obj/item/organ/tail/old_tail = organ_holder.get_organ_slot(ORGAN_SLOT_EXTERNAL_TAIL)
	if(istype(old_tail))
		old_tail.Remove(organ_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		old_tail.moveToNullspace()

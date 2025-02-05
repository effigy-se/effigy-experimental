/obj/item/organ/breasts
	name = "breasts"
	desc = "Super-effective at deterring ice dragons."
	icon = 'local/icons/obj/medical/organs/organs.dmi'
	icon_state = "breasts"

	slot = ORGAN_SLOT_EXTERNAL_CHEST
	zone = BODY_ZONE_CHEST

	preference = "feature_ext_chest"

	dna_block = DNA_CHEST_BLOCK
	restyle_flags = EXTERNAL_RESTYLE_FLESH

	bodypart_overlay = /datum/bodypart_overlay/mutant/ext_chest

/datum/bodypart_overlay/mutant/ext_chest
	feature_key = "ext_chest"
	layers = EXTERNAL_ADJACENT | EXTERNAL_ADJACENT_2 | EXTERNAL_ADJACENT_3 | EXTERNAL_BEHIND | EXTERNAL_BEHIND_2 | EXTERNAL_BEHIND_3

	var/visibility = ORGAN_VISIBILITY_MODE_NORMAL

	var/organ_slot = ORGAN_SLOT_EXTERNAL_CHEST

	var/baselayer = UNIFORM_LAYER
	var/offset1 = 0.09
	var/offset2 = 0.08
	var/offset3 = 0.07

/datum/bodypart_overlay/mutant/ext_chest/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(visibility == ORGAN_VISIBILITY_MODE_NORMAL)
		if((human.undershirt != "Nude" && !(human.underwear_visibility & UNDERWEAR_HIDE_SHIRT)) || (human.bra != "Nude" && !(human.underwear_visibility & UNDERWEAR_HIDE_BRA)))
			return FALSE
		if((human.w_uniform && human.w_uniform.body_parts_covered & CHEST) || (human.wear_suit && human.wear_suit.body_parts_covered & CHEST))
			return FALSE
		if(human.underwear != "Nude" && !(human.underwear_visibility & UNDERWEAR_HIDE_UNDIES))
			var/datum/sprite_accessory/underwear/worn_underwear = SSaccessories.underwear_list[human.underwear]
			if(worn_underwear.hides_breasts)
				return FALSE
		return TRUE
	else
		var/vis = visibility == ORGAN_VISIBILITY_MODE_ALWAYS_SHOW ? TRUE : FALSE
		return vis

/datum/bodypart_overlay/mutant/ext_chest/get_global_feature_list()
	return SSaccessories.ext_chest_list

/datum/bodypart_overlay/mutant/ext_chest/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(limb.owner == null)
		return ..()
	if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT))
		overlay.color = limb.owner.dna.features["ext_chest_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND))
		overlay.color = limb.owner.dna.features["ext_chest_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_2))
		overlay.color = limb.owner.dna.features["ext_chest_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_2))
		overlay.color = limb.owner.dna.features["ext_chest_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_3))
		overlay.color = limb.owner.dna.features["ext_chest_color_3"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_3))
		overlay.color = limb.owner.dna.features["ext_chest_color_3"]
		return overlay
	return ..()

/datum/bodypart_overlay/mutant/ext_chest/mutant_bodyparts_layertext(layer)
	if(layer == -(baselayer + offset1))
		return "ADJ"
	if(layer == -(baselayer + offset2))
		return "ADJ_2"
	if(layer == -(baselayer + offset3))
		return "ADJ_3"
	return ..()

/datum/bodypart_overlay/mutant/ext_chest/bitflag_to_layer(layer)
	switch(layer)
		if(EXTERNAL_ADJACENT)
			return -(baselayer + offset1)
		if(EXTERNAL_ADJACENT_2)
			return -(baselayer + offset2)
		if(EXTERNAL_ADJACENT_3)
			return -(baselayer + offset3)
	return ..()

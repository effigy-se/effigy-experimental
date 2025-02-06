/obj/item/organ/penis
	name = "penis"
	desc = "If clothing doesn't cover it, it shows up!"
	icon = 'local/icons/obj/medical/organs/organs.dmi'
	icon_state = "penis"

	slot = ORGAN_SLOT_EXTERNAL_GROIN_Y1
	zone = BODY_ZONE_PRECISE_GROIN

	preference = "feature_ext_groin_y1"

	dna_block = DNA_GROIN_Y1_BLOCK
	restyle_flags = EXTERNAL_RESTYLE_FLESH

	bodypart_overlay = /datum/bodypart_overlay/mutant/ext_groin_y1

/datum/bodypart_overlay/mutant/ext_groin_y1
	feature_key = "ext_groin_y1"
	layers = EXTERNAL_ADJACENT | EXTERNAL_ADJACENT_2 | EXTERNAL_ADJACENT_3 | EXTERNAL_BEHIND | EXTERNAL_BEHIND_2 | EXTERNAL_BEHIND_3

	var/visibility = ORGAN_VISIBILITY_MODE_NORMAL

	var/organ_slot = ORGAN_SLOT_EXTERNAL_GROIN_Y1

	var/baselayer = UNIFORM_LAYER
	var/offset1 = 0.03
	var/offset2 = 0.02
	var/offset3 = 0.01

/datum/bodypart_overlay/mutant/ext_groin_y1/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(visibility == ORGAN_VISIBILITY_MODE_NORMAL)
		if(human.underwear != "Nude" && !(human.underwear_visibility & UNDERWEAR_HIDE_UNDIES))
			return FALSE
		if((human.w_uniform && human.w_uniform.body_parts_covered & GROIN) || (human.wear_suit && human.wear_suit.body_parts_covered & GROIN))
			return FALSE
		return TRUE
	else
		var/vis = visibility == ORGAN_VISIBILITY_MODE_ALWAYS_SHOW ? TRUE : FALSE
		return vis

/datum/bodypart_overlay/mutant/ext_groin_y1/get_global_feature_list()
	return SSaccessories.ext_groin_y1_list

/datum/bodypart_overlay/mutant/ext_groin_y1/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(limb.owner == null)
		return ..()
	if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT))
		overlay.color = limb.owner.dna.features["ext_groin_y1_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND))
		overlay.color = limb.owner.dna.features["ext_groin_y1_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_2))
		overlay.color = limb.owner.dna.features["ext_groin_y1_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_2))
		overlay.color = limb.owner.dna.features["ext_groin_y1_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_3))
		overlay.color = limb.owner.dna.features["ext_groin_y1_color_3"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_3))
		overlay.color = limb.owner.dna.features["ext_groin_y1_color_3"]
		return overlay
	return ..()

/datum/bodypart_overlay/mutant/ext_groin_y1/mutant_bodyparts_layertext(layer)
	if(layer == -(baselayer + offset1))
		return "ADJ"
	if(layer == -(baselayer + offset2))
		return "ADJ_2"
	if(layer == -(baselayer + offset3))
		return "ADJ_3"
	return ..()

/datum/bodypart_overlay/mutant/ext_groin_y1/bitflag_to_layer(layer)
	switch(layer)
		if(EXTERNAL_ADJACENT)
			return -(baselayer + offset1)
		if(EXTERNAL_ADJACENT_2)
			return -(baselayer + offset2)
		if(EXTERNAL_ADJACENT_3)
			return -(baselayer + offset3)
	return ..()

/obj/item/organ/balls
	name = "balls"
	desc = "From the hit TV show 'Ow, my balls!'"
	icon = 'local/icons/obj/medical/organs/organs.dmi'
	icon_state = "balls"

	slot = ORGAN_SLOT_EXTERNAL_GROIN_Y2
	zone = BODY_ZONE_PRECISE_GROIN

	preference = "feature_ext_groin_y2"

	dna_block = DNA_GROIN_Y2_BLOCK
	restyle_flags = EXTERNAL_RESTYLE_FLESH

	bodypart_overlay = /datum/bodypart_overlay/mutant/ext_groin_y2

/datum/bodypart_overlay/mutant/ext_groin_y2
	feature_key = "ext_groin_y2"
	layers = EXTERNAL_ADJACENT | EXTERNAL_ADJACENT_2 | EXTERNAL_ADJACENT_3 | EXTERNAL_BEHIND | EXTERNAL_BEHIND_2 | EXTERNAL_BEHIND_3

	var/visibility = ORGAN_VISIBILITY_MODE_NORMAL

	var/organ_slot = ORGAN_SLOT_EXTERNAL_GROIN_Y2

	var/baselayer = UNIFORM_LAYER
	var/offset1 = 0.06
	var/offset2 = 0.05
	var/offset3 = 0.04

/datum/bodypart_overlay/mutant/ext_groin_y2/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(visibility == ORGAN_VISIBILITY_MODE_NORMAL)
		if(human.underwear != "Nude" && !(human.underwear_visibility & UNDERWEAR_HIDE_UNDIES))
			return FALSE
		if((human.w_uniform && human.w_uniform.body_parts_covered & GROIN) || (human.wear_suit && human.wear_suit.body_parts_covered & GROIN))
			return FALSE
		return TRUE
	else
		var/vis = visibility == ORGAN_VISIBILITY_MODE_ALWAYS_SHOW ? TRUE : FALSE
		return vis

/datum/bodypart_overlay/mutant/ext_groin_y2/get_global_feature_list()
	return SSaccessories.ext_groin_y2_list

/datum/bodypart_overlay/mutant/ext_groin_y2/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(limb.owner == null)
		return ..()
	if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT))
		overlay.color = limb.owner.dna.features["ext_groin_y2_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND))
		overlay.color = limb.owner.dna.features["ext_groin_y2_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_2))
		overlay.color = limb.owner.dna.features["ext_groin_y2_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_2))
		overlay.color = limb.owner.dna.features["ext_groin_y2_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_3))
		overlay.color = limb.owner.dna.features["ext_groin_y2_color_3"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_3))
		overlay.color = limb.owner.dna.features["ext_groin_y2_color_3"]
		return overlay
	return ..()

/datum/bodypart_overlay/mutant/ext_groin_y2/mutant_bodyparts_layertext(layer)
	if(layer == -(baselayer + offset1))
		return "ADJ"
	if(layer == -(baselayer + offset2))
		return "ADJ_2"
	if(layer == -(baselayer + offset3))
		return "ADJ_3"
	return ..()

/datum/bodypart_overlay/mutant/ext_groin_y2/bitflag_to_layer(layer)
	switch(layer)
		if(EXTERNAL_ADJACENT)
			return -(baselayer + offset1)
		if(EXTERNAL_ADJACENT_2)
			return -(baselayer + offset2)
		if(EXTERNAL_ADJACENT_3)
			return -(baselayer + offset3)
	return ..()

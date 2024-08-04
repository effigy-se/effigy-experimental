/datum/bodypart_overlay
	var/component_layer

/datum/bodypart_overlay/get_overlay(layer, obj/item/bodypart/limb)
	. = ..()
	component_layer = layer

/datum/bodypart_overlay/mutant/color_image(image/overlay, layer, obj/item/bodypart/limb)
	if(color_source & ORGAN_COLOR_OVERRIDE)
		overlay.color = override_color(limb)
	else
		overlay.color = sprite_datum.color_src ? draw_color : null

///Converts a bitflag to the right layer. I'd love to make this a static index list, but byond made an attempt on my life when i did
/datum/bodypart_overlay/bitflag_to_layer(layer)
	switch(layer)
		if(EXTERNAL_BEHIND, EXTERNAL_BEHIND_SECONDARY, EXTERNAL_BEHIND_TERTIARY)
			return -BODY_BEHIND_LAYER
		if(EXTERNAL_ADJACENT, EXTERNAL_ADJACENT_SECONDARY, EXTERNAL_ADJACENT_TERTIARY)
			return -BODY_ADJ_LAYER
		if(EXTERNAL_FRONT, EXTERNAL_FRONT_SECONDARY, EXTERNAL_FRONT_TERTIARY)
			return -BODY_FRONT_LAYER

/**This exists so sprite accessories can still be per-layer without having to include that layer's
*  number in their sprite name, which causes issues when those numbers change.
*/
/datum/bodypart_overlay/proc/bitflag_to_layertext(layer)
	switch(layer)
		if(EXTERNAL_BEHIND)
			return "BEHIND_primary"
		if(EXTERNAL_BEHIND_SECONDARY)
			return "BEHIND_secondary"
		if(EXTERNAL_BEHIND_TERTIARY)
			return "BEHIND_tertiary"
		if(EXTERNAL_ADJACENT)
			return "ADJ_primary"
		if(EXTERNAL_ADJACENT_SECONDARY)
			return "ADJ_secondary"
		if(EXTERNAL_ADJACENT_TERTIARY)
			return "ADJ_tertiary"
		if(EXTERNAL_FRONT)
			return "FRONT_primary"
		if(EXTERNAL_FRONT_SECONDARY)
			return "FRONT_secondary"
		if(EXTERNAL_FRONT_TERTIARY)
			return "FRONT_tertiary"

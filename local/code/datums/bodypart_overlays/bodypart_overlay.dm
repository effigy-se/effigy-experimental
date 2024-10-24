/datum/bodypart_overlay/mutant
	/// Sprite accessory type we're associated with
	var/sprite_accessory_key = null

/**This exists so sprite accessories can still be per-layer without having to include that layer's
*  number in their sprite name, which causes issues when those numbers change.
*/
/datum/bodypart_overlay/proc/mutant_bodyparts_layertext(layer)
	switch(layer)
		if(-BODY_BEHIND_LAYER)
			return "BEHIND"
		if(-BODY_ADJ_LAYER)
			return "ADJ"
		if(-BODY_FRONT_LAYER)
			return "FRONT"
		if(-BODY_BEHIND_LAYER_SECONDARY)
			return "BEHIND_2"
		if(-BODY_ADJ_LAYER_SECONDARY)
			return "ADJ_2"
		if(-BODY_FRONT_LAYER_SECONDARY)
			return "FRONT_2"
		if(-BODY_BEHIND_LAYER_TERTIARY)
			return "BEHIND_3"
		if(-BODY_ADJ_LAYER_TERTIARY)
			return "ADJ_3"
		if(-BODY_FRONT_LAYER_TERTIARY)
			return "FRONT_3"

///Converts a bitflag to the right layer. I'd love to make this a static index list, but byond made an attempt on my life when i did
/datum/bodypart_overlay/proc/bitflag_to_layer(layer)
	switch(layer)
		if(EXTERNAL_BEHIND)
			return -BODY_BEHIND_LAYER
		if(EXTERNAL_ADJACENT)
			return -BODY_ADJ_LAYER
		if(EXTERNAL_FRONT)
			return -BODY_FRONT_LAYER
		if(EXTERNAL_BEHIND_SECONDARY)
			return -BODY_BEHIND_LAYER_SECONDARY
		if(EXTERNAL_ADJACENT_SECONDARY)
			return -BODY_ADJ_LAYER_SECONDARY
		if(EXTERNAL_FRONT_SECONDARY)
			return -BODY_FRONT_LAYER_SECONDARY
		if(EXTERNAL_BEHIND_TERTIARY)
			return -BODY_BEHIND_LAYER_TERTIARY
		if(EXTERNAL_ADJACENT_TERTIARY)
			return -BODY_ADJ_LAYER_TERTIARY
		if(EXTERNAL_FRONT_TERTIARY)
			return -BODY_FRONT_LAYER_TERTIARY

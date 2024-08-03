/datum/bodypart_overlay
	var/component_layer

/datum/bodypart_overlay/get_overlay(layer, obj/item/bodypart/limb)
	. = ..()
	component_layer = layer

/**This exists so sprite accessories can still be per-layer without having to include that layer's
*  number in their sprite name, which causes issues when those numbers change.
*/
/datum/bodypart_overlay/proc/bitflag_to_layertext(layer)
	switch(layer)
		if(EXTERNAL_BEHIND)
			return "BEHIND"
		if(EXTERNAL_ADJACENT)
			return "ADJ"
		if(EXTERNAL_FRONT)
			return "FRONT"

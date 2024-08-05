/datum/bodypart_overlay
	var/list/eligible_indexes
	/// A simple cache of what the last icon_states built were. It's really only there to help with debugging what's happening.
	var/list/last_built_icon_states

/datum/bodypart_overlay/mutant/get_overlay(layer, obj/item/bodypart/bodypart_owner)
	//inherit_color(limb) // If draw_color is not set yet, go ahead and do that
	//return ..()

	layer = bitflag_to_layer(layer)
	. = get_layers(layer, bodypart_owner)
	color_overlays(., layer, bodypart_owner)

/// Get the images we need to draw on the person. Called from get_overlay() which is called from _bodyparts.dm.
/// `bodypart_owner` can be null.
/// This is different from the base procs as it allows for multiple overlays to
/// be generated for one bodypart_overlay. Useful for matrixed color mutant bodyparts.
/datum/bodypart_overlay/mutant/proc/get_layers(image_layer, obj/item/bodypart/bodypart_owner)
	if(!sprite_datum)
		CRASH("Trying to call get_images() on [type] while it didn't have a sprite_datum. This shouldn't happen, report it as soon as possible.")

	var/finished_layers = list()
	var/gender = (bodypart_owner?.limb_gender == FEMALE) ? "f" : "m"

	eligible_indexes = list()
	var/current_index = 1

	var/mob/living/carbon/human/owner = bodypart_owner?.owner

	last_built_icon_states = list()

	switch(sprite_datum.color_src)
		if(DNA_INDEX_COLOR)
			var/list/color_channels = get_color_channels(build_icon_state(gender, image_layer))
			for(var/color_index in color_channels)
				var/mutable_appearance/color_channel_image = get_singular_image(build_icon_state(gender, image_layer, color_channels[color_index]), image_layer, owner)
				finished_layers += color_channel_image
				eligible_indexes += current_index
				current_index++
		else
			var/mutable_appearance/layer_images = get_singular_image(build_icon_state(gender, image_layer), image_layer, owner)
			finished_layers = list(layer_images)
			eligible_indexes += current_index

	//if(sprite_datum.hasinner)
	//	finished_layers += get_singular_image(build_icon_state(gender, image_layer, feature_key_suffix = "inner"), image_layer, owner)


	return finished_layers

/datum/bodypart_overlay/mutant/proc/get_color_channels(icon_state_to_lookup)
	return sprite_datum.color_channels

/**
 * Helper to fetch the `feature_key` of the bodypart_overlay, so that it can be
 * overriden in the cases where `feature_key` is not what we want to use here.
 */
/datum/bodypart_overlay/mutant/proc/get_feature_key_for_overlay()
	return feature_key

/**
 * Helper to generate one individual image for a multi-image overlay.
 * Very similar to get_image(), just a little simplified.
 *
 * Arguments:
 * * image_icon_state - The icon_state of the mutable_appearance we want to get.
 * * image_layer - The layer of the mutable_appearance we want to get.
 * * owner - The owner of the limb this is drawn on. Can be null.
 * * icon_override - The icon to use for the mutable_appearance, rather than
 * `sprite_datum.icon`. Default is `null`, and its value will be used if it's
 * anything else.
 */
/datum/bodypart_overlay/mutant/proc/get_singular_image(image_icon_state, image_layer, mob/living/carbon/human/owner, icon_override = null)
	// We get from icon_override if it is filled, and from sprite_datum.icon if not.
	var/mutable_appearance/appearance = mutable_appearance(icon_override || sprite_datum.icon, image_icon_state, layer = image_layer)

	if(sprite_datum.center)
		center_image(appearance, sprite_datum.dimension_x, sprite_datum.dimension_y)

	return appearance

/**
 * Helper to generate the icon_state for the bodypart_overlay we're trying to draw.
 *
 * Arguments:
 * * gender - The gender of the limb. Can be "f" or "m".
 * * image_layer - The layer on which the icon will be drawn.
 * * color_layer - The color_layer of this icon_state, if any. Should be either "primary", "secondary", "tertiary" or `null`.
 * Defaults to `null`.
 * * feature_key_suffix - A string that will be directly appended to the result
 * of `get_feature_key_for_overlay()`. Defaults to `null`.
 */
/datum/bodypart_overlay/mutant/proc/build_icon_state(gender, image_layer, color_layer = null, feature_key_suffix = null)
	var/list/icon_state_builder = list()

	icon_state_builder += sprite_datum.gender_specific ? gender : "m" //Male is default because sprite accessories are so ancient they predate the concept of not hardcoding gender
	icon_state_builder += get_feature_key_for_overlay() + feature_key_suffix
	icon_state_builder += get_base_icon_state()
	icon_state_builder += mutant_bodyparts_layertext(image_layer)

	if(color_layer)
		icon_state_builder += color_layer

	var/built_icon_state = icon_state_builder.Join("_")

	LAZYADD(last_built_icon_states, built_icon_state)

	return built_icon_state

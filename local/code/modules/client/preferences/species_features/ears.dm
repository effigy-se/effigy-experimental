/datum/preference/choiced/ears
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Ears"
	should_generate_icons = TRUE

/datum/preference/choiced/ears/icon_for(value)
	return generate_icon_with_ears_accessory(SSaccessories.ears_list[value])

/datum/preference/choiced/ears/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "dna_ear_color"

	return data

/proc/generate_icon_with_ears_accessory(datum/sprite_accessory/sprite_accessory, y_offset = 0)
	var/static/icon/head_icon
	if(isnull(head_icon))
		head_icon = icon('icons/mob/human/bodyparts_greyscale.dmi', "human_head_m", SOUTH)
		var/icon/eyes = icon('icons/mob/human/human_face.dmi', "eyes", SOUTH)
		eyes.Blend(COLOR_GRAY, ICON_MULTIPLY)
		head_icon.Blend(eyes, ICON_OVERLAY)
		head_icon.Blend(skintone2hex("caucasian1"), ICON_MULTIPLY)

	var/icon/final_icon = new(head_icon)
	if(!isnull(sprite_accessory))
		ASSERT(istype(sprite_accessory))

		var/icon/head_accessory_icon = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_ADJ_primary", SOUTH)
		if(y_offset)
			head_accessory_icon.Shift(NORTH, y_offset)
		head_accessory_icon.Blend(COLOR_DARK_BROWN, ICON_MULTIPLY)
		final_icon.Blend(head_accessory_icon, ICON_OVERLAY)

		/*
		if(sprite_accessory.hasinner)
			var/icon/inner_accessory_icon = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_ADJ_secondary", SOUTH)
			if(y_offset)
				inner_accessory_icon.Shift(NORTH, y_offset)
			inner_accessory_icon.Blend(COLOR_DARK_BROWN, ICON_MULTIPLY)
			final_icon.Blend(inner_accessory_icon, ICON_OVERLAY)
		*/

	final_icon.Crop(10, 19, 22, 31)
	final_icon.Scale(32, 32)

	return final_icon

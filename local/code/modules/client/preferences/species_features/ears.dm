/datum/preference/toggle/ears
	savefile_key = "ears_enabled"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/ears/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["ears"] = /datum/sprite_accessory/ears/none::name

/datum/preference/toggle/ears/create_default_value()
	return FALSE

/datum/preference/choiced/ears
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Ears"
	should_generate_icons = TRUE

/datum/preference/choiced/ears/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears::savefile_key

	return data

/datum/preference/choiced/ears/icon_for(value)
	return generate_icon_with_ears_accessory(SSaccessories.ears_list[value])

/datum/preference/choiced/ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/ears_enabled = preferences.read_preference(/datum/preference/toggle/ears)
	if(ears_enabled)
		return TRUE
	return FALSE

/datum/preference/tri_color/ears
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "ears_tri"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/ears/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["ears_tri_1"] = value[1]
	target.dna.features["ears_tri_2"] = value[2]
	target.dna.features["ears_tri_3"] = value[3]

/datum/preference/tri_color/ears/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/ears/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE

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

/datum/preference/choiced/ear_variation
	savefile_key = "ear_type"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/choiced/ear_variation/apply_to_human(mob/living/carbon/human/target, chosen_variation)
	target.dna.ear_type = chosen_variation
	if(chosen_variation == NO_EARS)
		target.dna.features["ears"] = /datum/sprite_accessory/ears/none::name

/datum/preference/choiced/ear_variation/create_default_value()
	return NO_EARS

/datum/preference/choiced/ear_variation/init_possible_values()
	//return list(NO_EARS) + (GLOB.mutant_ears_variations)
	return list(NO_EARS, ANTHRO_EARS)

/datum/preference/choiced/ear_variation/is_accessible(datum/preferences/preferences)
	. = ..()
	var/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species in GLOB.species_blacklist_no_mutant)
		return FALSE

	return TRUE

/datum/preference/choiced/anthro_ears
	savefile_key = "feature_anthro_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/anthro_ears/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.ear_type == ANTHRO_EARS)
		target.dna.features["ears"] = value

/datum/preference/choiced/anthro_ears/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears::savefile_key

	return data

/datum/preference/choiced/anthro_ears/create_default_value()
	return /datum/sprite_accessory/ears/anthro/none::name

/datum/preference/choiced/anthro_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list_anthro[value]
	return generate_ears_icon(chosen_ears)

/datum/preference/choiced/anthro_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list_anthro)

/datum/preference/choiced/anthro_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == ANTHRO_EARS)
		return TRUE
	return FALSE

/// Proc to gen that icon
//	We don't wanna copy paste this
/datum/preference/choiced/proc/generate_ears_icon(chosen_ears)
	var/datum/sprite_accessory/sprite_accessory = chosen_ears
	var/static/icon/final_icon
	final_icon = icon('icons/mob/human/bodyparts_greyscale.dmi', "human_head_m", SOUTH)
	var/icon/eyes = icon('icons/mob/human/human_face.dmi', "eyes", SOUTH)
	eyes.Blend(COLOR_GRAY, ICON_MULTIPLY)
	final_icon.Blend(eyes, ICON_OVERLAY)

	if (sprite_accessory.icon_state != "none")
		var/icon/markings_icon_1 = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_BEHIND", SOUTH)
		markings_icon_1.Blend(COLOR_RED, ICON_MULTIPLY)
		var/icon/markings_icon_2 = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_BEHIND_2", SOUTH)
		markings_icon_2.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
		var/icon/markings_icon_3 = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_BEHIND_3", SOUTH)
		markings_icon_3.Blend(COLOR_BLUE, ICON_MULTIPLY)
		final_icon.Blend(markings_icon_1, ICON_OVERLAY)
		final_icon.Blend(markings_icon_2, ICON_OVERLAY)
		final_icon.Blend(markings_icon_3, ICON_OVERLAY)
		// adj breaker
		var/icon/markings_icon_1_a = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_ADJ", SOUTH)
		markings_icon_1_a.Blend(COLOR_RED, ICON_MULTIPLY)
		var/icon/markings_icon_2_a = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_ADJ_2", SOUTH)
		markings_icon_2_a.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
		var/icon/markings_icon_3_a = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_ADJ_3", SOUTH)
		markings_icon_3_a.Blend(COLOR_BLUE, ICON_MULTIPLY)
		final_icon.Blend(markings_icon_1_a, ICON_OVERLAY)
		final_icon.Blend(markings_icon_2_a, ICON_OVERLAY)
		final_icon.Blend(markings_icon_3_a, ICON_OVERLAY)
		// front breaker
		var/icon/markings_icon_1_f = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_FRONT", SOUTH)
		markings_icon_1_f.Blend(COLOR_RED, ICON_MULTIPLY)
		var/icon/markings_icon_2_f = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_FRONT_2", SOUTH)
		markings_icon_2_f.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
		var/icon/markings_icon_3_f = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_FRONT_3", SOUTH)
		markings_icon_3_f.Blend(COLOR_BLUE, ICON_MULTIPLY)
		final_icon.Blend(markings_icon_1_f, ICON_OVERLAY)
		final_icon.Blend(markings_icon_2_f, ICON_OVERLAY)
		final_icon.Blend(markings_icon_3_f, ICON_OVERLAY)

	final_icon.Crop(11, 20, 23, 32)
	final_icon.Scale(32, 32)

	return final_icon

/*
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
*/

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

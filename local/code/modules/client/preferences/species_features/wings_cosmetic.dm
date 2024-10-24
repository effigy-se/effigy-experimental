/datum/preference/toggle/cosmetic_wings
	savefile_key = "cosmetic_wings_enabled"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/cosmetic_wings/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["wings"] = /datum/sprite_accessory/cosmetic_wings/none::name

/datum/preference/toggle/cosmetic_wings/create_default_value()
	return FALSE

/datum/preference/choiced/cosmetic_wings
	savefile_key = "feature_cosmetic_wings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Wings"

/datum/preference/choiced/cosmetic_wings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["wings"] = value

/datum/preference/choiced/cosmetic_wings/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/wings::savefile_key

	return data

/datum/preference/choiced/cosmetic_wings/create_default_value()
	return /datum/sprite_accessory/cosmetic_wings/harpybat::name

/datum/preference/choiced/cosmetic_wings/icon_for(value)
	return generate_icon_with_wings_accessory(SSaccessories.cosmetic_wings_list[value])

/datum/preference/choiced/cosmetic_wings/init_possible_values()
	return assoc_to_keys_features(SSaccessories.cosmetic_wings_list)

/datum/preference/choiced/cosmetic_wings/is_accessible(datum/preferences/preferences)
	. = ..()
	var/cosmetic_wings_enabled = preferences.read_preference(/datum/preference/toggle/cosmetic_wings)
	if(cosmetic_wings_enabled)
		return TRUE
	return FALSE

/datum/preference/tri_color/wings
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "wings_tri"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/wings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["wings_tri_1"] = value[1]
	target.dna.features["wings_tri_2"] = value[2]
	target.dna.features["wings_tri_3"] = value[3]

/datum/preference/tri_color/wings/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/wings/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE

/proc/generate_icon_with_wings_accessory(datum/sprite_accessory/sprite_accessory, y_offset = 0)
	var/static/icon/tail_icon
	if(isnull(tail_icon))
		tail_icon = icon('icons/mob/human/bodyparts_greyscale.dmi', "blank")

	var/icon/final_icon = new(tail_icon)
	if(!isnull(sprite_accessory))
		ASSERT(istype(sprite_accessory))

		var/icon/tail_accessory_primary = icon(sprite_accessory.icon, "m_wings_[sprite_accessory.icon_state]_BEHIND", SOUTH)
		if(y_offset)
			tail_accessory_primary.Shift(NORTH, y_offset)
		tail_accessory_primary.Blend("#EAEAEA", ICON_MULTIPLY)
		final_icon.Blend(tail_accessory_primary, ICON_OVERLAY)

		var/icon/tail_accessory_secondary = icon(sprite_accessory.icon, "m_wings_[sprite_accessory.icon_state]_BEHIND_2", SOUTH)
		if(!isnull(tail_accessory_secondary))
			if(y_offset)
				tail_accessory_secondary.Shift(NORTH, y_offset)
			tail_accessory_secondary.Blend("#EAEAEA", ICON_MULTIPLY)
			final_icon.Blend(tail_accessory_secondary, ICON_OVERLAY)

		var/icon/tail_accessory_tertiary = icon(sprite_accessory.icon, "m_wings_[sprite_accessory.icon_state]_BEHIND_3", SOUTH)
		if(!isnull(tail_accessory_tertiary))
			if(y_offset)
				tail_accessory_tertiary.Shift(NORTH, y_offset)
			tail_accessory_tertiary.Blend("#EAEAEA", ICON_MULTIPLY)
			final_icon.Blend(tail_accessory_tertiary, ICON_OVERLAY)

	return final_icon

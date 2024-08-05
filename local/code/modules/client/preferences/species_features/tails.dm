/datum/preference/choiced/tail_anthro
	savefile_key = "feature_anthro_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Tail"
	should_generate_icons = TRUE
	relevant_external_organ = /obj/item/organ/external/tail/anthro

/datum/preference/choiced/tail_anthro/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "dna_tail_color"

	return data

/datum/preference/choiced/tail_anthro/icon_for(value)
	return generate_icon_with_tails_accessory(SSaccessories.tails_list_anthro[value])

/datum/preference/choiced/tail_anthro/create_default_value()
	var/datum/sprite_accessory/tails/anthro/tail = /datum/sprite_accessory/tails/anthro/fennec
	return initial(tail.name)

/datum/preference/choiced/tail_anthro/init_possible_values()
	return assoc_to_keys_features(SSaccessories.tails_list_anthro)

/datum/preference/choiced/tail_spineless/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail_anthro"] = value

/proc/generate_icon_with_tails_accessory(datum/sprite_accessory/sprite_accessory, y_offset = 0)
	var/static/icon/tail_icon
	if(isnull(tail_icon))
		tail_icon = icon('icons/mob/human/bodyparts_greyscale.dmi', "blank")

	var/icon/final_icon = new(tail_icon)
	if(!isnull(sprite_accessory))
		ASSERT(istype(sprite_accessory))

		var/icon/tail_accessory_primary = icon(sprite_accessory.icon, "m_tail_anthro_[sprite_accessory.icon_state]_BEHIND_primary", SOUTH)
		if(y_offset)
			tail_accessory_primary.Shift(NORTH, y_offset)
		tail_accessory_primary.Blend("#EAEAEA", ICON_MULTIPLY)
		final_icon.Blend(tail_accessory_primary, ICON_OVERLAY)

		var/icon/tail_accessory_secondary = icon(sprite_accessory.icon, "m_tail_anthro_[sprite_accessory.icon_state]_BEHIND_secondary", SOUTH)
		if(!isnull(tail_accessory_secondary))
			if(y_offset)
				tail_accessory_secondary.Shift(NORTH, y_offset)
			tail_accessory_secondary.Blend("#EAEAEA", ICON_MULTIPLY)
			final_icon.Blend(tail_accessory_secondary, ICON_OVERLAY)

		var/icon/tail_accessory_tertiary = icon(sprite_accessory.icon, "m_tail_anthro_[sprite_accessory.icon_state]_BEHIND_tertiary", SOUTH)
		if(!isnull(tail_accessory_tertiary))
			if(y_offset)
				tail_accessory_tertiary.Shift(NORTH, y_offset)
			tail_accessory_tertiary.Blend("#EAEAEA", ICON_MULTIPLY)
			final_icon.Blend(tail_accessory_tertiary, ICON_OVERLAY)

	return final_icon

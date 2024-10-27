/datum/preference/choiced/tail_variation
	savefile_key = "tail_type"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/choiced/tail_variation/create_default_value()
	return NO_TAIL

/datum/preference/choiced/tail_variation/init_possible_values()
	return list(NO_TAIL, LIZARD_TAIL, ANTHRO_TAIL)

/datum/preference/choiced/tail_variation/is_accessible(datum/preferences/preferences)
	. = ..()
	return TRUE

/datum/preference/choiced/tail_variation/apply_to_human(mob/living/carbon/human/target, chosen_variation)
// Read by the regenerate_organs() proc to know what organ subtype to grant
	target.dna.tail_type = chosen_variation
// Make a beautiful switch list to support the choices
// Luckily for all of us, this list wont get any bigger
	switch(chosen_variation)
		if(NO_TAIL)
			target.dna.features["tail_cat"] = /datum/sprite_accessory/tails/felinid/cat/none::name
			target.dna.features["fish_tail"] = /datum/sprite_accessory/tails/fish/none::name
			target.dna.features["tail_lizard"] = /datum/sprite_accessory/tails/lizard/none::name
			target.dna.features["tail_monkey"] = /datum/sprite_accessory/tails/monkey/none::name
			target.dna.features["tail_other"] = /datum/sprite_accessory/tails/none::name
		if(CAT_TAIL)
			target.dna.features["fish_tail"] = /datum/sprite_accessory/tails/fish/none::name
			target.dna.features["tail_lizard"] = /datum/sprite_accessory/tails/lizard/none::name
			target.dna.features["tail_monkey"] = /datum/sprite_accessory/tails/monkey/none::name
			target.dna.features["tail_other"] = /datum/sprite_accessory/tails/none::name
		if(FISH_TAIL)
			target.dna.features["tail_cat"] = /datum/sprite_accessory/tails/felinid/cat/none::name
			target.dna.features["tail_lizard"] = /datum/sprite_accessory/tails/lizard/none::name
			target.dna.features["tail_monkey"] = /datum/sprite_accessory/tails/monkey/none::name
			target.dna.features["tail_other"] = /datum/sprite_accessory/tails/none::name
		if(LIZARD_TAIL)
			target.dna.features["tail_cat"] = /datum/sprite_accessory/tails/felinid/cat/none::name
			target.dna.features["fish_tail"] = /datum/sprite_accessory/tails/fish/none::name
			target.dna.features["tail_monkey"] = /datum/sprite_accessory/tails/monkey/none::name
			target.dna.features["tail_other"] = /datum/sprite_accessory/tails/none::name
		if(MONKEY_TAIL)
			target.dna.features["tail_cat"] = /datum/sprite_accessory/tails/felinid/cat/none::name
			target.dna.features["fish_tail"] = /datum/sprite_accessory/tails/fish/none::name
			target.dna.features["tail_lizard"] = /datum/sprite_accessory/tails/lizard/none::name
			target.dna.features["tail_other"] = /datum/sprite_accessory/tails/none::name
		else
			target.dna.features["tail_lizard"] = /datum/sprite_accessory/tails/lizard/none::name
			target.dna.features["tail_cat"] = /datum/sprite_accessory/tails/felinid/cat/none::name
			target.dna.features["tail_monkey"] = /datum/sprite_accessory/tails/monkey/none::name
			target.dna.features["fish_tail"] = /datum/sprite_accessory/tails/fish/none::name

/datum/preference/choiced/tail_anthro
	savefile_key = "feature_tail_anthro"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Tail"

/datum/preference/choiced/tail_anthro/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.tail_type == ANTHRO_TAIL)
		target.dna.features["tail_other"] = value

/datum/preference/choiced/tail_anthro/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/tail::savefile_key

	return data

/datum/preference/choiced/tail_anthro/create_default_value()
	return /datum/sprite_accessory/tails/anthro/eevee::name

/datum/preference/choiced/tail_anthro/icon_for(value)
	return generate_icon_with_tails_accessory(SSaccessories.tails_list_anthro[value])

/datum/preference/choiced/tail_anthro/init_possible_values()
	return assoc_to_keys_features(SSaccessories.tails_list_anthro)

/datum/preference/choiced/tail_anthro/is_accessible(datum/preferences/preferences)
	. = ..()
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/tail_variation)
	if(chosen_variation == ANTHRO_TAIL)
		return TRUE
	return FALSE

/datum/preference/tri_color/tail
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "tail_tri"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail_tri_1"] = value[1]
	target.dna.features["tail_tri_2"] = value[2]
	target.dna.features["tail_tri_3"] = value[3]

/datum/preference/tri_color/tail/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/tail/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE

/proc/generate_icon_with_tails_accessory(datum/sprite_accessory/sprite_accessory, y_offset = 0)
	var/static/icon/tail_icon
	if(isnull(tail_icon))
		tail_icon = icon('icons/mob/human/bodyparts_greyscale.dmi', "blank")

	var/icon/final_icon = new(tail_icon)
	if(!isnull(sprite_accessory))
		ASSERT(istype(sprite_accessory))

		var/icon/tail_accessory_primary = icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_BEHIND", SOUTH)
		if(y_offset)
			tail_accessory_primary.Shift(NORTH, y_offset)
		tail_accessory_primary.Blend("#EAEAEA", ICON_MULTIPLY)
		final_icon.Blend(tail_accessory_primary, ICON_OVERLAY)

		var/icon/tail_accessory_secondary = icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_BEHIND_2", SOUTH)
		if(!isnull(tail_accessory_secondary))
			if(y_offset)
				tail_accessory_secondary.Shift(NORTH, y_offset)
			tail_accessory_secondary.Blend("#EAEAEA", ICON_MULTIPLY)
			final_icon.Blend(tail_accessory_secondary, ICON_OVERLAY)

		var/icon/tail_accessory_tertiary = icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_BEHIND_3", SOUTH)
		if(!isnull(tail_accessory_tertiary))
			if(y_offset)
				tail_accessory_tertiary.Shift(NORTH, y_offset)
			tail_accessory_tertiary.Blend("#EAEAEA", ICON_MULTIPLY)
			final_icon.Blend(tail_accessory_tertiary, ICON_OVERLAY)

	return final_icon

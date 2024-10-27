/datum/preference/toggle/horns
	savefile_key = "horns_enabled"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/horns/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["horns"] = /datum/sprite_accessory/horns/none::name

/datum/preference/toggle/horns/create_default_value()
	return FALSE

/datum/preference/choiced/lizard_horns/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/horns::savefile_key

	return data

/datum/preference/choiced/lizard_horns
	category = PREFERENCE_CATEGORY_CLOTHING

/datum/preference/choiced/lizard_horns/create_default_value()
	return /datum/sprite_accessory/horns/none::name

/datum/preference/choiced/lizard_horns/is_accessible(datum/preferences/preferences)
	. = ..()
	var/horns_enabled = preferences.read_preference(/datum/preference/toggle/horns)
	if(horns_enabled)
		return TRUE
	return FALSE

/datum/preference/tri_color/horns
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "horns_tri"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/horns/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["horns_tri_1"] = value[1]
	target.dna.features["horns_tri_2"] = value[2]
	target.dna.features["horns_tri_3"] = value[3]

/datum/preference/tri_color/horns/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/horns/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE

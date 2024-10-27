/datum/preference/toggle/frills
	savefile_key = "frills_enabled"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/frills/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["frills"] = /datum/sprite_accessory/frills/none::name

/datum/preference/toggle/frills/create_default_value()
	return FALSE

/datum/preference/choiced/lizard_frills
	category = PREFERENCE_CATEGORY_CLOTHING

/datum/preference/choiced/lizard_frills/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/frills::savefile_key

	return data

/datum/preference/choiced/lizard_frills/create_default_value()
	return /datum/sprite_accessory/frills/none::name

/datum/preference/choiced/lizard_frills/is_accessible(datum/preferences/preferences)
	. = ..()
	var/frills_enabled = preferences.read_preference(/datum/preference/toggle/frills)
	if(frills_enabled)
		return TRUE
	return FALSE

/datum/preference/tri_color/frills
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "frills_tri"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/frills/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["frills_tri_1"] = value[1]
	target.dna.features["frills_tri_2"] = value[2]
	target.dna.features["frills_tri_3"] = value[3]

/datum/preference/tri_color/frills/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/frills/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE

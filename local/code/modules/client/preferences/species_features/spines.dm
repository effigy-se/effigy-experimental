/datum/preference/toggle/lizard_spines
	savefile_key = "spines_enabled"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/lizard_spines/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["spines"] = /datum/sprite_accessory/spines/none::name

/datum/preference/toggle/lizard_spines/create_default_value()
	return FALSE

/datum/preference/choiced/lizard_spines/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/spines::savefile_key

	return data

/datum/preference/choiced/lizard_spines/is_accessible(datum/preferences/preferences)
	. = ..()
	var/spines_enabled = preferences.read_preference(/datum/preference/toggle/lizard_spines)
	if(spines_enabled)
		return TRUE
	return FALSE

/datum/preference/tri_color/spines
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "spines_tri"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/spines/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["spines_tri_1"] = value[1]
	target.dna.features["spines_tri_2"] = value[2]
	target.dna.features["spines_tri_3"] = value[3]

/datum/preference/tri_color/spines/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/spines/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE

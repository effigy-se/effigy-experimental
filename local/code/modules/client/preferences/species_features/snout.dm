/datum/preference/toggle/snout
	savefile_key = "snout_enabled"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/snout/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["snout"] = /datum/sprite_accessory/snouts/none::name

/datum/preference/toggle/snout/create_default_value()
	return FALSE

/datum/preference/choiced/lizard_snout
	category = PREFERENCE_CATEGORY_CLOTHING

/datum/preference/choiced/lizard_snout/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/snout::savefile_key

	return data

/datum/preference/choiced/lizard_snout/is_accessible(datum/preferences/preferences)
	. = ..()
	var/snout_enabled = preferences.read_preference(/datum/preference/toggle/snout)
	if(snout_enabled)
		return TRUE
	return FALSE

/datum/preference/tri_color/snout
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "snout_tri"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/snout/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["snout_tri_1"] = value[1]
	target.dna.features["snout_tri_2"] = value[2]
	target.dna.features["snout_tri_3"] = value[3]

/datum/preference/tri_color/snout/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/snout/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE

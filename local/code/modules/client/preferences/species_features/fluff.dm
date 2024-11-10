/datum/preference/toggle/fluff
	savefile_key = "fluff_enabled"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/fluff/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["neck_fluff"] = /datum/sprite_accessory/neck_fluff/none::name

/datum/preference/toggle/fluff/create_default_value()
	return FALSE

/datum/preference/choiced/neck_fluff
	savefile_key = "feature_neck_fluff"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_external_organ = /obj/item/organ/neck_fluff

/datum/preference/choiced/neck_fluff/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["neck_fluff"] = value

/datum/preference/choiced/neck_fluff/create_default_value()
	return /datum/sprite_accessory/neck_fluff/firewatch::name

/datum/preference/choiced/neck_fluff/init_possible_values()
	return assoc_to_keys_features(SSaccessories.neck_fluff_list)

/datum/preference/choiced/neck_fluff/is_accessible(datum/preferences/preferences)
	. = ..()
	var/has_fluff = preferences.read_preference(/datum/preference/toggle/fluff)
	if(has_fluff)
		return TRUE
	return FALSE

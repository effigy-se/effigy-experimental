/datum/preference/toggle/moth_wings
	savefile_key = "moth_wings_enabled"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/moth_wings/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["moth_wings"] = /datum/sprite_accessory/moth_wings/none::name

/datum/preference/toggle/moth_wings/create_default_value()
	return FALSE

/datum/preference/choiced/moth_wings
	savefile_key = "feature_moth_wings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES
	relevant_external_organ = /obj/item/organ/wings/moth
	main_feature_name = "Wings"

/datum/preference/choiced/moth_wings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["moth_wings"] = value

/datum/preference/choiced/moth_wings/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/wings::savefile_key

	return data

/datum/preference/choiced/moth_wings/create_default_value()
	return /datum/sprite_accessory/moth_wings/firewatch::name

/datum/preference/choiced/moth_wings/init_possible_values()
	return assoc_to_keys_features(SSaccessories.moth_wings_list)

/datum/preference/choiced/moth_wings/is_accessible(datum/preferences/preferences)
	. = ..()
	var/moth_wings_enabled = preferences.read_preference(/datum/preference/toggle/moth_wings)
	if(moth_wings_enabled)
		return TRUE
	return FALSE

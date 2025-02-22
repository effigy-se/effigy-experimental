/datum/preference/choiced/erp_status
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_status_pref"

/datum/preference/choiced/erp_status/init_possible_values()
	return list(
		"Top - Dom",
		"Top - Switch",
		"Top - Sub",
		"Verse-Top - Dom",
		"Verse-Top - Switch",
		"Verse-Top - Sub",
		"Verse - Dom",
		"Verse - Switch",
		"Verse - Sub",
		"Verse-Bottom - Dom",
		"Verse-Bottom - Switch",
		"Verse-Bottom - Sub",
		"Bottom - Dom",
		"Bottom - Switch",
		"Bottom - Sub",
		"Check OOC Notes",
		"Ask (L)OOC",
		"Yes",
		"No",
	)

/datum/preference/choiced/erp_status/create_default_value()
	return "No"

/datum/preference/choiced/erp_status/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

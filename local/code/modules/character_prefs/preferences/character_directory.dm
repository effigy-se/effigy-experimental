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

//The advertisement that you show to people looking through the directory
/datum/preference/text/character_ad
	savefile_key = "character_ad"
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	maximum_value_length = MAX_FLAVOR_TEXT_LENGTH

//TGUI gets angry if you don't define a default on text preferences
/datum/preference/text/character_ad/create_default_value()
	return ""

//Any text preference needs this for some reason
/datum/preference/text/character_ad/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/choiced/attraction
	savefile_key = "attraction"
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/attraction/init_possible_values()
	return list("Gay", "Lesbian", "Straight", "Skolio", "Bi", "Pan", "Poly", "Omni", "Ace", "Aro", "Aro/Ace", "Unset", "Check OOC")

/datum/preference/choiced/attraction/create_default_value()
	return "Unset"

/datum/preference/choiced/attraction/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/choiced/display_gender
	savefile_key = "display_gender"
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/display_gender/init_possible_values()
	return list("Male", "Female", "Null", "Plural", "Nonbinary", "Omni", "Trans", "Transmasc", "Transfem", "Andro", "Gyno", "Fluid", "Unset", "Check OOC")

/datum/preference/choiced/display_gender/create_default_value()
	return "Unset"

/datum/preference/choiced/display_gender/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/choiced/emote_length
	savefile_key = "emote_length"
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/choiced/emote_length/init_possible_values()
	return list("A few sentences", "1-2 Paragraphs", "Multi-Paragraph", "I'll Match You", "No Preference", "Check OOC")

/datum/preference/choiced/emote_length/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/choiced/emote_length/create_default_value()
	return "No Preference"

/datum/preference/choiced/approach_pref
	savefile_key = "approach_pref"
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/choiced/approach_pref/init_possible_values()
	return list("Approach IC", "Approach OOC", "Any", "Both", "Check OOC", "See Below", "Unset")

/datum/preference/choiced/approach_pref/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/choiced/approach_pref/create_default_value()
	return "Unset"

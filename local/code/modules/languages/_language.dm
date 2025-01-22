/datum/language/
	/// Should this be hidden on the language menu?
	var/secret = FALSE

/datum/language/aphasia
	secret = TRUE

/datum/language/codespeak
	secret = TRUE

/datum/language/drone
	secret = TRUE

/datum/language/narsie
	secret = TRUE

/datum/language/piratespeak
	secret = TRUE

/datum/language/xenocommon
	secret = TRUE

/obj/item/organ/tongue/get_possible_languages()
	var/list/langs = ..()
	langs += /datum/language/siiktajr

	return langs

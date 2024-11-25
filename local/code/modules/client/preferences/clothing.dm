/datum/preference/choiced/underwear/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = new species_type
	return !(TRAIT_NO_UNDERWEAR in species.inherent_traits)

/datum/preference/choiced/undershirt/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "undershirt_color"

	return data

/datum/preference/choiced/undershirt/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = new species_type
	return !(TRAIT_NO_UNDERWEAR in species.inherent_traits)

/datum/preference/color/undershirt_color
	savefile_key = "undershirt_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/color/undershirt_color/apply_to_human(mob/living/carbon/human/target, value)
	target.undershirt_color = value

/datum/preference/color/undershirt_color/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = GLOB.species_prototypes[species_type]
	return !(TRAIT_NO_UNDERWEAR in species.inherent_traits)

/datum/preference/choiced/socks/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "socks_color"

	return data

/datum/preference/choiced/socks/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = new species_type
	return !(TRAIT_NO_UNDERWEAR in species.inherent_traits)

/datum/preference/color/socks_color
	savefile_key = "socks_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/color/socks_color/apply_to_human(mob/living/carbon/human/target, value)
	target.socks_color = value

/datum/preference/color/socks_color/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = GLOB.species_prototypes[species_type]
	return !(TRAIT_NO_UNDERWEAR in species.inherent_traits)

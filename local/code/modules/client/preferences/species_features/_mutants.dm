/datum/preference/dna_color
	abstract_type = /datum/preference/dna_color
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES
	//relevant_inherent_trait = TRAIT_MUTANT_COLORS
	var/dna_identifier

/datum/preference/dna_color/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = GLOB.species_prototypes[species_type]
	return !(TRAIT_FIXED_MUTANT_COLORS in species.inherent_traits)

/datum/preference/dna_color/deserialize(input, datum/preferences/preferences)
	var/list/serialized_data = input
	return list(sanitize_hexcolor(serialized_data[1]), sanitize_hexcolor(serialized_data[2]), sanitize_hexcolor(serialized_data[3]))

/datum/preference/dna_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features[dna_identifier] = value

/datum/preference/dna_color/create_default_value()
	return list("#[random_color()]", "#[random_color()]", "#[random_color()]")

/datum/preference/dna_color/is_valid(list/value)
	return islist(value) && value.len == 3 && (findtext(value[1], GLOB.is_color) && findtext(value[2], GLOB.is_color) && findtext(value[3], GLOB.is_color))

/datum/preference/dna_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features[dna_identifier] = value

/datum/preference/dna_color/ears
	savefile_key = "dna_ears_color"
	dna_identifier = "dna_ears_color"

/datum/preference/dna_color/frills
	savefile_key = "dna_frills_color"
	dna_identifier = "dna_frills_color"

/datum/preference/dna_color/tail
	savefile_key = "dna_tail_color"
	dna_identifier = "dna_tail_color"

/datum/preference/dna_color/snout
	savefile_key = "dna_snout_color"
	dna_identifier = "dna_snout_color"

/datum/preference/dna_color/horns
	savefile_key = "dna_horns_color"
	dna_identifier = "dna_horns_color"

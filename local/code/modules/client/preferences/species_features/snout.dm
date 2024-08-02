/datum/preference/choiced/lizard_snout/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "dna_snout_color"

	return data

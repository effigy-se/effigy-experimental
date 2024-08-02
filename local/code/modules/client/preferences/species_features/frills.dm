/datum/preference/choiced/lizard_frills/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "dna_frills_color"

	return data

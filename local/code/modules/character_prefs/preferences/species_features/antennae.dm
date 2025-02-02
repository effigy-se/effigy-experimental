/// Moth antennae toggle
/datum/preference/toggle/antennae
	savefile_key = "antennae_toggle"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/antennae/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["moth_antennae"] = /datum/sprite_accessory/moth_antennae/none::name

/datum/preference/toggle/antennae/create_default_value()
	return FALSE

/datum/preference/toggle/antennae/is_accessible(datum/preferences/preferences)
	. = ..()
	var/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species in GLOB.species_blacklist_no_mutant)
		return FALSE

	return TRUE

/// Moth antennae type
/datum/preference/choiced/moth_antennae
	category = PREFERENCE_CATEGORY_CLOTHING

/datum/preference/choiced/moth_antennae/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/antennae_color::savefile_key

	return data

/datum/preference/choiced/moth_antennae/create_default_value()
	return /datum/sprite_accessory/moth_antennae/none::name

/datum/preference/choiced/moth_antennae/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE

	var/has_antennae = preferences.read_preference(/datum/preference/toggle/antennae)
	if(has_antennae == TRUE)
		return TRUE

	return FALSE

/// Moth antennae colors
/datum/preference/tri_color/antennae_color
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "antennae_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/antennae_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["antennae_color_1"] = value[1]
	target.dna.features["antennae_color_2"] = value[2]
	target.dna.features["antennae_color_3"] = value[3]

/datum/preference/tri_color/antennae_color/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/antennae_color/is_valid(value)
	if (!..(value))
		return FALSE

	return TRUE

///	Moth antennae have their own bespoke RGB code
/datum/bodypart_overlay/mutant/antennae/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(limb == null)
		return ..()
	if(limb.owner == null)
		return ..()
	var/color_intended = COLOR_WHITE

	var/tcol_1 = limb.owner.dna.features["antennae_color_1"]
	var/tcol_2 = limb.owner.dna.features["antennae_color_2"]
	var/tcol_3 = limb.owner.dna.features["antennae_color_3"]
	if(tcol_1 && tcol_2 && tcol_3)
		//this is beyond ugly but it works
		var/r1 = hex2num(copytext(tcol_1, 2, 4)) / 255.0
		var/g1 = hex2num(copytext(tcol_1, 4, 6)) / 255.0
		var/b1 = hex2num(copytext(tcol_1, 6, 8)) / 255.0
		var/r2 = hex2num(copytext(tcol_2, 2, 4)) / 255.0
		var/g2 = hex2num(copytext(tcol_2, 4, 6)) / 255.0
		var/b2 = hex2num(copytext(tcol_2, 6, 8)) / 255.0
		var/r3 = hex2num(copytext(tcol_3, 2, 4)) / 255.0
		var/g3 = hex2num(copytext(tcol_3, 4, 6)) / 255.0
		var/b3 = hex2num(copytext(tcol_3, 6, 8)) / 255.0
		color_intended = list(r1,g1,b1, r2,g2,b2, r3,g3,b3)
	overlay.color = color_intended
	return overlay

/datum/species/regenerate_organs(mob/living/carbon/target, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE)
	. = ..()
	if(target.dna.features["moth_antennae"] && !(type in GLOB.species_blacklist_no_mutant))
		if(target.dna.features["moth_antennae"] != /datum/sprite_accessory/moth_antennae/none::name && target.dna.features["moth_antennae"] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/antennae)
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .

	var/obj/item/organ/old_part = target.get_organ_slot(ORGAN_SLOT_EXTERNAL_ANTENNAE)
	if(old_part)
		old_part.Remove(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		old_part.moveToNullspace()

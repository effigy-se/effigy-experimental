/datum/controller/subsystem/accessories
	var/list/ext_chest_list

/datum/species/get_features()
	var/list/features = ..()

	features += /datum/preference/choiced/ext_chest

	GLOB.features_by_species[type] = features

	return features

/datum/controller/subsystem/accessories/setup_lists()
	. = ..()
	ext_chest_list = init_sprite_accessory_subtypes(/datum/sprite_accessory/ext_chest)["default_sprites"] // FLAKY DEFINE: this should be using DEFAULT_SPRITE_LIST

/datum/species/regenerate_organs(mob/living/carbon/target, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE)
	. = ..()
	if(target.dna.features["ext_chest"])
		if(target.dna.features["ext_chest"] != "Bare")
			var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/breasts)
			// replacement.build_from_dna(target.dna, "ext_chest") // EffigyEdit TODO: do we need to add this
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .
	var/obj/item/organ/old_part = target.get_organ_slot(ORGAN_SLOT_EXTERNAL_CHEST)
	if(old_part)
		old_part.Remove(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		old_part.moveToNullspace()

//core toggle
/datum/preference/toggle/ext_chest
	savefile_key = "ext_chest_toggle"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/ext_chest/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["ext_chest"] = "Bare"

/datum/preference/toggle/ext_chest/create_default_value()
	return FALSE

//sprite selection
/datum/preference/choiced/ext_chest
	savefile_key = "feature_ext_chest"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	main_feature_name = "Breasts"
	should_generate_icons = TRUE
	priority = PREFERENCE_PRIORITY_DEFAULT
	can_randomize = FALSE

/datum/preference/choiced/ext_chest/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ext_chest_list)

/datum/preference/choiced/ext_chest/icon_for(value)
	return generate_ext_chest_shot(SSaccessories.ext_chest_list[value], "ext_chest")

/datum/preference/choiced/ext_chest/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["ext_chest"] = value

/datum/preference/choiced/ext_chest/create_default_value()
	return /datum/sprite_accessory/ext_chest/bare::name

/datum/preference/choiced/ext_chest/is_accessible(datum/preferences/preferences)
	. = ..()
	var/has_ext = preferences.read_preference(/datum/preference/toggle/ext_chest)
	if(has_ext == TRUE)
		return TRUE
	return FALSE

/proc/generate_ext_chest_shot(datum/sprite_accessory/sprite_accessory, key)
	var/static/icon/final_icon
	final_icon = icon('local/icons/mob/mutant/sprite_accessories/fallback.dmi')

	if (!isnull(sprite_accessory))
		var/icon/accessory_icon_1 = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", SOUTH)
		accessory_icon_1.Blend(COLOR_EFFIGY_SKY_BLUE, ICON_MULTIPLY)
		var/icon/accessory_icon_2 = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ_2", SOUTH)
		accessory_icon_2.Blend(COLOR_EFFIGY_PLATINUM, ICON_MULTIPLY)
		var/icon/accessory_icon_3 = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ_3", SOUTH)
		accessory_icon_3.Blend(COLOR_EFFIGY_ELECTRIC_BLUE, ICON_MULTIPLY)
		final_icon.Blend(accessory_icon_1, ICON_OVERLAY)
		final_icon.Blend(accessory_icon_2, ICON_OVERLAY)
		final_icon.Blend(accessory_icon_3, ICON_OVERLAY)

	final_icon.Crop(10, 8, 22, 23)
	final_icon.Scale(26, 32)
	final_icon.Crop(-2, 1, 29, 32)

	return final_icon

// colors
/datum/preference/tri_color/ext_chest_color
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "ext_chest_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES
	can_randomize = FALSE

/datum/preference/tri_color/ext_chest_color/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/ext_chest_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["ext_chest_color_1"] = value[1]
	target.dna.features["ext_chest_color_2"] = value[2]
	target.dna.features["ext_chest_color_3"] = value[3]

/datum/preference/tri_color/ext_chest_color/is_valid(value)
	if (!..(value))
		return FALSE

	return TRUE

/datum/preference/choiced/ext_chest/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ext_chest_color::savefile_key

	return data

/datum/dna
	///	This variable is read by the regenerate_organs() proc to know what organ subtype to give
	var/ear_type = NO_VARIATION

/datum/controller/subsystem/accessories
	var/list/ears_list_lizard
	var/list/ears_list_dog
	var/list/ears_list_fox
	var/list/ears_list_bunny
	var/list/ears_list_mouse
	var/list/ears_list_bird
	var/list/ears_list_monkey
	var/list/ears_list_deer
	var/list/ears_list_fish
	var/list/ears_list_bug
	var/list/ears_list_humanoid
	var/list/ears_list_synthetic

/datum/controller/subsystem/accessories/setup_lists()
	. = ..()
	ears_list_lizard = init_sprite_accessory_subtypes(/datum/sprite_accessory/ears_anthro/lizard)["default_sprites"]
	ears_list_dog = init_sprite_accessory_subtypes(/datum/sprite_accessory/ears_anthro/dog)["default_sprites"]
	ears_list_fox = init_sprite_accessory_subtypes(/datum/sprite_accessory/ears_anthro/fox)["default_sprites"]
	ears_list_bunny = init_sprite_accessory_subtypes(/datum/sprite_accessory/ears_anthro/bunny)["default_sprites"]
	ears_list_mouse = init_sprite_accessory_subtypes(/datum/sprite_accessory/ears_anthro/mouse)["default_sprites"]
	ears_list_bird = init_sprite_accessory_subtypes(/datum/sprite_accessory/ears_anthro/bird)["default_sprites"]
	ears_list_monkey = init_sprite_accessory_subtypes(/datum/sprite_accessory/ears_anthro/monkey)["default_sprites"]
	ears_list_deer = init_sprite_accessory_subtypes(/datum/sprite_accessory/ears_anthro/deer)["default_sprites"]
	ears_list_fish = init_sprite_accessory_subtypes(/datum/sprite_accessory/ears_anthro/fish)["default_sprites"]
	ears_list_bug = init_sprite_accessory_subtypes(/datum/sprite_accessory/ears_anthro/bug)["default_sprites"]
	ears_list_humanoid = init_sprite_accessory_subtypes(/datum/sprite_accessory/ears_anthro/humanoid)["default_sprites"]
	ears_list_synthetic = init_sprite_accessory_subtypes(/datum/sprite_accessory/ears_anthro/cybernetic)["default_sprites"]

/datum/species/regenerate_organs(mob/living/carbon/target, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE)
	. = ..()
	if(target.dna.features["ears"] && !(type in GLOB.species_blacklist_no_mutant))
		if(target.dna.ear_type == NO_VARIATION)
			return .
		else if(target.dna.features["ears"] != /datum/sprite_accessory/ears/none::name && target.dna.features["ears"] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/organ_path = text2path("/obj/item/organ/ears/[target.dna.ear_type]")
			var/obj/item/organ/replacement = SSwardrobe.provide_type(organ_path)
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .

/// Ear type
/datum/preference/choiced/ear_variation
	savefile_key = "ear_type"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/choiced/ear_variation/apply_to_human(mob/living/carbon/human/target, chosen_variation)
	target.dna.ear_type = chosen_variation
	if(chosen_variation == NO_VARIATION)
		target.dna.features["ears"] = /datum/sprite_accessory/ears/none::name

/datum/preference/choiced/ear_variation/create_default_value()
	return NO_VARIATION

/datum/preference/choiced/ear_variation/init_possible_values()
	return list(NO_VARIATION) + (GLOB.mutant_variations)

/datum/preference/choiced/ear_variation/is_accessible(datum/preferences/preferences)
	. = ..()
	var/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species in GLOB.species_blacklist_no_mutant)
		return FALSE
	return TRUE

///	Cat ears type
/datum/preference/choiced/felinid_ears
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/felinid_ears/apply_to_human(mob/living/carbon/human/target, value)
	..()
	if(target.dna.ear_type == CAT)
		target.dna.features["ears"] = value

/datum/preference/choiced/felinid_ears/create_default_value()
	return /datum/sprite_accessory/ears/none::name

/datum/preference/choiced/felinid_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list[value]
	return generate_ears_icon(chosen_ears)

/datum/preference/choiced/felinid_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == CAT)
		return TRUE
	return FALSE

///	Lizard ears type
/datum/preference/choiced/lizard_ears
	savefile_key = "feature_lizard_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/lizard_ears/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.ear_type == LIZARD)
		target.dna.features["ears"] = value

/datum/preference/choiced/lizard_ears/create_default_value()
	return /datum/sprite_accessory/ears_anthro/lizard/none::name

/datum/preference/choiced/lizard_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list_lizard[value]
	return generate_ears_icon(chosen_ears)

/datum/preference/choiced/lizard_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list_lizard)

/datum/preference/choiced/lizard_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == LIZARD)
		return TRUE
	return FALSE

///	Fox ears type
/datum/preference/choiced/fox_ears
	savefile_key = "feature_fox_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/fox_ears/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.ear_type == FOX)
		target.dna.features["ears"] = value

/datum/preference/choiced/fox_ears/create_default_value()
	return /datum/sprite_accessory/ears_anthro/fox/none::name

/datum/preference/choiced/fox_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list_fox[value]
	return generate_ears_icon(chosen_ears)

/datum/preference/choiced/fox_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list_fox)

/datum/preference/choiced/fox_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == FOX)
		return TRUE
	return FALSE

///	Dog ears type
/datum/preference/choiced/dog_ears
	savefile_key = "feature_dog_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/dog_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list_dog)

/datum/preference/choiced/dog_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == DOG)
		return TRUE
	return FALSE

/datum/preference/choiced/dog_ears/create_default_value()
	return /datum/sprite_accessory/ears_anthro/dog/none::name

/datum/preference/choiced/dog_ears/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.ear_type == DOG)
		target.dna.features["ears"] = value

/datum/preference/choiced/dog_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list_dog[value]
	return generate_ears_icon(chosen_ears)

///	Bunny ears type
/datum/preference/choiced/bunny_ears
	savefile_key = "feature_bunny_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/bunny_ears/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.ear_type == BUNNY)
		target.dna.features["ears"] = value

/datum/preference/choiced/bunny_ears/create_default_value()
	return /datum/sprite_accessory/ears_anthro/bunny/none::name

/datum/preference/choiced/bunny_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list_bunny[value]
	return generate_ears_icon(chosen_ears)

/datum/preference/choiced/bunny_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list_bunny)

/datum/preference/choiced/bunny_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == BUNNY)
		return TRUE
	return FALSE

///	Bird ears type
/datum/preference/choiced/bird_ears
	savefile_key = "feature_bird_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/bird_ears/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.ear_type == BIRD)
		target.dna.features["ears"] = value

/datum/preference/choiced/bird_ears/create_default_value()
	return /datum/sprite_accessory/ears_anthro/bird/none::name

/datum/preference/choiced/bird_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list_bird[value]
	return generate_ears_icon(chosen_ears)

/datum/preference/choiced/bird_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list_bird)

/datum/preference/choiced/bird_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == BIRD)
		return TRUE
	return FALSE

///	Mouse ears type
/datum/preference/choiced/mouse_ears
	savefile_key = "feature_mouse_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/mouse_ears/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.ear_type == MOUSE)
		target.dna.features["ears"] = value

/datum/preference/choiced/mouse_ears/create_default_value()
	return /datum/sprite_accessory/ears_anthro/mouse/none::name

/datum/preference/choiced/mouse_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list_mouse[value]
	return generate_ears_icon(chosen_ears)

/datum/preference/choiced/mouse_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list_mouse)

/datum/preference/choiced/mouse_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == MOUSE)
		return TRUE
	return FALSE

///	Monkey ears type
/datum/preference/choiced/monkey_ears
	savefile_key = "feature_monkey_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/monkey_ears/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.ear_type == MONKEY)
		target.dna.features["ears"] = value

/datum/preference/choiced/monkey_ears/create_default_value()
	return /datum/sprite_accessory/ears_anthro/monkey/none::name

/datum/preference/choiced/monkey_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list_monkey[value]
	return generate_ears_icon(chosen_ears)

/datum/preference/choiced/monkey_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list_monkey)

/datum/preference/choiced/monkey_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == MONKEY)
		return TRUE
	return FALSE

///	Deer ears type
/datum/preference/choiced/deer_ears
	savefile_key = "feature_deer_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/deer_ears/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.ear_type == DEER)
		target.dna.features["ears"] = value

/datum/preference/choiced/deer_ears/create_default_value()
	return /datum/sprite_accessory/ears_anthro/deer/none::name

/datum/preference/choiced/deer_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list_deer[value]
	return generate_ears_icon(chosen_ears)

/datum/preference/choiced/deer_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list_deer)

/datum/preference/choiced/deer_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == DEER)
		return TRUE
	return FALSE

///	Aquatic ears type
/datum/preference/choiced/fish_ears
	savefile_key = "feature_fish_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/fish_ears/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.ear_type == FISH)
		target.dna.features["ears"] = value

/datum/preference/choiced/fish_ears/create_default_value()
	return /datum/sprite_accessory/ears_anthro/fish/none::name

/datum/preference/choiced/fish_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list_fish[value]
	return generate_ears_icon(chosen_ears)

/datum/preference/choiced/fish_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list_fish)

/datum/preference/choiced/fish_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == FISH)
		return TRUE
	return FALSE

///	Bug ears type
/datum/preference/choiced/bug_ears
	savefile_key = "feature_bug_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/bug_ears/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.ear_type == BUG)
		target.dna.features["ears"] = value

/datum/preference/choiced/bug_ears/create_default_value()
	return /datum/sprite_accessory/ears_anthro/bug/none::name

/datum/preference/choiced/bug_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list_bug[value]
	return generate_ears_icon(chosen_ears)

/datum/preference/choiced/bug_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list_bug)

/datum/preference/choiced/bug_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == BUG)
		return TRUE
	return FALSE

///	Humanoid ears type
/datum/preference/choiced/humanoid_ears
	savefile_key = "feature_humanoid_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/humanoid_ears/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.ear_type == HUMANOID)
		target.dna.features["ears"] = value

/datum/preference/choiced/humanoid_ears/create_default_value()
	return /datum/sprite_accessory/ears_anthro/humanoid/none::name

/datum/preference/choiced/humanoid_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list_humanoid[value]
	return generate_ears_icon(chosen_ears)

/datum/preference/choiced/humanoid_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list_humanoid)

/datum/preference/choiced/humanoid_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == HUMANOID)
		return TRUE
	return FALSE

///	Synth ears type
/datum/preference/choiced/synthetic_ears
	savefile_key = "feature_synth_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Ears"

/datum/preference/choiced/synthetic_ears/apply_to_human(mob/living/carbon/human/target, value)
	if(target.dna.ear_type == CYBERNETIC)
		target.dna.features["ears"] = value

/datum/preference/choiced/synthetic_ears/create_default_value()
	return /datum/sprite_accessory/ears_anthro/cybernetic/none::name

/datum/preference/choiced/synthetic_ears/icon_for(value)
	var/datum/sprite_accessory/chosen_ears = SSaccessories.ears_list_synthetic[value]
	return generate_ears_icon(chosen_ears)

/datum/preference/choiced/synthetic_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list_synthetic)

/datum/preference/choiced/synthetic_ears/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(species.type in GLOB.species_blacklist_no_mutant)
		return FALSE
	var/chosen_variation = preferences.read_preference(/datum/preference/choiced/ear_variation)
	if(chosen_variation == CYBERNETIC)
		return TRUE
	return FALSE

/// Generate selection preview
/datum/preference/choiced/proc/generate_ears_icon(chosen_ears)
	var/datum/sprite_accessory/sprite_accessory = chosen_ears
	var/static/icon/final_icon
	final_icon = icon('icons/mob/human/bodyparts_greyscale.dmi', "human_head_m", SOUTH)
	var/icon/eyes = icon('icons/mob/human/human_face.dmi', "eyes", SOUTH)
	eyes.Blend(COLOR_GRAY, ICON_MULTIPLY)
	final_icon.Blend(eyes, ICON_OVERLAY)

	if (sprite_accessory.icon_state != "none")
		var/icon/markings_icon_1 = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_BEHIND", SOUTH)
		markings_icon_1.Blend(COLOR_RED, ICON_MULTIPLY)
		var/icon/markings_icon_2 = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_BEHIND_2", SOUTH)
		markings_icon_2.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
		var/icon/markings_icon_3 = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_BEHIND_3", SOUTH)
		markings_icon_3.Blend(COLOR_BLUE, ICON_MULTIPLY)
		final_icon.Blend(markings_icon_1, ICON_OVERLAY)
		final_icon.Blend(markings_icon_2, ICON_OVERLAY)
		final_icon.Blend(markings_icon_3, ICON_OVERLAY)
		// adj breaker
		var/icon/markings_icon_1_a = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_ADJ", SOUTH)
		markings_icon_1_a.Blend(COLOR_RED, ICON_MULTIPLY)
		var/icon/markings_icon_2_a = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_ADJ_2", SOUTH)
		markings_icon_2_a.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
		var/icon/markings_icon_3_a = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_ADJ_3", SOUTH)
		markings_icon_3_a.Blend(COLOR_BLUE, ICON_MULTIPLY)
		final_icon.Blend(markings_icon_1_a, ICON_OVERLAY)
		final_icon.Blend(markings_icon_2_a, ICON_OVERLAY)
		final_icon.Blend(markings_icon_3_a, ICON_OVERLAY)
		// front breaker
		var/icon/markings_icon_1_f = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_FRONT", SOUTH)
		markings_icon_1_f.Blend(COLOR_RED, ICON_MULTIPLY)
		var/icon/markings_icon_2_f = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_FRONT_2", SOUTH)
		markings_icon_2_f.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
		var/icon/markings_icon_3_f = icon(sprite_accessory.icon, "m_ears_[sprite_accessory.icon_state]_FRONT_3", SOUTH)
		markings_icon_3_f.Blend(COLOR_BLUE, ICON_MULTIPLY)
		final_icon.Blend(markings_icon_1_f, ICON_OVERLAY)
		final_icon.Blend(markings_icon_2_f, ICON_OVERLAY)
		final_icon.Blend(markings_icon_3_f, ICON_OVERLAY)

	final_icon.Crop(11, 20, 23, 32)
	final_icon.Scale(32, 32)

	return final_icon

/datum/bodypart_overlay/mutant/ears
	layers = EXTERNAL_FRONT | EXTERNAL_FRONT_2 | EXTERNAL_FRONT_3 | EXTERNAL_ADJACENT | EXTERNAL_ADJACENT_2 | EXTERNAL_ADJACENT_3 | EXTERNAL_BEHIND | EXTERNAL_BEHIND_2 | EXTERNAL_BEHIND_3
	feature_key = "ears"
	feature_key_sprite = "ears"

/datum/bodypart_overlay/mutant/ears/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(limb == null)
		return ..()
	if(limb.owner == null)
		return ..()
	if(draw_layer == bitflag_to_layer(EXTERNAL_FRONT))
		overlay.color = limb.owner.dna.features["ears_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT))
		overlay.color = limb.owner.dna.features["ears_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND))
		overlay.color = limb.owner.dna.features["ears_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_FRONT_2))
		overlay.color = limb.owner.dna.features["ears_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_2))
		overlay.color = limb.owner.dna.features["ears_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_2))
		overlay.color = limb.owner.dna.features["ears_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_FRONT_3))
		overlay.color = limb.owner.dna.features["ears_color_3"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_3))
		overlay.color = limb.owner.dna.features["ears_color_3"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_3))
		overlay.color = limb.owner.dna.features["ears_color_3"]
		return overlay
	return ..()

/datum/preference/choiced/felinid_ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/datum/preference/choiced/lizard_ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/datum/preference/choiced/dog_ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/datum/preference/choiced/fox_ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/datum/preference/choiced/bunny_ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/datum/preference/choiced/mouse_ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/datum/preference/choiced/bird_ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/datum/preference/choiced/monkey_ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/datum/preference/choiced/deer_ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/datum/preference/choiced/fish_ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/datum/preference/choiced/bug_ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/datum/preference/choiced/humanoid_ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/datum/preference/choiced/synthetic_ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/// Ear colors
/datum/preference/tri_color/ears_color
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "ears_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/ears_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["ears_color_1"] = value[1]
	target.dna.features["ears_color_2"] = value[2]
	target.dna.features["ears_color_3"] = value[3]

/datum/preference/tri_color/ears_color/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/ears_color/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE

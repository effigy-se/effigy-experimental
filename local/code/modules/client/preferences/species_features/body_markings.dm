/datum/preference/choiced/zonal_markings
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_MARKINGS
	abstract_type = /datum/preference/choiced/zonal_markings
	relevant_external_organ = null
	var/body_zone
	var/marking_key

/datum/preference/choiced/zonal_markings/init_possible_values()
	var/datum/bodypart_overlay/simple/body_marking/zonal/markings = new /datum/bodypart_overlay/simple/body_marking/zonal()
	var/list/markings_list = list()
	var/list/all_markings = assoc_to_keys_features(SSaccessories.body_markings)
	markings_list += "None"
	for(var/i as anything in all_markings)
		var/datum/sprite_accessory/body_marking/accessory = markings.get_accessory(i)
		if(accessory.body_zones & body_zone)
			markings_list += i
	return sort_list(markings_list)

/datum/preference/choiced/zonal_markings/create_default_value()
	return SPRITE_ACCESSORY_NONE

/datum/preference/choiced/zonal_markings/apply_to_human(mob/living/carbon/human/target, value)

	if(value == SPRITE_ACCESSORY_NONE)
		return

	if(!target.dna.features["markings_list"])
		var/list/markings_list = list()
		LAZYSETLEN(markings_list, MARKING_LIST_LEN)
		target.dna.features["markings_list"] = markings_list

	if(!target.dna.features["markings_list_zones"])
		var/list/markings_list = list()
		LAZYSETLEN(markings_list, MARKING_LIST_LEN)
		target.dna.features["markings_list_zones"] = markings_list

	target.dna.features["markings_list"][marking_key] = value
	target.dna.features["markings_list_zones"][marking_key] = body_zone

/datum/preference/color/markings
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_MARKINGS
	relevant_head_flag = null
	abstract_type = /datum/preference/color/markings
	var/marking_key

/datum/preference/color/markings/apply_to_human(mob/living/carbon/human/target, value)
	if(!target.dna.features["markings_list_colors"])
		var/list/markings_list = list()
		LAZYSETLEN(markings_list, MARKING_LIST_LEN)
		target.dna.features["markings_list_colors"] = markings_list

	target.dna.features["markings_list_colors"][marking_key] = value

///
// Preferences
///

// Head markings

/datum/preference/choiced/zonal_markings/head
	savefile_key = "markings_head"
	main_feature_name = "Bodymarkings Head"
	body_zone = HEAD
	marking_key = MARKING_HEAD

/datum/preference/color/markings/markings_head
	savefile_key = "markings_head_color"
	marking_key = MARKING_HEAD

/datum/preference/choiced/zonal_markings/head2
	savefile_key = "markings_head2"
	main_feature_name = "Bodymarkings Head 2"
	body_zone = HEAD
	marking_key = MARKING_HEAD2

/datum/preference/choiced/zonal_markings/head2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/head) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_head2
	savefile_key = "markings_head_color2"
	marking_key = MARKING_HEAD2

/datum/preference/color/markings/markings_head2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/head) != SPRITE_ACCESSORY_NONE

/datum/preference/choiced/zonal_markings/head3
	savefile_key = "markings_head3"
	main_feature_name = "Bodymarkings Head 2"
	body_zone = HEAD
	marking_key = MARKING_HEAD3

/datum/preference/choiced/zonal_markings/head3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/head2) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_head3
	savefile_key = "markings_head_color3"
	marking_key = MARKING_HEAD3

/datum/preference/color/markings/markings_head3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/head2) != SPRITE_ACCESSORY_NONE

// Chest markings

/datum/preference/choiced/zonal_markings/chest
	savefile_key = "markings_chest"
	main_feature_name = "Bodymarkings Chest"
	body_zone = CHEST
	marking_key = MARKING_CHEST

/datum/preference/color/markings/markings_chest
	savefile_key = "markings_chest_color"
	marking_key = MARKING_CHEST

/datum/preference/choiced/zonal_markings/chest2
	savefile_key = "markings_chest2"
	main_feature_name = "Bodymarkings Chest 2"
	body_zone = CHEST
	marking_key = MARKING_CHEST2

/datum/preference/choiced/zonal_markings/chest2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/chest) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_chest2
	savefile_key = "markings_chest_color2"
	marking_key = MARKING_CHEST2

/datum/preference/color/markings/markings_chest2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/chest) != SPRITE_ACCESSORY_NONE

/datum/preference/choiced/zonal_markings/chest3
	savefile_key = "markings_chest3"
	main_feature_name = "Bodymarkings Chest"
	body_zone = CHEST
	marking_key = MARKING_CHEST3

/datum/preference/choiced/zonal_markings/chest3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/chest2) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_chest3
	savefile_key = "markings_chest_color3"
	marking_key = MARKING_CHEST3

/datum/preference/color/markings/markings_chest3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/chest2) != SPRITE_ACCESSORY_NONE

// Right arm markings

/datum/preference/choiced/zonal_markings/r_arm
	savefile_key = "markings_r_arm"
	main_feature_name = "Bodymarkings Right Arm"
	body_zone = ARM_RIGHT
	marking_key = MARKING_RARM

/datum/preference/color/markings/markings_r_arm
	savefile_key = "markings_r_arm_color"
	marking_key = MARKING_RARM

/datum/preference/choiced/zonal_markings/r_arm2
	savefile_key = "markings_r_arm2"
	main_feature_name = "Bodymarkings Right Arm 2"
	body_zone = ARM_RIGHT
	marking_key = MARKING_RARM2

/datum/preference/choiced/zonal_markings/r_arm2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/r_arm) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_r_arm2
	savefile_key = "markings_r_arm_color2"
	marking_key = MARKING_RARM2

/datum/preference/color/markings/markings_r_arm2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/r_arm) != SPRITE_ACCESSORY_NONE

/datum/preference/choiced/zonal_markings/r_arm3
	savefile_key = "markings_r_arm3"
	main_feature_name = "Bodymarkings Right Arm 3"
	body_zone = ARM_RIGHT
	marking_key =  MARKING_RARM3

/datum/preference/choiced/zonal_markings/r_arm3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/r_arm2) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_r_arm3
	savefile_key = "markings_r_arm_color3"
	marking_key = MARKING_RARM3

/datum/preference/color/markings/markings_r_arm3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/r_arm2) != SPRITE_ACCESSORY_NONE


// Left arm markings

/datum/preference/choiced/zonal_markings/l_arm
	savefile_key = "markings_l_arm"
	main_feature_name = "Bodymarkings Left Arm"
	body_zone = ARM_LEFT
	marking_key = MARKING_LARM

/datum/preference/color/markings/markings_l_arm
	savefile_key = "markings_l_arm_color"
	marking_key = MARKING_LARM

/datum/preference/choiced/zonal_markings/l_arm2
	savefile_key = "markings_l_arm2"
	main_feature_name = "Bodymarkings Left Arm 2"
	body_zone = ARM_LEFT
	marking_key = MARKING_LARM2

/datum/preference/choiced/zonal_markings/l_arm2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/l_arm) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_l_arm2
	savefile_key = "markings_l_arm_color2"
	marking_key = MARKING_LARM2

/datum/preference/color/markings/markings_l_arm2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/l_arm) != SPRITE_ACCESSORY_NONE

/datum/preference/choiced/zonal_markings/l_arm3
	savefile_key = "markings_l_arm3"
	main_feature_name = "Bodymarkings Left Arm 3"
	body_zone = ARM_LEFT
	marking_key = MARKING_LARM3


/datum/preference/choiced/zonal_markings/l_arm3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/l_arm2) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_l_arm3
	savefile_key = "markings_l_arm_color3"
	marking_key = MARKING_LARM3

/datum/preference/color/markings/markings_l_arm3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/l_arm2) != SPRITE_ACCESSORY_NONE

// Left hand markings

/datum/preference/choiced/zonal_markings/l_hand
	savefile_key = "markings_l_hand"
	main_feature_name = "Bodymarkings Left Hand"
	body_zone = HAND_LEFT
	marking_key = MARKING_LHAND

/datum/preference/color/markings/markings_l_hand
	savefile_key = "markings_l_hand_color"
	marking_key = MARKING_LHAND

/datum/preference/choiced/zonal_markings/l_hand2
	savefile_key = "markings_l_hand2"
	main_feature_name = "Bodymarkings Left Hand 2"
	body_zone = HAND_LEFT
	marking_key = MARKING_LHAND2

/datum/preference/choiced/zonal_markings/l_hand2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/l_hand) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_l_hand2
	savefile_key = "markings_l_hand_color2"
	marking_key = MARKING_LHAND2

/datum/preference/color/markings/markings_l_hand2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/l_hand) != SPRITE_ACCESSORY_NONE

/datum/preference/choiced/zonal_markings/l_hand3
	savefile_key = "markings_l_hand3"
	main_feature_name = "Bodymarkings Left Hand 3"
	body_zone = HAND_LEFT
	marking_key = MARKING_LHAND3

/datum/preference/choiced/zonal_markings/l_hand3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/l_hand2) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_l_hand3
	savefile_key = "markings_l_hand_color3"
	marking_key = MARKING_LHAND3

/datum/preference/color/markings/markings_l_hand3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/l_hand2) != SPRITE_ACCESSORY_NONE

// Right hand markings

/datum/preference/choiced/zonal_markings/r_hand
	savefile_key = "markings_r_hand"
	main_feature_name = "Bodymarkings Right Hand"
	body_zone = HAND_RIGHT
	marking_key = MARKING_RHAND

/datum/preference/color/markings/markings_r_hand
	savefile_key = "markings_r_hand_color"
	marking_key = MARKING_RHAND

/datum/preference/choiced/zonal_markings/r_hand2
	savefile_key = "markings_r_hand2"
	main_feature_name = "Bodymarkings Right Hand 2"
	body_zone = HAND_RIGHT
	marking_key = MARKING_RHAND2

/datum/preference/choiced/zonal_markings/r_hand2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/r_hand) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_r_hand2
	savefile_key = "markings_r_hand_color2"
	marking_key = MARKING_RHAND2

/datum/preference/color/markings/markings_r_hand2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/r_hand) != SPRITE_ACCESSORY_NONE

/datum/preference/choiced/zonal_markings/r_hand3
	savefile_key = "markings_r_hand3"
	main_feature_name = "Bodymarkings Right Hand 3"
	body_zone = HAND_RIGHT
	marking_key = MARKING_RHAND3

/datum/preference/choiced/zonal_markings/r_hand3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/r_hand2) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_r_hand3
	savefile_key = "markings_r_hand_color3"
	marking_key = MARKING_RHAND3

/datum/preference/color/markings/markings_r_hand3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/r_hand2) != SPRITE_ACCESSORY_NONE

// Left leg markings

/datum/preference/choiced/zonal_markings/l_leg
	savefile_key = "markings_l_leg"
	main_feature_name = "Bodymarkings Left Leg"
	body_zone = LEG_LEFT
	marking_key = MARKING_LLEG

/datum/preference/color/markings/markings_l_leg
	savefile_key = "markings_l_leg_color"
	marking_key = MARKING_LLEG

/datum/preference/choiced/zonal_markings/l_leg2
	savefile_key = "markings_l_leg2"
	main_feature_name = "Bodymarkings Left Leg 2"
	body_zone = LEG_LEFT
	marking_key = MARKING_LLEG2

/datum/preference/choiced/zonal_markings/l_leg2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/l_leg) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_l_leg2
	savefile_key = "markings_l_leg_color2"
	marking_key = MARKING_LLEG2

/datum/preference/color/markings/markings_l_leg2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/l_leg) != SPRITE_ACCESSORY_NONE


/datum/preference/choiced/zonal_markings/l_leg3
	savefile_key = "markings_l_leg3"
	main_feature_name = "Bodymarkings Left Leg 3"
	body_zone = LEG_LEFT
	marking_key = MARKING_LLEG3

/datum/preference/choiced/zonal_markings/l_leg3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/l_leg2) != SPRITE_ACCESSORY_NONE


/datum/preference/color/markings/markings_l_leg3
	savefile_key = "markings_l_leg_color3"
	marking_key = MARKING_LLEG3

/datum/preference/color/markings/markings_l_leg3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/l_leg2) != SPRITE_ACCESSORY_NONE

// Right leg markings

/datum/preference/choiced/zonal_markings/r_leg
	savefile_key = "markings_r_leg"
	main_feature_name = "Bodymarkings Right Leg"
	body_zone = LEG_RIGHT
	marking_key = MARKING_RLEG

/datum/preference/color/markings/markings_r_leg
	savefile_key = "markings_r_leg_color"
	marking_key = MARKING_RLEG

/datum/preference/choiced/zonal_markings/r_leg2
	savefile_key = "markings_r_leg2"
	main_feature_name = "Bodymarkings Right Leg 2"
	body_zone = LEG_RIGHT
	marking_key = MARKING_RLEG2

/datum/preference/choiced/zonal_markings/r_leg2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/r_leg) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_r_leg2
	savefile_key = "markings_r_leg_color2"
	marking_key = MARKING_RLEG2

/datum/preference/color/markings/markings_r_leg2/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/r_leg) != SPRITE_ACCESSORY_NONE

/datum/preference/choiced/zonal_markings/r_leg3
	savefile_key = "markings_r_leg3"
	main_feature_name = "Bodymarkings Right Leg 3"
	body_zone = LEG_RIGHT
	marking_key = MARKING_RLEG3

/datum/preference/choiced/zonal_markings/r_leg3/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return preferences.read_preference(/datum/preference/choiced/zonal_markings/r_leg2) != SPRITE_ACCESSORY_NONE

/datum/preference/color/markings/markings_r_leg3
	savefile_key = "markings_r_leg_color3"
	marking_key = MARKING_RLEG3

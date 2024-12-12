/**
 * # species datum
 *
 * Datum that handles different species in the game.
 *
 * This datum handles species in the game, such as lizardpeople, mothmen, zombies, skeletons, etc.
 * It is used in [carbon humans][mob/living/carbon/human] to determine various things about them, like their food preferences, if they have biological genders, their damage resistances, and more.
 *
 */
/datum/species
	///If a species can always be picked in prefs for the purposes of customizing it for ghost roles or events
	var/always_customizable = FALSE
	///How are we treated regarding processing reagents, by default we process them as if we're organic
	var/reagent_compatibility = PROCESS_ORGANIC
	///This is the outfit which will be used by the species its preview portrait
	var/datum/outfit/preview_outfit = /datum/outfit/job/assistant/consistent

/// Cybernetic limbs logic here!
//	Used for most races
/datum/species/on_species_gain(mob/living/carbon/human/target, datum/species/old_species, pref_load, regenerate_icons = TRUE)
	var/list/frame_bodyparts = target.dna.features["frame_list"]
	if(type in GLOB.species_blacklist_no_humanoid)
		return ..()
	if(type == /datum/species/android && frame_bodyparts && frame_bodyparts[BODY_ZONE_HEAD])
		bodypart_overrides[BODY_ZONE_HEAD] = frame_bodyparts[BODY_ZONE_HEAD]
	if(frame_bodyparts && frame_bodyparts[BODY_ZONE_CHEST])
		bodypart_overrides[BODY_ZONE_CHEST] = frame_bodyparts[BODY_ZONE_CHEST]
	if(frame_bodyparts && frame_bodyparts[BODY_ZONE_R_ARM])
		bodypart_overrides[BODY_ZONE_R_ARM] = frame_bodyparts[BODY_ZONE_R_ARM]
	if(frame_bodyparts && frame_bodyparts[BODY_ZONE_L_ARM])
		bodypart_overrides[BODY_ZONE_L_ARM] = frame_bodyparts[BODY_ZONE_L_ARM]
	if(frame_bodyparts && frame_bodyparts[BODY_ZONE_R_LEG])
		bodypart_overrides[BODY_ZONE_R_LEG] = frame_bodyparts[BODY_ZONE_R_LEG]
	if(frame_bodyparts && frame_bodyparts[BODY_ZONE_L_LEG])
		bodypart_overrides[BODY_ZONE_L_LEG] = frame_bodyparts[BODY_ZONE_L_LEG]
	return ..()

/datum/species/add_body_markings(mob/living/carbon/human/target)
	. = ..()
	if(target.dna.features["markings_list"])
		if(islist(target.dna.features["markings_list"]) && islist(target.dna.features["markings_list_colors"]) && islist(target.dna.features["markings_list_zones"]))
			var/list/markings_list = target.dna.features["markings_list"]
			for(var/i in 1 to markings_list.len)
				if(markings_list[i] && markings_list[i] != SPRITE_ACCESSORY_NONE)
					add_zonal_markings(target, target.dna.features["markings_list"][i], target.dna.features["markings_list_colors"][i], target.dna.features["markings_list_zones"][i])

/datum/species/proc/add_zonal_markings(mob/living/carbon/human/target, value, colorvalue, bodypart)
	var/hand_layer = FALSE
	bodypart = marking_zones(bodypart)
	if(bodypart == BODY_ZONE_PRECISE_L_HAND)
		hand_layer = EXTERNAL_HANDS
		bodypart = BODY_ZONE_L_ARM
	else if(bodypart == BODY_ZONE_PRECISE_R_HAND)
		hand_layer = EXTERNAL_HANDS
		bodypart = BODY_ZONE_R_ARM
	var/obj/item/bodypart/people_part =  target.get_bodypart(bodypart)
	if(people_part)
		var/datum/bodypart_overlay/simple/body_marking/zonal/overlay = new /datum/bodypart_overlay/simple/body_marking/zonal()
		var/datum/sprite_accessory/accessory = overlay.get_accessory(value)

		if(isnull(accessory))
			CRASH("Value: [value] did not have a corresponding sprite accessory!")

		overlay.icon = accessory.icon
		overlay.icon_state = accessory.icon_state
		if(hand_layer)
			overlay.hand_marking = TRUE
			overlay.layers = hand_layer
		if(bodypart == BODY_ZONE_HEAD)
			overlay.use_gender = FALSE
		else
			overlay.use_gender = accessory.gender_specific

		overlay.draw_color = colorvalue || accessory.color_src
		people_part.add_bodypart_overlay(overlay)

//cover_flags2body_zones is funky with hand bitflags for some reason. this is more efficient for what we want to do anyway
/datum/species/proc/marking_zones(zone)
	if(!zone)
		return
	switch(zone)
		if(HEAD)
			return BODY_ZONE_HEAD
		if(CHEST)
			return BODY_ZONE_CHEST
		if(ARM_LEFT)
			return BODY_ZONE_L_ARM
		if(ARM_RIGHT)
			return BODY_ZONE_R_ARM
		if(HAND_LEFT)
			return BODY_ZONE_PRECISE_L_HAND
		if(HAND_RIGHT)
			return BODY_ZONE_PRECISE_R_HAND
		if(LEG_LEFT)
			return BODY_ZONE_L_LEG
		if(LEG_RIGHT)
			return BODY_ZONE_R_LEG

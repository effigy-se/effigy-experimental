/// Standard marking colors!
/datum/preference/tri_color/body_markings
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "markings_tri"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/body_markings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["markings_tri_1"] = value[1]
	target.dna.features["markings_tri_2"] = value[2]
	target.dna.features["markings_tri_3"] = value[3]

/datum/preference/tri_color/body_markings/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/body_markings/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE

//manually adding them now
/datum/species/add_body_markings(mob/living/carbon/human/hooman)
	. = ..()
	if((hooman.dna.features["lizard_markings"] && hooman.dna.features["lizard_markings"] != /datum/sprite_accessory/lizard_markings/none::name) && (hooman.client?.prefs.read_preference(/datum/preference/toggle/markings)))
		var/datum/bodypart_overlay/simple/body_marking/markings = new /datum/bodypart_overlay/simple/body_marking/lizard() // made to die... mostly because we cant use initial on lists but its convenient and organized
		var/accessory_name = hooman.dna.features[markings.dna_feature_key] //get the accessory name from dna
		var/datum/sprite_accessory/moth_markings/accessory = markings.get_accessory(accessory_name) //get the actual datum

		if(isnull(accessory))
			CRASH("Value: [accessory_name] did not have a corresponding sprite accessory!")

		for(var/obj/item/bodypart/part as anything in markings.applies_to) //check through our limbs
			var/obj/item/bodypart/people_part = hooman.get_bodypart(initial(part.body_zone)) // and see if we have a compatible marking for that limb

			if(!people_part)
				continue

			var/datum/bodypart_overlay/simple/body_marking/overlay = new /datum/bodypart_overlay/simple/body_marking/lizard()

			// Tell the overlay what it should look like
			overlay.icon = accessory.icon
			overlay.icon_state = accessory.icon_state
			overlay.use_gender = accessory.gender_specific
			overlay.draw_color = accessory.color_src ? hooman.dna.features["mcolor"] : null

			people_part.add_bodypart_overlay(overlay)

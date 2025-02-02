/// Body markings toggle
/datum/preference/toggle/markings
	savefile_key = "body_markings_toggle"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/markings/apply_to_human(mob/living/carbon/human/target, value)
	//if(value == FALSE)
	target.dna.features["lizard_markings"] = /datum/sprite_accessory/lizard_markings/none::name

/datum/preference/choiced/lizard_body_markings/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/body_markings_color::savefile_key
	return data

/datum/preference/toggle/markings/create_default_value()
	return FALSE

/// Lizard body markings type
/datum/preference/choiced/lizard_body_markings
	category = PREFERENCE_CATEGORY_CLOTHING

/datum/preference/choiced/lizard_body_markings/create_default_value()
	return /datum/sprite_accessory/lizard_markings/none::name

/datum/preference/choiced/lizard_body_markings/is_accessible(datum/preferences/preferences)
	. = ..()
	/*
	var/has_markings = preferences.read_preference(/datum/preference/toggle/markings)
	if(has_markings == TRUE)
		return TRUE
	*/
	return FALSE

/// Add lizard body markings
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

/// Body markings colors
/datum/preference/tri_color/body_markings_color
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "body_markings_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/body_markings_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["body_markings_color_1"] = value[1]
	target.dna.features["body_markings_color_2"] = value[2]
	target.dna.features["body_markings_color_3"] = value[3]

/datum/preference/tri_color/body_markings_color/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/body_markings_color/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE

/datum/bodypart_overlay/simple/body_marking/lizard
	layers = EXTERNAL_ADJACENT | EXTERNAL_ADJACENT_2 | EXTERNAL_ADJACENT_3

/datum/bodypart_overlay/simple/body_marking/lizard/get_image(layer, obj/item/bodypart/limb)
	if(limb == null)
		return ..()
	if(limb.owner == null)
		return ..()
	var/gender_string = (use_gender && limb.is_dimorphic) ? (limb.gender == MALE ? MALE : FEMALE + "_") : "" //we only got male and female sprites
	if(layer == bitflag_to_layer(EXTERNAL_ADJACENT_2))
		return image(icon, gender_string + icon_state + "_" + limb.body_zone + "_2", layer = layer)
	if(layer == bitflag_to_layer(EXTERNAL_ADJACENT_3))
		return image(icon, gender_string + icon_state + "_" + limb.body_zone + "_3", layer = layer)
	return image(icon, gender_string + icon_state + "_" + limb.body_zone, layer = layer)

/datum/bodypart_overlay/simple/body_marking/lizard/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(limb == null)
		return ..()
	if(limb.owner == null)
		return ..()
	if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT))
		overlay.color = limb.owner.dna.features["body_markings_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_2))
		overlay.color = limb.owner.dna.features["body_markings_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_3))
		overlay.color = limb.owner.dna.features["body_markings_color_3"]
		return overlay
	return ..()

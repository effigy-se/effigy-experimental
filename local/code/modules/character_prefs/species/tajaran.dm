/mob/living/carbon/human/species/tajaran
	race = /datum/species/tajaran

/datum/species/tajaran
	name = "Tajaran"
	plural_form = "Tajara"
	id = SPECIES_TAJARAN
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/anthro,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/anthro,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/anthro,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/anthro,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/anthro,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/anthro,
	)
	digi_leg_overrides = list(
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/digitigrade/anthro,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/digitigrade/anthro,
	)

/datum/species/tajaran/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	human_for_preview.dna.features["lizard_markings"] = "No Markings"
	human_for_preview.dna.features["body_markings_color_1"] = "#ddddec"
	human_for_preview.dna.features["mcolor"] = "#3a4552"
	human_for_preview.dna.features["snout"] = "Akula"
	human_for_preview.dna.features["snout_color_1"] = "#3a4552"
	human_for_preview.dna.features["snout_color_2"] = "#ddddec"
	human_for_preview.dna.ear_type = MAMMAL_TYPE
	human_for_preview.dna.features["ears"] = "Sergal"
	human_for_preview.dna.features["ears_color_1"] = "#3a4552"
	human_for_preview.dna.features["ears_color_2"] = "#ddddec"
	human_for_preview.dna.features["horns"] = "Ram"
	human_for_preview.dna.features["horns_color_1"] = "#3a4552"
	human_for_preview.dna.features["horns_color_2"] = "#3a4552"
	human_for_preview.set_haircolor("#2b6690", update = FALSE)
	human_for_preview.set_hairstyle("Ponytail (Side) 3", update = TRUE)
	human_for_preview.eye_color_left = "#2a6418"
	human_for_preview.eye_color_right = "#2a6418"
	regenerate_organs(human_for_preview)
	human_for_preview.update_body(is_creating = TRUE)

/datum/species/tajaran/get_species_description()
	return "Your description here!"

/datum/species/tajaran/get_species_lore()
	return list(
		"Your lore here!",
	)

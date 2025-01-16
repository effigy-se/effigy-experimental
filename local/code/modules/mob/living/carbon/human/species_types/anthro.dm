/datum/species/anthro
	name = "Anthromorph"
	id = SPECIES_ANTHRO
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	//mutantears = /obj/item/organ/internal/ears/cat
	mutant_organs = list(
		/obj/item/organ/tail/anthro = "Eevee",
		/obj/item/organ/ears/anthro = "Cat",
		/obj/item/organ/horns = "None",
		/obj/item/organ/frills = "None",
		/obj/item/organ/snout = "Round",
		/obj/item/organ/spines = "None",
		/obj/item/organ/neck_fluff = "None",
		/obj/item/organ/wings/cosmetic = "None",
	)
	mutanttongue = /obj/item/organ/tongue/anthro
	payday_modifier = 1.0
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	skinned_type = /obj/item/stack/sheet/animalhide/human
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/anthro,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/anthro,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/anthro,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/anthro,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/anthro,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/anthro,
	)
	digitigrade_customization = DIGITIGRADE_OPTIONAL

/datum/species/anthro/get_physical_attributes()
	return "Felinids are very similar to humans in almost all respects, with their biggest differences being the ability to lick their wounds, \
		and an increased sensitivity to noise, which is often detrimental. They are also rather fond of eating oranges."

/datum/species/anthro/get_species_description()
	return "Felinids are one of the many types of bespoke genetic \
		modifications to come of humanity's mastery of genetic science, and are \
		also one of the most common. Meow?"

/datum/species/anthro/get_species_lore()
	return list(
		"Bio-engineering at its felinest, animalid are the peak example of humanity's mastery of genetic code. \
			One of many \"Animalid\" variants, animalid are the most popular and common, as well as one of the \
			biggest points of contention in genetic-modification.",

		"Body modders were eager to splice human and animal DNA in search of the holy trifecta: ears, eyes, and tail. \
			These traits were in high demand, with the corresponding side effects of vocal and neurochemical changes being seen as a minor inconvenience.",

		"Sadly for the animalid, they were not minor inconveniences. Shunned as subhuman and monstrous by many, animalid (and other Animalids) \
			sought their greener pastures out in the colonies, cloistering in communities of their own kind. \
			As a result, outer Human space has a high Animalid population.",
	)

// Felinids are subtypes of humans.
// This shouldn't call parent or we'll get a buncha human related perks (though it doesn't have a reason to).
/datum/species/anthro/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "grin-tongue",
			SPECIES_PERK_NAME = "Grooming",
			SPECIES_PERK_DESC = "Lick wounds to reduce bleeding.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
			SPECIES_PERK_ICON = FA_ICON_PERSON_FALLING,
			SPECIES_PERK_NAME = "Catlike Grace",
			SPECIES_PERK_DESC = "Catlike instincts allowing them to land upright on their feet.  \
				Instead of being knocked down from falling, you only receive a short slowdown. \
				However, they do not have catlike legs, and the fall will deal additional damage.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "assistive-listening-systems",
			SPECIES_PERK_NAME = "Sensitive Hearing",
			SPECIES_PERK_DESC = "More sensitive to loud sounds, such as flashbangs.",
		),
	)

	return to_add

/*
/datum/species/anthro/on_species_gain(mob/living/carbon/carbon_being, datum/species/old_species, pref_load)
	if(ishuman(carbon_being))
		var/mob/living/carbon/human/target_human = carbon_being
		if(target_human.dna.features["ears"] == "None")
			mutantears = /obj/item/organ/ears
		else
			var/obj/item/organ/ears/cat/ears = new(FALSE, target_human.dna.features["ears"])
			ears.Insert(target_human, movement_flags = DELETE_IF_REPLACED)
	return ..()
*/

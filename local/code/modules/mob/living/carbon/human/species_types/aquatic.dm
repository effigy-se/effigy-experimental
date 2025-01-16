/datum/species/aquatic
	name = "Aquatic"
	id = SPECIES_AQUATIC
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mutant_organs = list(
		/obj/item/organ/tail/anthro = "Eevee",
		///obj/item/organ/internal/ears/cat = "Cat",
		/obj/item/organ/horns = "None",
		/obj/item/organ/frills = "None",
		/obj/item/organ/snout = "Round",
		/obj/item/organ/spines = "None",
		/obj/item/organ/neck_fluff = "None",
		/obj/item/organ/wings/cosmetic = "None",
	)
	mutanttongue = /obj/item/organ/tongue/anthro
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	skinned_type = /obj/item/stack/sheet/animalhide/human
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/anthro,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/anthro,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/anthro,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/anthro,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/anthro,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/anthro,
	)

/datum/species/aquatic/get_physical_attributes()
	return "Felinids are very similar to humans in almost all respects, with their biggest differences being the ability to lick their wounds, \
		and an increased sensitivity to noise, which is often detrimental. They are also rather fond of eating oranges."

/datum/species/aquatic/get_species_description()
	return "Felinids are one of the many types of bespoke genetic \
		modifications to come of humanity's mastery of genetic science, and are \
		also one of the most common. Meow?"

/datum/species/aquatic/get_species_lore()
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

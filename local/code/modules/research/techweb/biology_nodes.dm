/datum/techweb_node/gene_engineering/New()
	design_ids += list(
		"dna_fixer",
	)
	return ..()

// Hypospray upgrade
/datum/design/hypomkii/deluxe
	name = "Hypospray Mk. II Deluxe Upgrade"
	id = "hypomkii_deluxe"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/plastic = SHEET_MATERIAL_AMOUNT * 8,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 4,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT * 2,
	)
	build_path = /obj/item/device/custom_kit/deluxe_hypo2
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_EQUIPMENT_MEDICAL,
	)

// Hypospray Research
/datum/techweb_node/chem_synthesis/New()
	design_ids += list(
		"hypovial",
		"large_hypovial",
		"hypokit",
		"hypomkii",
	)
	return ..()

/datum/techweb_node/medbay_equip_adv/New()
	design_ids += list(
		"hypokit_deluxe",
	)
	return ..()

/datum/techweb_node/alien_surgery/New()
	design_ids += list(
		"hypomkii_deluxe",
	)
	return ..()

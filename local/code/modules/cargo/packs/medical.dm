/datum/supply_pack/medical/kit_technician
	name = "Heavy Duty Medical Kit Crate - Technician"
	crate_name = "technician kit crate"
	desc = "Contains a pink medical technician kit."
	access = ACCESS_MEDICAL
	cost = CARGO_CRATE_VALUE * 7
	contains = list(
		/obj/item/storage/backpack/duffelbag/deforest_paramedic/stocked,
	)
	crate_name = "medical technician crate"
	crate_type = /obj/structure/closet/crate/deforest

/datum/supply_pack/medical/firstaidmixed
	name = "Mixed Medical Kits"
	desc = "Contains one of each medical kits for dealing with a variety of injured crewmembers."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(
		/obj/item/storage/medkit/toxin,
		/obj/item/storage/medkit/o2,
		/obj/item/storage/medkit/brute,
		/obj/item/storage/medkit/fire,
		/obj/item/storage/medkit/regular,
	)
	crate_name = "medical kit crate"
	crate_type = /obj/structure/closet/crate/deforest

/datum/supply_pack/medical/modsuit_medical
	name = "Medical MODsuit Crate"
	desc = "Contains a single MODsuit, built to standard medical specifications."
	cost = CARGO_CRATE_VALUE * 13
	access = ACCESS_MEDICAL
	contains = list(/obj/item/mod/control/pre_equipped/medical)
	crate_name = "medical MODsuit crate"
	crate_type = /obj/structure/closet/crate/secure //No medical variant with security locks.

/datum/supply_pack/medical/compact_defib
	name = "Compact Defibrillator Crate"
	desc = "Contains a single compact defibrillator. Capable of being worn as a belt."
	cost = CARGO_CRATE_VALUE * 4.5
	access = ACCESS_MEDICAL
	contains = list(/obj/item/defibrillator/compact)
	crate_name = "compact defibrillator crate"
	crate_type = /obj/structure/closet/crate/deforest

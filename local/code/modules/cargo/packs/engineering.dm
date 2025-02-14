/datum/supply_pack/engineering/rcd/mkii
	name = "RCD Mk II Crate"
	desc = "Contains 3 upgraded RCDs featuring superior material storage."
	access = ACCESS_ENGINE_EQUIP
	cost = CARGO_CRATE_VALUE * 21
	contains = list(
		/obj/item/construction/rcd/mkii,
		/obj/item/construction/rcd/mkii,
		/obj/item/construction/rcd/mkii,
	)
	crate_name = "RCD Mk II crate"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/engineering/modsuit_engineering
	name = "Engineering MODsuit Crate"
	desc = "Contains a single MODsuit, built to standard engineering specifications."
	access = ACCESS_ENGINE_EQUIP
	contains = list(/obj/item/mod/control/pre_equipped/engineering)
	cost = CARGO_CRATE_VALUE * 14
	crate_name = "engineering MODsuit crate"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/engineering/modsuit_atmospherics
	name = "Atmospherics MODsuit Crate"
	desc = "Contains a single MODsuit, built to standard atmospherics specifications."
	access = ACCESS_ENGINE_EQUIP
	contains = list(/obj/item/mod/control/pre_equipped/atmospheric)
	cost = CARGO_CRATE_VALUE * 14
	crate_name = "atmospherics MODsuit crate"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/engineering/doublecap_tanks
	name = "Double Extended Emergency Tank Crate"
	desc = "Contains four double extended-capacity emergency tanks."
	access_view = ACCESS_ENGINE_EQUIP
	contains = list(
		/obj/item/tank/internals/emergency_oxygen/double,
		/obj/item/tank/internals/emergency_oxygen/double,
		/obj/item/tank/internals/emergency_oxygen/double,
		/obj/item/tank/internals/emergency_oxygen/double,
	)
	cost = CARGO_CRATE_VALUE * 6
	crate_name = "double extended emergency tank crate"

/datum/supply_pack/engineering/gas_miner
	name = "Gas Miner Delivery Beacon Crate"
	desc = "Contains a single gas miner delivery beacon, for the ordering of one gas miner."
	access = ACCESS_ATMOSPHERICS
	contains = list(/obj/item/summon_beacon/gas_miner)
	cost = CARGO_CRATE_VALUE * 35
	crate_name = "gas miner delivery beacon crate"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/engineering/engi_inducers
	name = "NT-150 Industrial Power Inducers Crate"
	desc = "An improved model over the NT-75 EPI, the NT-150 charges at double the rate and contains an improved powercell. Contains two engineering-spec Inducers."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(
		/obj/item/inducer,
		/obj/item/inducer,
	)
	crate_name = "engineering inducer crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

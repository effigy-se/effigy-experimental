// Non-Booze
/datum/chemical_reaction/drink/pinkmilk
	results = list(/datum/reagent/consumable/pinkmilk = 2)
	required_reagents = list(/datum/reagent/consumable/berryjuice = 1, /datum/reagent/consumable/milk = 1, /datum/reagent/consumable/sugar = 1)

/datum/chemical_reaction/drink/pinktea
	results = list(/datum/reagent/consumable/pinktea = 5)
	required_reagents = list(/datum/reagent/consumable/berryjuice = 1, /datum/reagent/consumable/tea/arnold_palmer = 1, /datum/reagent/consumable/sugar = 1)

/datum/chemical_reaction/drink/catnip_tea
	results = list(/datum/reagent/consumable/catnip_tea = 10)
	required_reagents = list(/datum/reagent/consumable/tea = 5, /datum/reagent/pax/catnip = 2)

/datum/chemical_reaction/drink/shakiri_spritz
	results = list(/datum/reagent/consumable/ethanol/shakiri_spritz = 3)
	required_reagents = list(/datum/reagent/consumable/ethanol/shakiri = 1, /datum/reagent/consumable/sodawater = 1, /datum/reagent/consumable/orangejuice = 1)
	mix_message = "The liquids combine to create a pleasant orange mixture."

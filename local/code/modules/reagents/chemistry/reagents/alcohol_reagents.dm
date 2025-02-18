/datum/reagent/consumable/ethanol/shakiri
	name = "Shakiri"
	description = "A sweet, fragrant red drink made from fermented kiri fruits. It seems to gently sparkle when exposed to light."
	boozepwr = 45
	color = "#cf3c3c"
	quality = DRINK_GOOD
	taste_description = "delicious liquified jelly"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/glass_style/drinking_glass/shakiri
	required_drink_type = /datum/reagent/consumable/ethanol/shakiri
	icon = 'local/icons/obj/drinks/mixed_drinks.dmi'
	icon_state = "shakiri"
	name = "glass of shakiri"
	desc = "A sweet, fragrant red drink made from fermented kiri fruits. It seems to gently sparkle when exposed to light."

/datum/reagent/consumable/ethanol/shakiri_spritz
	name = "Shakiri Spritz"
	description = "A carbonated cocktail made from shakiri and orange juice with soda water."
	color = "#cf863c"
	quality = DRINK_GOOD
	boozepwr = 45
	taste_description = "tangy, carbonated sweetness"

/datum/glass_style/drinking_glass/shakiri_spritz
	required_drink_type = /datum/reagent/consumable/ethanol/shakiri_spritz
	icon = 'local/icons/obj/drinks/mixed_drinks.dmi'
	icon_state = "shakiri_spritz"
	name = "glass of shakiri spritz"
	desc = "A carbonated cocktail made from shakiri and orange juice with soda water."

// ROBOT ALCOHOL PAST THIS POINT
// WOOO!
/datum/reagent/consumable/ethanol/synthanol
	name = "Synthanol"
	description = "A runny liquid with conductive capacities. Its effects on synthetics are similar to those of alcohol on organics."
	color = "#1BB1FF"
	process_flags = REAGENT_ORGANIC | REAGENT_SYNTHETIC
	boozepwr = 50
	quality = DRINK_NICE
	taste_description = "motor oil"

/datum/glass_style/drinking_glass/synthanol
	required_drink_type = /datum/reagent/consumable/ethanol/synthanol
	icon = 'local/icons/obj/drinks/mixed_drinks.dmi' // This should cover anything synthanol related. Will have to individually tag others unless we make an object path for skyrat drinks.
	icon_state = "synthanolglass"
	name = "glass of synthanol"
	desc = "The equivalent of alcohol for synthetic crewmembers. They'd find it awful if they had tastebuds too."

/datum/reagent/consumable/ethanol/synthanol/on_mob_life(mob/living/carbon/drinker, seconds_per_tick, times_fired)
	if(!(drinker.mob_biotypes & MOB_ROBOTIC))
		drinker.reagents.remove_reagent(type, 3.6) //gets removed from organics very fast
		if(prob(25))
			drinker.vomit(VOMIT_CATEGORY_DEFAULT)
	return ..()

/datum/reagent/consumable/ethanol/synthanol/expose_mob(mob/living/exposed_mob, methods = TOUCH, reac_volume)
	. = ..()
	if(exposed_mob.mob_biotypes & MOB_ROBOTIC)
		return
	if(methods == INGEST)
		to_chat(exposed_mob, pick(span_danger("That was awful!"), span_danger("That was disgusting!")))

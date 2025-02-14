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

// Catnip
/datum/reagent/pax/catnip
	name = "Catnip"
	taste_description = "grass"
	description = "A colourless liquid that makes people more peaceful and felines happier."
	metabolization_rate = 1.75 * REAGENTS_METABOLISM

/datum/reagent/pax/catnip/on_mob_life(mob/living/carbon/carbon_mob)
	if(isfelinid(carbon_mob))
		if(prob(20))
			carbon_mob.emote("nya")
		if(prob(20))
			to_chat(carbon_mob, span_notice("[pick("Headpats feel nice.", "Backrubs would be nice.", "Mew")]"))
	else
		to_chat(carbon_mob, span_notice("[pick("I feel oddly calm.", "I feel relaxed.", "Mew?")]"))
	..()

///How many times did we survive being a cripple?
/datum/award/score/hardcore_random
	name = "Hardcore random points"
	desc = "Well, I might be a blind, deaf, crippled guy, but hey, at least I'm alive."
	database_id = HARDCORE_RANDOM_SCORE

///How many maintenance pills did you eat?
/datum/award/score/maintenance_pill
	name = "Maintenance Pills Consumed"
	desc = "Wait why?"
	database_id = MAINTENANCE_PILL_SCORE

///How high of a score on the Intento did we get?
/datum/award/score/intento_score
	name = "Intento Score"
	desc = "A blast from the future?"
	database_id = INTENTO_SCORE

/// What's the highest amount of style points we've gotten?
/datum/award/score/style_score
	name = "Style Score"
	desc = "You might not be a robot, but you were damn close."
	database_id = STYLE_SCORE

/datum/award/score/list/fish
	name = "Fish Species Caught"
	desc = "How many different species of fish you've caught in your whole spessman life. Gotta fish 'em all."
	database_id = FISH_SCORE

/datum/award/score/list/fish/validate_entries(text)
	var/list/entries = ..()
	var/list/converted_entries = list()
	for(var/text_type in entries)
		var/fish_path = text2path(text_type)
		if(ispath(fish_path, /obj/item/fish))
			converted_entries += fish_path
	return converted_entries

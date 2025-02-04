/datum/dna
	/// Current body size, used for proper re-sizing and keeping track of that
	var/current_body_size = DNA_BODY_SIZE_DEFAULT

/datum/dna/proc/update_effigy_body_size()
	if(!holder || species.body_size_restricted || current_body_size == features["body_size"])
		return
	var/change_multiplier = features["body_size"] / current_body_size
	// We update the translation to make sure our character doesn't go out of the southern bounds of the tile
	var/translate = ((change_multiplier-1) * 32) / 2
	holder.transform = holder.transform.Scale(change_multiplier)
	// Splits the updated translation into X and Y based on the user's rotation.
	var/translate_x = translate * ( holder.transform.b / features["body_size"] )
	var/translate_y = translate * ( holder.transform.e / features["body_size"] )
	holder.transform = holder.transform.Translate(translate_x, translate_y)
	holder.maptext_height = 32 * features["body_size"] // Adjust runechat height
	current_body_size = features["body_size"]

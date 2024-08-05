/datum/controller/subsystem/accessories
	var/list/cached_mutant_sprite_accessories = list()

/datum/sprite_accessory
	var/feature_key = null
	///When the color selection is DNA_INDEX_COLOR, this is the DNA extension block that is read from a character to get the saved mutant part color.
	var/dna_color
	var/list/accessory_layers
	var/list/color_channels

/datum/sprite_accessory/New()
	if(color_src == DNA_INDEX_COLOR)
		color_channels = list()
		if(!SSaccessories.cached_mutant_sprite_accessories[icon])
			SSaccessories.cached_mutant_sprite_accessories[icon] = icon_states(new /icon(icon))
		for(var/layer in accessory_layers)
			var/layer_state = layer == BODY_BEHIND_LAYER ? "BEHIND" : (layer == BODY_ADJ_LAYER ? "ADJ" : "FRONT")
			if("m_[feature_key]_[icon_state]_[layer_state]_primary" in SSaccessories.cached_mutant_sprite_accessories[icon])
				color_channels["1"] = "primary"
			if("m_[feature_key]_[icon_state]_[layer_state]_secondary" in SSaccessories.cached_mutant_sprite_accessories[icon])
				color_channels["2"] = "secondary"
			if("m_[feature_key]_[icon_state]_[layer_state]_tertiary" in SSaccessories.cached_mutant_sprite_accessories[icon])
				color_channels["3"] = "tertiary"

/datum/sprite_accessory/tails/anthro
	icon = 'local/icons/mob/mutant/sprite_accessories/tails.dmi'
	feature_key = "tail_anthro"
	dna_color = "dna_tail_color"
	//color_channels = SPRITE_ACCESSORY_DUAL_COLOR
	color_src = DNA_INDEX_COLOR
	accessory_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/tails/anthro/none
	name = "None"
	icon_state = "none"
	//color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/fennec
	name = "Fennec (Dual)"
	icon_state = "fennec"

/datum/sprite_accessory/tails/anthro/murid
	name = "Murid (Single)"
	icon_state = "murid"
	//color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/murid_two
	name = "Murid Alt (Single)"
	icon_state = "murid_two"
	//color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/shark
	name = "Shark (Single)"
	icon_state = "shark"
	//color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/hawk
	name = "Hawk (Dual)"
	icon_state = "hawk"

/datum/sprite_accessory/tails/anthro/otie
	name = "Otie (Single)"
	icon_state = "otie"
	//color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/australian_shepherd
	name = "Australian Shepherd (Dual)"
	icon_state = "australianshepherd"

/datum/sprite_accessory/tails/anthro/wah
	name = "Wah (Dual)"
	icon_state = "wah"

/datum/sprite_accessory/tails/anthro/guilmon
	name = "Guilmon (Single)"
	icon_state = "guilmon"
	//color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/rabbit
	name = "Rabbit (Single)"
	icon_state = "rabbit"
	//color_channels = SPRITE_ACCESSORY_SOLO_COLOR

/datum/sprite_accessory/tails/anthro/sabresun
	name = "Sabresun (Dual)"
	icon_state = "sabresun"

/datum/sprite_accessory/tails/anthro/sergal
	name = "Sergal (Dual)"
	icon_state = "sergal"

/datum/sprite_accessory/tails/anthro/tiger
	name = "Tiger (Triple)"
	icon_state = "tiger"
	//color_channels = SPRITE_ACCESSORY_DUAL_COLOR

/datum/sprite_accessory/tails/anthro/eevee
	name = "Eevee (Dual)"
	icon_state = "eevee"

/datum/sprite_accessory/tails/anthro/husky
	name = "Husky (Dual)"
	icon_state = "husky"

/datum/sprite_accessory/tails/anthro/husky_debug
	name = "Husky Debug (Dual)"
	icon_state = "husky2"

/datum/sprite_accessory/tails/anthro/leopard
	name = "Leopard (Tertiary Conversion)"
	icon_state = "leopard"

/datum/sprite_accessory/frills
	dna_color = "dna_frills_color"

/datum/sprite_accessory/snouts
	dna_color = "dna_snout_color"
	feature_key = "snout"
	color_src = DNA_INDEX_COLOR
	accessory_layers = list(BODY_ADJ_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/snouts/anthro
	icon = 'local/icons/mob/mutant/sprite_accessories/snouts.dmi'

/datum/sprite_accessory/snouts/anthro/husky
	name = "Husky"
	icon_state = "husky"

/datum/sprite_accessory/snouts/anthro/rhino
	name = "Horn"
	icon_state = "rhino"

/datum/sprite_accessory/snouts/anthro/rodent
	name = "Rodent"
	icon_state = "rodent"

/datum/sprite_accessory/snouts/anthro/vulpkanin/lcanid
	name = "anthro, Long"
	icon_state = "lcanid"

/datum/sprite_accessory/snouts/anthro/lcanidalt
	name = "anthro, Long ALT"
	icon_state = "lcanidalt"

/datum/sprite_accessory/snouts/anthro/vulpkanin/lcanidstriped
	name = "anthro, Long, Striped"
	icon_state = "lcanidstripe"

/datum/sprite_accessory/snouts/anthro/lcanidstripedalt
	name = "anthro, Long, Striped ALT"
	icon_state = "lcanidstripealt"

/datum/sprite_accessory/snouts/anthro/tajaran/scanid
	name = "anthro, Short"
	icon_state = "scanid"

/datum/sprite_accessory/snouts/anthro/tajaran/scanidalt
	name = "anthro, Short ALT"
	icon_state = "scanidalt"

/datum/sprite_accessory/snouts/anthro/tajaran/scanidalt2
	name = "anthro, Short ALT 2"
	icon_state = "scanidalt2"

/datum/sprite_accessory/snouts/anthro/tajaran/scanidalt3
	name = "anthro, Short ALT 3"
	icon_state = "scanidalt3"

/datum/sprite_accessory/snouts/anthro/tajaran/normal
	name = "Tajaran, normal (Single)"
	icon_state = "ntajaran"
	color_src = DNA_INDEX_COLOR

/datum/sprite_accessory/snouts/anthro/wolf
	name = "anthro, Thick"
	icon_state = "wolf"

/datum/sprite_accessory/snouts/anthro/wolfalt
	name = "anthro, Thick ALT"
	icon_state = "wolfalt"

/datum/sprite_accessory/snouts/anthro/otie
	name = "Otie"
	icon_state = "otie"

/datum/sprite_accessory/snouts/anthro/otiesmile
	name = "Otie Smile"
	icon_state = "otiesmile"

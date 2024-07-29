#define DEFAULT_SPRITE_LIST "default_sprites"

/datum/controller/subsystem/accessories
	var/list/tails_list_anthro

/datum/controller/subsystem/accessories/setup_lists()
	. = ..()
	tails_list_anthro = init_sprite_accessory_subtypes(/datum/sprite_accessory/tails/anthro, add_blank = TRUE)[DEFAULT_SPRITE_LIST]

#undef DEFAULT_SPRITE_LIST

#define DEFAULT_SPRITE_LIST "default_sprites"

/datum/controller/subsystem/accessories
	var/list/tails_list_anthro
	var/list/neck_fluff_list
	var/list/cosmetic_wings_list
	/*
	var/list/bodypart_markings = list()
	var/list/bodypart_markings_per_limb
	var/list/cached_mutant_sprite_accessories = list()
	var/list/markings_per_limb = list()
	var/static/list/marking_zones = list(
		BODY_ZONE_HEAD,
		BODY_ZONE_CHEST,
		BODY_ZONE_L_LEG,
		BODY_ZONE_R_LEG,
		BODY_ZONE_L_ARM,
		BODY_ZONE_R_ARM,
		BODY_ZONE_PRECISE_L_HAND,
		BODY_ZONE_PRECISE_R_HAND,
	)
	var/static/list/marking_zones_to_bitflag = list(
		BODY_ZONE_HEAD = HEAD,
		BODY_ZONE_CHEST = CHEST,
		BODY_ZONE_L_LEG = LEG_LEFT,
		BODY_ZONE_R_LEG = LEG_RIGHT,
		BODY_ZONE_L_ARM = ARM_LEFT,
		BODY_ZONE_R_ARM = ARM_RIGHT,
		BODY_ZONE_PRECISE_L_HAND = HAND_LEFT,
		BODY_ZONE_PRECISE_R_HAND = HAND_RIGHT
	)
	*/

/datum/controller/subsystem/accessories/setup_lists()
	. = ..()
	tails_list_anthro = init_sprite_accessory_subtypes(/datum/sprite_accessory/tails/anthro)[DEFAULT_SPRITE_LIST]
	neck_fluff_list = init_sprite_accessory_subtypes(/datum/sprite_accessory/neck_fluff)[DEFAULT_SPRITE_LIST]
	cosmetic_wings_list = init_sprite_accessory_subtypes(/datum/sprite_accessory/cosmetic_wings, add_blank = TRUE)[DEFAULT_SPRITE_LIST]

#undef DEFAULT_SPRITE_LIST

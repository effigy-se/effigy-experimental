// Modular species
#define SPECIES_ANTHRO "anthro"
#define SPECIES_AQUATIC "aquatic"
#define SPECIES_SYNTH "synth"

// Modular bodyparts
#define BODYPART_ICON_ANTHRO 'local/icons/mob/species/anthro_parts_greyscale.dmi'
#define BODYPART_ICON_SYNTH_BASE 'local/icons/mob/species/synth_parts.dmi'
#define BODYPART_ICON_SYNTH_LIZARD 'local/icons/mob/species/synthliz_parts_greyscale.dmi'

GLOBAL_LIST_INIT(species_blacklist_no_mutant, list(
	/datum/species/human,
))

GLOBAL_LIST_EMPTY(species_blacklist_no_humanoid)

// What reagents are species able to process?
#define PROCESS_ORGANIC 1
#define PROCESS_SYNTHETIC 2

#define REAGENT_ORGANIC 1
#define REAGENT_SYNTHETIC 2

// Body markings
// TGUI
#define PREFERENCE_CATEGORY_MARKINGS "markings"

// length of the dna feature marking list
#define MARKING_LIST_LEN 24

// dna feature marking list item locations
#define MARKING_HEAD 1
#define MARKING_HEAD2 2
#define MARKING_HEAD3 3
#define MARKING_CHEST 4
#define MARKING_CHEST2 5
#define MARKING_CHEST3 6
#define MARKING_RARM 7
#define MARKING_RARM2 8
#define MARKING_RARM3 9
#define MARKING_LARM 10
#define MARKING_LARM2 11
#define MARKING_LARM3 12
#define MARKING_LHAND 13
#define MARKING_LHAND2 14
#define MARKING_LHAND3 15
#define MARKING_RHAND 16
#define MARKING_RHAND2 17
#define MARKING_RHAND3 18
#define MARKING_LLEG 19
#define MARKING_LLEG2 20
#define MARKING_LLEG3 21
#define MARKING_RLEG 22
#define MARKING_RLEG2 23
#define MARKING_RLEG3 24

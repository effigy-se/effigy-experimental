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

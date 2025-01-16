// External organ slots
#define ORGAN_SLOT_EXTERNAL_FLUFF "neck_fluff"

// The string has to much the type name of the organ they represent, i.e. /obj/item/organ/tail/lizard
// What are we gonna do for felinid tail, fuck me.
#define NO_TAIL "none"
#define ANTHRO_TAIL "anthro"
#define CAT_TAIL "cat"
#define FISH_TAIL "fish"
#define LIZARD_TAIL "lizard"
#define MONKEY_TAIL "monkey"

#define NO_EARS "none"
#define ANTHRO_EARS "anthro"
#define LIZARD_EARS "lizard"
#define CYBERNETIC_EARS "cybernetic"

///	This list gets read by the dropdown pref when a player chooses what type of sprite accessory to access
GLOBAL_LIST_INIT(mutant_ears_variations, list(
	ANTHRO_EARS,
	LIZARD_EARS,
	CYBERNETIC_EARS,
))

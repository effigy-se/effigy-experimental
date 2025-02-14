// Defines for processing reagents, ie: Synths
#define PROCESS_ORGANIC (1<<0)
#define PROCESS_SYNTHETIC (1<<1)

#define REAGENT_ORGANIC (1<<0)
#define REAGENT_SYNTHETIC (1<<1)

DEFINE_BITFIELD(reagent_flags, list(
	"PROCESS_ORGANIC" = PROCESS_ORGANIC,
	"PROCESS_SYNTHETIC" = PROCESS_SYNTHETIC,
))

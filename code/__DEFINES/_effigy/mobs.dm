// Modular species
#define SPECIES_ANTHRO "anthro"

// Modular bodyparts
#define BODYPART_ICON_ANTHRO 'local/icons/mob/species/anthro_parts_greyscale.dmi'

//Bitflags for the layers a bodypart overlay can draw on (can be drawn on multiple layers)
/// Draws overlay on the BODY_FRONT_LAYER
#define EXTERNAL_FRONT (1 << 0)
#define EXTERNAL_FRONT_SECONDARY (1 << 1)
#define EXTERNAL_FRONT_TERTIARY (1 << 2)
/// Draws overlay on the BODY_ADJ_LAYER
#define EXTERNAL_ADJACENT (1 << 3)
#define EXTERNAL_ADJACENT_SECONDARY (1 << 4)
#define EXTERNAL_ADJACENT_TERTIARY (1 << 5)
/// Draws overlay on the BODY_BEHIND_LAYER
#define EXTERNAL_BEHIND (1 << 6)
#define EXTERNAL_BEHIND_SECONDARY (1 << 7)
#define EXTERNAL_BEHIND_TERTIARY (1 << 8)
/// Draws organ on all EXTERNAL layers
#define ALL_EXTERNAL_OVERLAYS EXTERNAL_FRONT | EXTERNAL_FRONT_SECONDARY | EXTERNAL_FRONT_TERTIARY | EXTERNAL_ADJACENT | EXTERNAL_ADJACENT_SECONDARY | EXTERNAL_ADJACENT_TERTIARY | EXTERNAL_BEHIND | EXTERNAL_BEHIND_SECONDARY | EXTERNAL_BEHIND_TERTIARY

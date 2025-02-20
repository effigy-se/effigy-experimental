/// The speed a synth consumes electricity
#define SYNTH_ENERGY_CONSUMPTION (210 JOULES)
// These should probably be parts of the synth DNA, not defines. (So they could like, upgrade or something)
#define SYNTH_CHARGE_MAX (STANDARD_CELL_CHARGE * 140)
#define SYNTH_CHARGE_NOTREQ (STANDARD_CELL_CHARGE * 130)
#define SYNTH_CHARGE_RATE (STANDARD_CELL_RATE * 1.4)
#define SYNTH_CHARGE_DELAY (1.5 SECONDS)
#define SYNTH_APC_MINIMUM_PERCENT 30

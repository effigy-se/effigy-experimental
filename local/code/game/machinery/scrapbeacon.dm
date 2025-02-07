#define SCRAPBEACON_DEBRIS_DAMAGE 25
#define SCRAPBEACON_IMPACT_PROBABILITY 20
#define SCRAPBEACON_COOLDOWN 20 MINUTES

/obj/machinery/scrap_beacon
	name = "scrap beacon"
	desc = "Electromagnetically pulls scrap and debris towards itself. Manually activated via a button inside the landing zone - dodging is half the fun!"
	icon = 'local/icons/obj/machines/scrap_beacon.dmi'
	icon_state = "beacon"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	circuit = /obj/item/circuitboard/machine/scrap_beacon
	active_power_usage = BASE_MACHINE_ACTIVE_CONSUMPTION * 10 // 10kw
	// Are we currently pulling scrap in?
	var/active = FALSE
	// How likely is any given turf going to get scrap? In percentage
	var/impact_probability = SCRAPBEACON_IMPACT_PROBABILITY
	// Our range - not player-malleable.
	var/impact_range = 2
	// What are we pulling in from space?
	var/scrap_path = /obj/structure/scrap/falls_when_spawned

	COOLDOWN_DECLARE(scrap_sent_cd)

#undef SCRAPBEACON_DEBRIS_DAMAGE
#undef SCRAPBEACON_IMPACT_PROBABILITY
#undef SCRAPBEACON_COOLDOWN

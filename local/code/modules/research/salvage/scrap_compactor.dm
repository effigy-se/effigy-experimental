#define DEFAULT_SCRAPCOMPACTOR_VALUE_CAP 500

/obj/machinery/scrap_compactor
	name = "scrap compactor"
	desc = "Compacts scrap into items more useful to research; at roughly equivalent rate to their market value."
	icon = 'local/icons/obj/machines/scrap_compactor.dmi'
	icon_state = "compactor"
	anchored = TRUE
	density = TRUE
	circuit = /obj/item/circuitboard/machine/scrap_compactor
	/// How much scrap value do we have banked?
	var/banked_value = 0
	/// Our maximum scrap value?
	var/maximum_value = DEFAULT_SCRAPCOMPACTOR_VALUE_CAP

#undef DEFAULT_SCRAPCOMPACTOR_VALUE_CAP

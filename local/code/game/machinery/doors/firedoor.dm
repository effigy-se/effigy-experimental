/obj/machinery/door/firedoor
	name = "emergency shutter"
	desc = "Emergency air-tight shutter, capable of sealing off breached areas. It has a mechanism to open it with just your hands."
	//icon = 'local/icons/obj/doors/firedoor_glass.dmi'
	light_power = 4
	light_range = 2
	var/light_color_idle = COLOR_STARLIGHT
	var/light_color_hot = LIGHT_COLOR_FLARE
	var/light_color_cold = LIGHT_COLOR_BLUE
	var/light_color_generic = LIGHT_COLOR_GLOWSTICK_YELLOW
	var/light_color_emag = LIGHT_COLOR_FAINT_BLUE
	var/light_color_operating = LIGHT_COLOR_FAINT_BLUE
	var/water_sensor = FALSE

/obj/machinery/door/firedoor/proc/check_liquids(turf/checked_turf)
	var/obj/effect/abstract/liquid_turf/liquids = checked_turf.liquids
	if(isnull(liquids))
		return

	if(liquids.height > 1)
		return FIRELOCK_ALARM_TYPE_COLD

// EffigyEdit TODO - put the real sprites
/obj/machinery/door/firedoor/water_sensor
	name = "environmental shutter"
	water_sensor = TRUE

/obj/machinery/door/firedoor/water_sensor/heavy
	name = "heavy environmental shutter"
	desc = /obj/machinery/door/firedoor/heavy::desc
	icon = /obj/machinery/door/firedoor/heavy::icon
	glass = /obj/machinery/door/firedoor/heavy::glass
	explosion_block = /obj/machinery/door/firedoor/heavy::explosion_block
	assemblytype = /obj/machinery/door/firedoor/heavy::assemblytype // This should probably be changed for this and parent; but it's not a big enough issue atm.
	max_integrity = /obj/machinery/door/firedoor/heavy::max_integrity

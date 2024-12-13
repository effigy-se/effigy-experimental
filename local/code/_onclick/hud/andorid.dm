#define MAPTEXT_SYNTH_CHARGE(valuecolor, value) MAPTEXT("<div align='center' valign='middle' style='position:relative; top:0px; left:6px'><font color='[valuecolor]'>[round((value/1000000), 0.01)]MJ</font></div>")

/atom/movable/screen/android
	icon = SPRITE_ACCESSORY_FALLBACK_ICON

/atom/movable/screen/android/energy
	name = "Energy Tracker"
	icon_state = "energy_display"
	screen_loc = "EAST-1:28,CENTER+1:21"

/atom/movable/screen/android/energy/proc/update_energy_hud(core_energy)
	maptext = MAPTEXT_SYNTH_CHARGE(hud_text_color(core_energy), core_energy)

/atom/movable/screen/android/energy/proc/hud_text_color(core_energy)
	return core_energy > 1.7 MEGA JOULES ? "#ffffff" : "#f0197d"

#undef MAPTEXT_SYNTH_CHARGE

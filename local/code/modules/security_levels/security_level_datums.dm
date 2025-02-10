/datum/security_level/blue
	sound = 'sound/announcer/notice/notice2.ogg'

/**
 * Violet
 * Medical emergency
 */
/datum/security_level/violet
	name = "violet"
	announcement_color = "purple"
	sound = 'sound/announcer/notice/notice2.ogg'
	number_level = SEC_LEVEL_VIOLET
	status_display_icon_state = "violetalert"
	fire_alarm_light_color = COLOR_VIOLET
	lowering_to_configuration_key = /datum/config_entry/string/alert_violet_downto
	elevating_to_configuration_key = /datum/config_entry/string/alert_violet_upto
	shuttle_call_time_mod = ALERT_COEFF_VIOLET

/**
 * Orange
 * Engineering emergency
 */
/datum/security_level/orange
	name = "orange"
	announcement_color = "orange"
	sound = 'sound/announcer/notice/notice2.ogg'
	number_level = SEC_LEVEL_ORANGE
	status_display_icon_state = "orangealert"
	fire_alarm_light_color = LIGHT_COLOR_ORANGE
	lowering_to_configuration_key = /datum/config_entry/string/alert_orange_downto
	elevating_to_configuration_key = /datum/config_entry/string/alert_orange_upto
	shuttle_call_time_mod = ALERT_COEFF_ORANGE

/**
 * Amber
 * Securty emergency
 */
/datum/security_level/amber
	name = "amber"
	announcement_color = "yellow"
	sound = 'sound/announcer/notice/notice1.ogg'
	number_level = SEC_LEVEL_AMBER
	status_display_icon_state = "amberalert"
	fire_alarm_light_color = LIGHT_COLOR_DIM_YELLOW
	lowering_to_configuration_key = /datum/config_entry/string/alert_amber_downto
	elevating_to_configuration_key = /datum/config_entry/string/alert_amber_upto
	shuttle_call_time_mod = ALERT_COEFF_AMBER

/datum/security_level/delta
	announcement_color = "default"
	fire_alarm_light_color = COLOR_ASSEMBLY_PURPLE

/datum/latejoin_menu/ui_data(mob/user)
	. = ..()
	var/alert_color = SSsecurity_level.current_security_level.announcement_color
	if(alert_color == "default")
		alert_color = "grey"

	.["alert_level"] = list("name" = capitalize(SSsecurity_level.get_current_level_as_text()), "color" = alert_color)

/**
 * Shows the pregame splash to a new player.
 */
/mob/dead/new_player/verb/show_pregame_splash()
	set category = "Effigy"
	set name = "Pre-Game Splash: Show"

	if(client?.interviewee)
		return

	winset(src, "pregame_splash", "is-disabled=false;is-visible=true")
	winset(src, "status_bar", "is-visible=false")

	/*
	var/datum/asset/assets = get_asset_datum(/datum/asset/simple/lobby) //Sending pictures to the client
	assets.send(src)
	*/

	update_pregame_splash()

/**
 * Removes the pregame splash entirely from a mob.
 */
/mob/dead/new_player/verb/hide_pregame_splash()
	set category = "Effigy"
	set name = "Pre-Game Splash: Hide"
	SIGNAL_HANDLER

	if(client?.mob)
		winset(src, "pregame_splash", "is-disabled=true;is-visible=false")
		winset(src, "status_bar", "is-visible=true")

	UnregisterSignal(SSticker, COMSIG_TICKER_ENTER_PREGAME)

/**
 * Updates the pregame splash HTML.
 */
/mob/dead/new_player/verb/update_pregame_splash()
	set category = "Effigy"
	set name = "Pre-Game Splash: Update"

	//var/data = get_splash_html()
	var/data = EFFIGY_TEMP_HTML

	src << browse(data, "window=pregame_splash")

/mob/dead/new_player/Login()
	. = ..()
	if(SSticker.current_state == GAME_STATE_STARTUP)
		RegisterSignal(SSticker, COMSIG_TICKER_ENTER_PREGAME, TYPE_VERB_REF(/mob/dead/new_player, hide_pregame_splash))
		show_pregame_splash()

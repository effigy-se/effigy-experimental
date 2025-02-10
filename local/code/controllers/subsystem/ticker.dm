/datum/controller/subsystem/ticker
	/// Did we broadcast at players to hurry up?
	var/launch_queued = FALSE
	/// Did we broadcast the start time?
	var/hr_announce_fired = FALSE
	/// UTC time of round start
	var/round_utc_start_time = 0
	/// Have we started the lobby music
	var/lobby_track_fired = FALSE
	/// What is the lobby track this round
	var/lobby_track_id
	/// How long is the lobby track
	var/lobby_track_duration

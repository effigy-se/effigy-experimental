// Security Levels
/datum/config_entry/string/alert_green
	default = "Standard security procedures.<br/>Security may not have weapons visible, privacy laws are in full effect."

/datum/config_entry/string/alert_blue_upto
	default = "Elevated security alert.<br/>Security staff may have weapons visible, random search of crew members may only occur with authorization from the Captain or Head of Personnel."

/datum/config_entry/string/alert_blue_downto
	default = "Elevated security alert.<br/>Security staff may have weapons visible, random search of crew members may only occur with authorization from the Captain or Head of Personnel."

/datum/config_entry/string/alert_violet_upto
	default = "Medical emergency in progress.<br/>All crew are advised to minimize unecessary contact when possible and proceed to medbay for vaccination when advised. Non-medical personnel are required to obey all relevant instructions from medical staff."

/datum/config_entry/string/alert_violet_downto
	default = "Medical emergency in progress.<br/>All crew are advised to minimize unecessary contact when possible and proceed to medbay for vaccination when advised. Non-medical personnel are required to obey all relevant instructions from medical staff."

/datum/config_entry/string/alert_orange_upto
	default = "Engineering emergency in progress.<br/>Engineering staff will have expanded station access during this incident. Non-engineering personnel are required to obey relevant instructions from engineering staff and are recommended to evacuate affected areas."

/datum/config_entry/string/alert_orange_downto
	default = "Engineering emergency in progress.<br/>Engineering staff will have expanded station access during this incident. Non-engineering personnel are required to obey relevant instructions from engineering staff and are recommended to evacuate affected areas."

/datum/config_entry/string/alert_amber_upto
	default = "Security incident developing.<br/>Non-security personnel are advised to comply with relevant instructions from security staff and submit to requested searches.<br/>All security personnel are required to disengage personal activities and come to active duty."

/datum/config_entry/string/alert_amber_downto
	default = "Active security incident in progress.<br/>Non-security personnel are advised to comply with relevant instructions from security staff and submit to requested searches."

/datum/config_entry/string/alert_red_upto
	default = "Immediate serious threat to the station.<br/>Non-security personnel are required to comply with all relevant instructions from security staff and submit to requested searches. Security may use all weapons available."

/datum/config_entry/string/alert_red_downto
	default = "The station's destruction has been averted. However, an immediate serious threat is ongoing.<br/>Security may use all weapons available. All random searches are permitted. Non-security personnel are required to obey all relevant instructions from security staff."

/datum/config_entry/string/alert_delta
	default = "Station destruction imminent. All crew are advised to evacuate the station to a safe place of refuge.<br/>You must comply with all instructions given by heads of staff or security. Any violations of these orders can be punished by death."

/// Length of time before the first autotransfer vote is called (deciseconds, default 2.25 hours)
/// Set to 0 to disable the subsystem altogether.
/datum/config_entry/number/vote_autotransfer_initial
	default = 81000
	min_val = 0

///length of time to wait before subsequent autotransfer votes (deciseconds, default 45 minutes)
/datum/config_entry/number/vote_autotransfer_interval
	default = 27000
	min_val = 0

/// maximum extensions until the round autoends.
/// Set to 0 to force automatic crew transfer after the 'vote_autotransfer_initial' elapsed.
/// Set to -1 to disable the maximum extensions cap.
/datum/config_entry/number/vote_autotransfer_maximum
	default = -1
	min_val = -1

/// Determines if the autotransfer system runs or not.
/datum/config_entry/flag/autotransfer

/// Determines if the transfer vote can be started by anyone or not.
/datum/config_entry/flag/allow_vote_transfer

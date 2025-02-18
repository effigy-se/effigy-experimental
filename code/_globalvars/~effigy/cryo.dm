GLOBAL_LIST_EMPTY(cryopod_computers)

GLOBAL_LIST_EMPTY(ghost_records)

/// A list of all cryopods that aren't quiet, to be used by the "Send to Cryogenic Storage" VV action.
GLOBAL_LIST_EMPTY(valid_cryopods)

/// list of weakrefs to highpriest successor candidates. Every chaplain who joins after the initial chaplain is added to this list. The next high priest is chosen from them by seniority.
GLOBAL_LIST(holy_successors)
/// A weakref to the current high priest mob
GLOBAL_VAR(current_highpriest)
/// The previous sect's favor value
GLOBAL_VAR(prev_favor)
/// The previous sect's typepath
GLOBAL_VAR(prev_sect_type)

GLOBAL_VAR_INIT(ssd_indicator_overlay, mutable_appearance('local/icons/hud/ssd_indicator.dmi', "ssd", FLY_LAYER))

GLOBAL_LIST_EMPTY(objectives)

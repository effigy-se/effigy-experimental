/// subsystem for the fishing minigame processing.
PROCESSING_SUBSYSTEM_DEF(fishing)
	name = "Fishing"
	wait = 0.05 SECONDS // If you raise it to 0.1 SECONDS, you better also modify [datum/fish_movement/move_fish()]
	flags = SS_BACKGROUND|SS_POST_FIRE_TIMING
	///A list of cached fish icons
	var/list/cached_fish_icons
	///A list of cached fish icons turns into outlines with a queston mark in the middle, denoting fish you haven't caught yet.
	var/list/cached_unknown_fish_icons
	///A list of fish that can be gotten from fish sources.
	var/catchable_fish

/datum/controller/subsystem/processing/fishing/Initialize()
	..()
	cached_fish_icons = list()
	cached_unknown_fish_icons = list()
	var/icon/questionmark = icon('icons/effects/random_spawners.dmi', "questionmark")
	var/list/mark_dimension = get_icon_dimensions(questionmark)
	for(var/obj/item/fish/prototype as anything in subtypesof(/obj/item/fish))
		var/list/fish_dimensions = get_icon_dimensions(prototype::icon)
		var/icon/fish_icon = icon(prototype::icon, prototype::icon_state, frame = 1, moving = FALSE)
		cached_fish_icons[prototype] = icon2base64(fish_icon)
		var/icon/unknown_icon = icon(fish_icon)
		unknown_icon.Blend("#FFFFFF", ICON_SUBTRACT)
		unknown_icon.Blend("#070707", ICON_ADD)
		var/width = 1 + (fish_dimensions["width"] - mark_dimension["width"]) * 0.5
		var/height = 1 + (fish_dimensions["height"] - mark_dimension["height"]) * 0.5
		unknown_icon.Blend(questionmark, ICON_OVERLAY, x = width, y = height)
		cached_unknown_fish_icons[prototype] = icon2base64(unknown_icon)

	catchable_fish = list()
	for(var/source_type as anything in GLOB.preset_fish_sources)
		var/datum/fish_source/source = GLOB.preset_fish_sources[source_type]
		catchable_fish |= source.fish_table
	for(var/thing in catchable_fish)
		if(!ispath(thing, /obj/item/fish))
			catchable_fish -= thing

	return SS_INIT_SUCCESS

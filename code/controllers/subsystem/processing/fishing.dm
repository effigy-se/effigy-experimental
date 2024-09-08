/// subsystem for the fishing minigame processing.
PROCESSING_SUBSYSTEM_DEF(fishing)
	name = "Fishing"
	flags = SS_BACKGROUND|SS_POST_FIRE_TIMING
	wait = 0.05 SECONDS // If you raise it to 0.1 SECONDS, you better also modify [datum/fish_movement/move_fish()]
	///A list of cached fish icons
	var/list/cached_fish_icons
	///A list of cached fish icons turns into outlines with a queston mark in the middle, denoting fish you haven't caught yet.
	var/list/cached_unknown_fish_icons
	///A list of fish that can be gotten from fish sources.
	var/catchable_fish
	///Cached fish properties so we don't have to initalize fish every time
	var/list/fish_properties
	///A cache of fish that can be caught by each type of fishing lure
	var/list/lure_catchables

/datum/controller/subsystem/processing/fishing/Initialize()
	..()
	cached_fish_icons = list()
	cached_unknown_fish_icons = list()
	fish_properties = list()

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

		var/obj/item/fish/fish = new prototype(null, FALSE)
		var/list/properties = list()
		fish_properties[prototype] = properties
		properties[FISH_PROPERTIES_FAV_BAIT] = fish.favorite_bait.Copy()
		properties[FISH_PROPERTIES_BAD_BAIT] = fish.disliked_bait.Copy()
		properties[FISH_PROPERTIES_TRAITS] = fish.fish_traits.Copy()
		qdel(fish)

	catchable_fish = list()
	for(var/source_type as anything in GLOB.preset_fish_sources)
		var/datum/fish_source/source = GLOB.preset_fish_sources[source_type]
		catchable_fish |= source.fish_table
	for(var/thing in catchable_fish)
		if(!ispath(thing, /obj/item/fish))
			catchable_fish -= thing

	///init the list of things lures can catch
	lure_catchables = list()
	var/list/fish_types = subtypesof(/obj/item/fish)
	for(var/lure_type in typesof(/obj/item/fishing_lure))
		var/obj/item/fishing_lure/lure = new lure_type
		lure_catchables[lure_type] = list()
		for(var/obj/item/fish/fish_type as anything in fish_types)
			if(lure.is_catchable_fish(fish_type, fish_properties[fish_type]))
				lure_catchables[lure_type] += fish_type
		qdel(lure)

	return SS_INIT_SUCCESS

// Which parallax does our map use? Does the setup in lieu of the base proc
/datum/hud/proc/get_cached_parallax()
	var/list/layers_to_cache = list()
	switch(SSmapping.current_map.parallax_to_use)
		if("Space") // MIMICS THE COMMENTED OUT PORTION IN THE FILE THIS IS A SATELLITE OF. Please keep it in lock-step :)
			layers_to_cache += new /atom/movable/screen/parallax_layer/layer_1(null, src)
			layers_to_cache += new /atom/movable/screen/parallax_layer/layer_2(null, src)
			layers_to_cache += new /atom/movable/screen/parallax_layer/planet(null, src)
			if(SSparallax.random_layer)
				layers_to_cache += new SSparallax.random_layer.type(null, src, FALSE, SSparallax.random_layer)
			layers_to_cache += new /atom/movable/screen/parallax_layer/layer_3(null, src)
		if("Gas Giant") // More basic behavior if we're using the gas giant parallax
			layers_to_cache += new /atom/movable/screen/parallax_layer/gas_giant_background(null, src)
			layers_to_cache += new /atom/movable/screen/parallax_layer/gas_giant(null, src)
			layers_to_cache += new /atom/movable/screen/parallax_layer/gas_giant/gas_layer(null, src)
			layers_to_cache += new /atom/movable/screen/parallax_layer/gas_giant/gas_layer/four(null, src)
	return layers_to_cache

/atom/movable/screen/parallax_layer/gas_giant_background
	icon = 'local/icons/effects/parallax.dmi'
	icon_state = "gas_giant_background"
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/gas_giant_background/Initialize(mapload, datum/hud/hud_owner, template)
	. = ..()
	set_base_starlight("#F0197D")

/atom/movable/screen/parallax_layer/gas_giant
	icon_state = "asteroids"
	var/color_to_use = "#FF7F50"
	speed = 1
	layer = 2

/atom/movable/screen/parallax_layer/gas_giant/Initialize(mapload, datum/hud/hud_owner, template)
	. = ..()
	src.add_atom_colour(color_to_use, ADMIN_COLOUR_PRIORITY)

/atom/movable/screen/parallax_layer/gas_giant/gas_layer
	icon_state = "space_gas"
	blend_mode = BLEND_OVERLAY
	speed = 3
	layer = 3
	color_to_use = "#F0197D"
	alpha = 127.5

/atom/movable/screen/parallax_layer/gas_giant/gas_layer/four
	speed = 4
	layer = 4
	color_to_use = "#990A4D"
	alpha = 63.75

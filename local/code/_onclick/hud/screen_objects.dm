/atom/movable/screen
	icon = EFFIGY_GENERAL_SCREEN_ICONS // EffigyEdit Change - Customized HUD

/atom/movable/screen/action_landing
	icon = EFFIGY_GENERAL_SCREEN_ICONS

/atom/movable/screen/click_catcher
	icon = EFFIGY_GENERAL_SCREEN_ICONS

/atom/movable/screen/palette_scroll
	icon = EFFIGY_GENERAL_SCREEN_ICONS

/atom/movable/screen/zone_sel
	overlay_icon = EFFIGY_GENERAL_SCREEN_ICONS

/obj/effect/overlay/zone_sel
	icon = EFFIGY_GENERAL_SCREEN_ICONS

/obj/effect/temp_visual/point
	icon = EFFIGY_GENERAL_SCREEN_ICONS

/datum/asset/simple/body_zones/add_limb(limb)
	assets[SANITIZE_FILENAME("body_zones.[limb].png")] = icon(EFFIGY_GENERAL_SCREEN_ICONS, limb)

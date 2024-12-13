/// The amount at which mob energy decreases
#define ENERGY_DRAIN_AMT 7 KILO JOULES

/datum/species/android/synth
	name = "Synth"
	id = SPECIES_SYNTH
	examine_limb_id = SPECIES_HUMAN
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
		TRAIT_GENELESS,
		TRAIT_LIMBATTACHMENT,
		TRAIT_NOBREATH,
		TRAIT_NOHUNGER,
		TRAIT_NOCRITDAMAGE,
		TRAIT_NO_DNA_COPY,
		TRAIT_NO_PLASMA_TRANSFORM,
		TRAIT_RADIMMUNE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_UNHUSKABLE,
	)
	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID
	meat = null
	reagent_compatibility = PROCESS_SYNTHETIC
	body_markings = list(/datum/bodypart_overlay/simple/body_marking/lizard = "None")
	mutantbrain = /obj/item/organ/brain/cybernetic
	mutanttongue = /obj/item/organ/tongue/robot
	mutantstomach = null
	mutantappendix = null
	mutantheart = null
	mutantliver = null
	mutantlungs = null
	mutanteyes = /obj/item/organ/eyes/robotic
	mutantears = /obj/item/organ/ears/cybernetic
	species_language_holder = /datum/language_holder/synthetic
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT

	bodytemp_heat_damage_limit = (BODYTEMP_NORMAL + 146) // 456 K / 183 C
	bodytemp_cold_damage_limit = (BODYTEMP_NORMAL - 80) // 230 K / -43 C
	/// Ability to recharge!
	var/datum/action/innate/power_cord/power_cord
	/// Hud element to display our energy level
	var/atom/movable/screen/android/energy/energy_tracker
	/// How much energy we start with
	var/core_energy = STANDARD_BATTERY_CHARGE * 10

/datum/outfit/android_preview
	name = "Synth (Species Preview)"
	// nude

/datum/species/android/synth/on_species_gain(mob/living/carbon/human/human_who_gained_species, datum/species/old_species, pref_load, regenerate_icons = TRUE)
	. = ..()
	if(ishuman(human_who_gained_species))
		power_cord = new
		power_cord.Grant(human_who_gained_species)

/datum/species/android/synth/on_species_loss(mob/living/carbon/human/human, datum/species/new_species, pref_load)
	. = ..()
	if(power_cord)
		power_cord.Remove(human)

	if(human.hud_used)
		var/datum/hud/hud_used = human.hud_used
		hud_used.infodisplay -= energy_tracker
		QDEL_NULL(energy_tracker)

/*
/datum/species/android/synth/spec_revival(mob/living/carbon/human/target)
	playsound(target.loc, 'sound/machines/chime.ogg', 50, TRUE)
	target.visible_message(span_notice("[target]'s LEDs flicker to life!"), span_notice("All systems nominal. You're back online!"))
*/

/datum/species/android/synth/spec_life(mob/living/carbon/human/target, seconds_per_tick, times_fired)
	. = ..()
	handle_hud(target)

	if(target.stat == SOFT_CRIT || target.stat == HARD_CRIT)
		target.adjustFireLoss(1) //Still deal some damage in case a cold environment would be preventing us from the sweet release to robot heaven
		target.adjust_bodytemperature(13) //We're overheating!!
		if(prob(10))
			to_chat(target, span_warning("Alert: Critical damage taken! Cooling systems failing!"))
			do_sparks(3, FALSE, target)

	if(target.stat == DEAD)
		return
	if(HAS_TRAIT(target, TRAIT_CHARGING))
		return
	if(core_energy > 0)
		core_energy -= ENERGY_DRAIN_AMT
	// alerts
	if(core_energy <= 0.75 MEGA JOULES && prob(10))
		target.balloon_alert_to_viewers("power low!")
		playsound(target, 'sound/machines/beep/triple_beep.ogg', 50, FALSE)
	// alerts end, death begins
	if(core_energy <= 0)
		core_energy = 0
		target.death() // You can do a lot in a day.

/datum/species/android/synth/proc/handle_hud(mob/living/carbon/human/target)
	// update it
	if(energy_tracker)
		energy_tracker.update_energy_hud(core_energy)
	// initialize it
	else if(target.hud_used)
		var/datum/hud/hud_used = target.hud_used
		energy_tracker = new(null, hud_used)
		hud_used.infodisplay += energy_tracker

		target.hud_used.show_hud(target.hud_used.hud_version)

/datum/species/android/synth/prepare_human_for_preview(mob/living/carbon/human/robot_for_preview)
	robot_for_preview.dna.ear_type = CYBERNETIC_EARS
	robot_for_preview.dna.features["ears"] = "TV Antennae"
	robot_for_preview.dna.features["ears_color_1"] = "#333333"
	robot_for_preview.dna.features["frame_list"] = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/robot/synth/sgm,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/robot/synth/sgm,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/robot/synth/sgm,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/robot/synth/sgm,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/robot/synth/sgm,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/robot/synth/sgm)
	regenerate_organs(robot_for_preview)
	robot_for_preview.update_body(is_creating = TRUE)

/datum/species/android/synth/get_physical_attributes()
	return "Synths are almost, but not quite, identical to fully augmented humans. \
	Unlike those, though, they're completely immune to toxin damage, don't have blood or organs (besides their head), don't get hungry, and can reattach their limbs! \
	That said, an EMP will devastate them and they cannot process any chemicals."

/datum/species/android/synth/get_species_description()
	return "Synths are an entirely synthetic species."

/datum/species/android/synth/get_species_lore()
	return list(
		"Synths are a synthetic species created as an intermediary between humans and cyborgs."
	)

#undef ENERGY_DRAIN_AMT

// Charge level defines
#define POWER_CORD_CHARGE_MAX 5 MEGA JOULES
#define POWER_CORD_CHARGE_RATE (STANDARD_CELL_RATE * 1.5)
#define POWER_CORD_CHARGE_DELAY 0.55 SECONDS
#define POWER_CORD_APC_MINIMUM_PERCENT 5

/datum/action/innate/power_cord
	name = "Power Cord"
	check_flags = AB_CHECK_INCAPACITATED|AB_CHECK_HANDS_BLOCKED|AB_CHECK_CONSCIOUS
	button_icon_state = "toolkit_generic"
	button_icon = 'icons/obj/medical/organs/organs.dmi'
	background_icon_state = "bg_default"
	// What will be given in-hand
	var/obj/item/hand_item/power_cord/power_cord

/datum/action/innate/power_cord/Activate()
	for(var/obj/item/hand_item/item in owner.held_items)
		if(item)
			owner.balloon_alert(owner, "hand occupied!")
			return
	power_cord = new
	owner.put_in_active_hand(power_cord)
	playsound(owner, 'sound/vehicles/mecha/mechmove03.ogg', 20, TRUE)

/obj/item/hand_item/power_cord
	name = "power cord"
	desc = "An internal power cord. Useful if you run on electricity. Not so much otherwise."
	icon = 'icons/obj/stack_objects.dmi'
	icon_state = "wire"
	/// What can be drained
	var/static/list/cord_whitelist = typecacheof(list(
		/obj/item/stock_parts/power_store,
		/obj/machinery/power/apc,
	))

// Attempt to charge from an object by using them on the power cord.
/obj/item/hand_item/power_cord/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	if(!can_power_draw(tool, user))
		return NONE
	try_power_draw(tool, user)
	return ITEM_INTERACT_SUCCESS

// Attempt to charge from an object by using the power cord on them.
/obj/item/hand_item/power_cord/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(!can_power_draw(interacting_with, user))
		return NONE
	try_power_draw(interacting_with, user)
	return ITEM_INTERACT_SUCCESS

/// Returns TRUE or FALSE depending on if the target object can be used as a power source.
/obj/item/hand_item/power_cord/proc/can_power_draw(obj/target, mob/user)
	return ishuman(user) && is_type_in_typecache(target, cord_whitelist)

/// Attempts to start using an object as a power source.
/obj/item/hand_item/power_cord/proc/try_power_draw(obj/target, mob/living/carbon/human/user)
	user.changeNext_move(CLICK_CD_MELEE)

	var/datum/species/android/synth/energy_holder = user.dna.species
	if(energy_holder.core_energy >= POWER_CORD_CHARGE_MAX)
		user.balloon_alert(user, "fully charged!")
		return

	user.visible_message(span_notice("[user] inserts a power connector into [target]."), span_notice("You begin to draw power from [target]."))
	do_power_draw(target, user)

	if(QDELETED(target))
		return

	if(HAS_TRAIT(user, TRAIT_CHARGING))
		REMOVE_TRAIT(user, TRAIT_CHARGING, SPECIES_TRAIT)
	user.visible_message(span_notice("[user] unplugs from [target]."), span_notice("You unplug from [target]."))

/**
 * Runs a loop to charge an android from a cell or APC.
 * Displays chat messages to the user and nearby observers.
 *
 * Stops when:
 * - The user's is full.
 * - The cell has less than the minimum charge.
 * - The user moves, or anything else that can happen to interrupt a do_after.
 *
 * Arguments:
 * * target - The power cell or APC to drain.
 * * user - The human mob draining the power cell.
 */
/obj/item/hand_item/power_cord/proc/do_power_draw(obj/target, mob/living/carbon/human/user)
	// Draw power from an APC if one was given.
	var/obj/machinery/power/apc/target_apc
	if(istype(target, /obj/machinery/power/apc))
		target_apc = target

	var/obj/item/stock_parts/power_store/target_cell = target_apc ? target_apc.cell : target
	var/minimum_cell_charge = target_apc ? POWER_CORD_APC_MINIMUM_PERCENT : 0

	if(!target_cell || target_cell.percent() < minimum_cell_charge)
		user.balloon_alert(user, "APC charge low!")
		return
	var/energy_needed
	while(TRUE)
		ADD_TRAIT(user, TRAIT_CHARGING, SPECIES_TRAIT)
		// Check if the charge level of the cell is below the minimum.
		// Prevents from overloading the cell.
		if(target_cell.percent() < minimum_cell_charge)
			user.balloon_alert(user, "APC charge low!")
			break

		// Attempt to drain charge from the cell.
		if(!do_after(user, POWER_CORD_CHARGE_DELAY, target)) // slurp slurp slurp slurp
			break

		// Check if the user is nearly fully charged.
		// Ensures minimum draw is always lower than this margin.
		var/datum/species/android/synth/energy_holder = user.dna.species
		energy_needed = POWER_CORD_CHARGE_MAX - energy_holder.core_energy

		// Calculate how much to draw from the cell this cycle.
		var/current_draw = min(energy_needed, POWER_CORD_CHARGE_RATE * POWER_CORD_CHARGE_DELAY)

		var/energy_delivered = target_cell.use(current_draw, force = TRUE)
		target_cell.update_appearance()
		if(!energy_delivered)
			// The cell could be sabotaged, which causes it to explode and qdelete.
			if(QDELETED(target_cell))
				return
			user.balloon_alert(user, "[target_apc ? "APC" : "Cell"] empty!")
			break

		energy_holder.core_energy += energy_delivered

		playsound(user, 'sound/effects/sparks/sparks2.ogg', 25, FALSE)
		if(prob(8))
			do_sparks(3, FALSE, target_cell.loc)
		if(energy_holder.core_energy >= POWER_CORD_CHARGE_MAX)
			user.balloon_alert(user, "fully charged")
			break

#undef POWER_CORD_CHARGE_MAX
#undef POWER_CORD_CHARGE_RATE
#undef POWER_CORD_APC_MINIMUM_PERCENT

#define BSRPD_CAPACITY_MAX 500
#define BSRPD_CAPACITY_USE 10
#define BSRPD_CAPACITY_NEW 250

/obj/item/pipe_dispenser/bluespace
	name = "bluespace RPD"
	desc = "State of the art technology being tested by Nakamura Engineering; the second in the Bluespace Advanced Tools line."
	icon = 'local/icons/obj/tools.dmi'
	icon_state = "bsrpd"
	lefthand_file = 'local/icons/mob/inhands/engineering/tools_lefthand.dmi'
	righthand_file = 'local/icons/mob/inhands/engineering/tools_righthand.dmi'
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	custom_materials = null
	var/current_capacity = BSRPD_CAPACITY_MAX
	var/ranged_use_cost = BSRPD_CAPACITY_USE
	var/in_use = FALSE
	/// Flag to check if we should use remote piping
	var/remote_piping_toggle = FALSE

/obj/item/pipe_dispenser/bluespace/attackby(obj/item/item, mob/user, param)
	if(istype(item, /obj/item/stack/sheet/bluespace_crystal))
		if(BSRPD_CAPACITY_NEW > (BSRPD_CAPACITY_MAX - current_capacity) || ranged_use_cost == 0)
			to_chat(user, span_warning("You cannot recharge [src] anymore!"))
			return
		item.use(1)
		to_chat(user, span_notice("You recharge the bluespace capacitor inside of [src]"))
		current_capacity += BSRPD_CAPACITY_NEW
		return
	if(istype(item, /obj/item/assembly/signaler/anomaly/bluespace))
		if(ranged_use_cost)
			to_chat(user, span_notice("You slot [item] into [src]; supercharging the bluespace capacitor!"))
			ranged_use_cost = 0
			qdel(item)
		else
			to_chat(user, span_warning("You cannot improve the [src] further."))
		return
	return ..()

/obj/item/pipe_dispenser/bluespace/examine(mob/user)
	. = ..()
	if(user.Adjacent(src))
		. += "Currently has [ranged_use_cost == 0 ? "infinite" : current_capacity / ranged_use_cost] charges remaining."
		if(ranged_use_cost != 0)
			. += "The Bluespace Anomaly Core slot is empty."
	else
		. += "You cannot see the charge capacity."

	. += span_notice("<b>Alt-Click</b> to toggle remote piping.")

/obj/item/pipe_dispenser/bluespace/click_alt(mob/user)
	if(. == FALSE)
		return // too far away
	remote_piping_toggle = !remote_piping_toggle
	balloon_alert(user, "remote piping [remote_piping_toggle ? "on" : "off"]")
	playsound(get_turf(src), 'sound/machines/click.ogg', 50, TRUE)

/obj/item/pipe_dispenser/bluespace/afterattack(atom/target, mob/user, prox)
	if(prox || !remote_piping_toggle) // If we are in proximity to the target or have our safety on, don't use charge and don't call this shitcode.
		return ..()
	if(current_capacity < ranged_use_cost)
		to_chat(user, span_warning("The [src] lacks the charge to do that."))
		return FALSE
	if(!in_use)
		user.Beam(target, icon_state = "rped_upgrade", time = 1 SECONDS)
		in_use = TRUE // So people can't just spam click and get more uses
		addtimer(VARSET_CALLBACK(src, in_use, FALSE),  1 SECONDS, TIMER_UNIQUE)
		if(pre_attack(target, user))
			current_capacity -= ranged_use_cost
			return TRUE

	return FALSE

#undef BSRPD_CAPACITY_MAX
#undef BSRPD_CAPACITY_USE
#undef BSRPD_CAPACITY_NEW

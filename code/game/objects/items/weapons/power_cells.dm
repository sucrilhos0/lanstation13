/obj/item/weapon/cell
	name = "power cell"
	desc = "A rechargeable electrochemical power cell."
	icon = 'icons/obj/power.dmi'
	icon_state = "cell"
	item_state = "cell"
	origin_tech = Tc_POWERSTORAGE + "=1"
	flags = FPRINT
	force = 5.0
	throwforce = 5.0
	throw_speed = 3
	throw_range = 5
	w_class = W_CLASS_SMALL
	var/charge = 0	// note %age conveted to actual charge in New
	var/maxcharge = 1000
	starting_materials = list(MAT_IRON = 700, MAT_GLASS = 50)
	w_type = RECYK_ELECTRONIC
	melt_temperature = MELTPOINT_STEEL // Rugged
	var/rigged = 0		// true if rigged to explode
	var/minor_fault = 0 //If not 100% reliable, it will build up faults.
	var/brute_damage = 0 //Used by cyborgs
	var/electronics_damage = 0 //Used by cyborgs

/obj/item/weapon/cell/suicide_act(mob/user)
	to_chat(viewers(user), "<span class='danger'>[user] is licking the electrodes of the [src.name]! It looks like \he's trying to commit suicide.</span>")
	return (FIRELOSS)

/obj/item/weapon/cell/empty/New()
	..()
	charge = 0

/obj/item/weapon/cell/crap
	name = "\improper Nanotrasen brand rechargeable AA battery"
	desc = "I can't top the plasma top." //TOTALLY TRADEMARK INFRINGEMENT
	origin_tech = Tc_POWERSTORAGE + "=0"
	maxcharge = 500
	starting_materials = list(MAT_IRON = 700, MAT_GLASS = 40)

/obj/item/weapon/cell/crap/empty/New()
	..()
	charge = 0

/obj/item/weapon/cell/secborg
	name = "\improper Security borg rechargeable D battery"
	origin_tech = Tc_POWERSTORAGE + "=0"
	maxcharge = 600	//600 max charge / 100 charge per shot = six shots
	starting_materials = list(MAT_IRON = 700, MAT_GLASS = 40)


/obj/item/weapon/cell/secborg/empty/New()
	..()
	charge = 0

/obj/item/weapon/cell/miningborg
	name = "\improper Mining borg rechargeable D battery"
	origin_tech = Tc_POWERSTORAGE + "=0"
	maxcharge = 600	//600 max charge / 100 charge per shot = six shots
	starting_materials = list(MAT_IRON = 700, MAT_GLASS = 40)


/obj/item/weapon/cell/miningborg/empty/New()
	..()
	charge = 0


/obj/item/weapon/cell/high
	name = "high-capacity power cell"
	origin_tech = Tc_POWERSTORAGE + "=2"
	icon_state = "hcell"
	maxcharge = 10000
	starting_materials = list(MAT_IRON = 700, MAT_GLASS = 60)

/obj/item/weapon/cell/high/empty/New()
	..()
	charge = 0

/obj/item/weapon/cell/super
	name = "super-capacity power cell"
	origin_tech = Tc_POWERSTORAGE + "=5"
	icon_state = "scell"
	maxcharge = 20000
	starting_materials = list(MAT_IRON = 700, MAT_GLASS = 70)
/obj/item/weapon/cell/super/empty/New()
	..()
	charge = 0

/obj/item/weapon/cell/hyper
	name = "hyper-capacity power cell"
	origin_tech = Tc_POWERSTORAGE + "=6"
	icon_state = "hpcell"
	maxcharge = 30000
	starting_materials = list(MAT_IRON = 700, MAT_GLASS = 80)

/obj/item/weapon/cell/hyper/empty/New()
	..()
	charge = 0

/obj/item/weapon/cell/infinite
	name = "infinite-capacity power cell!"
	icon_state = "icell"
	origin_tech =  null
	maxcharge = 30000
	starting_materials = list(MAT_IRON = 700, MAT_GLASS = 80)
	use()
		return 1

/obj/item/weapon/cell/potato
	name = "potato battery"
	desc = "A rechargeable starch based power cell."
	origin_tech = Tc_POWERSTORAGE + "=1"
	icon = 'icons/obj/power.dmi' //'icons/obj/harvest.dmi'
	icon_state = "potato_cell" //"potato_battery"
	charge = 100
	maxcharge = 300
	starting_materials = null
	w_type = RECYK_BIOLOGICAL
	minor_fault = 1


/obj/item/weapon/cell/slime
	name = "charged slime core"
	desc = "A yellow slime core infused with plasma, it crackles with power."
	origin_tech = Tc_POWERSTORAGE + "=2;" + Tc_BIOTECH + "=4"
	icon = 'icons/mob/slimes.dmi' //'icons/obj/harvest.dmi'
	icon_state = "yellow slime extract" //"potato_battery"
	maxcharge = 30000
	starting_materials =  null
	w_type = RECYK_BIOLOGICAL


/obj/item/weapon/cell/temperaturegun
	name = "temperature gun cell"
	desc = "A specially designed power cell for heating and cooling projectiles"
	icon_state = "icell"
	maxcharge = 900

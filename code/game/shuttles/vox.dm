#define VOX_SHUTTLE_COOLDOWN 460
#define VOX_SHUTTLE_TRANSIT_DELAY 260

var/global/datum/shuttle/vox/vox_shuttle = new(starting_area=/area/shuttle/vox/station)

/datum/shuttle/vox
	name = "vox skipjack"

	cant_leave_zlevel = list()

	cooldown = VOX_SHUTTLE_COOLDOWN

	transit_delay = VOX_SHUTTLE_TRANSIT_DELAY - 30 //Once somebody sends the shuttle, it waits for 3 seconds before leaving. Transit delay is reduced to compensate for that
	pre_flight_delay = 30

	stable = 1 //Don't stun everyone and don't throw anything when moving
	can_rotate = 0 //Sleepers, body scanners and multi-tile airlocks aren't rotated properly

	var/returned_home = 0
	var/obj/docking_port/destination/dock_home

/datum/shuttle/vox/is_special()
	return 1

/datum/shuttle/vox/initialize()
	.=..()
	dock_home = add_dock(/obj/docking_port/destination/vox/station)
	add_dock(/obj/docking_port/destination/vox/northeast_solars)
	add_dock(/obj/docking_port/destination/vox/southeast_solars)
	add_dock(/obj/docking_port/destination/vox/southwest_solars)
	add_dock(/obj/docking_port/destination/vox/mining)

	set_transit_dock(/obj/docking_port/destination/vox/transit)

/datum/shuttle/vox/travel_to(var/obj/docking_port/D, var/obj/machinery/computer/shuttle_control/broadcast = null, var/mob/user)
	if(D == dock_home)
		if(ticker && istype(ticker.mode, /datum/game_mode/heist))
			switch(alert(usr,"Returning to the deep space will end my raid and report my success or failure. Are you sure?","Vox Skipjack","Yes","No"))
				if("Yes")
					var/location = get_turf(user)
					message_admins("[key_name_admin(user)] attempts to end the raid - [formatJumpTo(location)]")
					log_admin("[key_name(user)] attempts to end the raid - [formatLocation(location)]")
				if("No")
					return
	.=..()

/datum/shuttle/vox/after_flight()
	.=..()

	if(HOLOMAP_MARKER_SKIPJACK in holomap_markers)
		var/datum/holomap_marker/updateMarker = holomap_markers[HOLOMAP_MARKER_SKIPJACK]
		updateMarker.x = current_port.x
		updateMarker.y = current_port.y
		updateMarker.z = current_port.z
		updateMarker.offset_y = -6

	if(current_port == dock_home)
		returned_home = 1	//If the round type is heist, this will cause the round to end
							//See code/game/gamemodes/heist/heist.dm, 294

/obj/machinery/computer/shuttle_control/vox
	icon_state = "syndishuttle"
	allow_silicons = 0

	req_access = list(access_syndicate)

	light_color = LIGHT_COLOR_RED
	machine_flags = EMAGGABLE //No screwtoggle because this computer can't be built

/obj/machinery/computer/shuttle_control/vox/New() //Main shuttle_control code is in code/game/machinery/computer/shuttle_computer.dm
	link_to(vox_shuttle)
	.=..()

	var/datum/holomap_marker/newMarker = new()
	newMarker.id = HOLOMAP_MARKER_SKIPJACK
	newMarker.icon = 'icons/holomap_markers_32x32.dmi'
	newMarker.filter = HOLOMAP_FILTER_VOX
	newMarker.x = x
	newMarker.y = y
	newMarker.z = z
	newMarker.offset_x = -16
	newMarker.offset_y = -25

	holomap_markers[HOLOMAP_MARKER_SKIPJACK] = newMarker

//code/game/objects/structures/docking_port.dm

/obj/docking_port/destination/vox/station
	areaname = "deep space"

/obj/docking_port/destination/vox/northeast_solars
	areaname = "north east solars"

/obj/docking_port/destination/vox/northwest_solars
	areaname = "north west solars"

/obj/docking_port/destination/vox/southeast_solars
	areaname = "south east solars"

/obj/docking_port/destination/vox/southwest_solars
	areaname = "south west solars"

/obj/docking_port/destination/vox/mining
	areaname = "vox trading outpost"

/obj/docking_port/destination/vox/transit
	areaname = "hyperspace (vox skipjack)"

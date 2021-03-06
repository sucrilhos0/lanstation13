/*
//////////////////////////////////////

Confusion

	Little bit hidden.
	Lowers resistance.
	Decreases stage speed.
	Not very transmittable.
	Intense Level.

Bonus
	Makes the affected mob be confused for short periods of time.

//////////////////////////////////////
*/

/datum/symptom/confusion

	name = "Confusion"
	stealth = 1
	resistance = -1
	stage_speed = -3
	transmittable = 0
	level = 4


/datum/symptom/confusion/Activate(var/datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/carbon/M = A.affected_mob
		switch(A.stage)
			if(1, 2, 3, 4)
				to_chat(M, "<span class='notice'>[pick("I feel confused.", "I forgot what you were thinking about.")]</span>")
			else
				to_chat(M, "<span class='notice'>I am unable to think straight!</span>")
				M.confused = min(100, M.confused + 2)

	return

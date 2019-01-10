/*
define ailment hud icons and placements
only one ailment at a time i think cuz fuck stacking ailments

define ailment procs

*/



STATUS_AILMENTS
	parent_type = /obj
	layer=1000
	pixel_y=75
	pixel_x=16
	icon='BattleSystem/Ailments.dmi'
	POISON
		icon_state="poison"
	SILENCE
		icon_state="silence"
	SLIME
		icon_state="slime"
	DISARMED
		icon_state="disarmed"
	PARALYZED
		icon_state="shocked"

Party_Members
	proc
		Start_Ailment(STATUS="Poison")
			if(ailment_amount==0)
				ailment_amount=100
				if(STATUS=="Poison")
					Poison()
					for(var/mob/M in world)
						if(src in M.Alives)
							M.Info("[name] has been poisoned!")
							spawn(14)
								for(var/obj/INFOBOX/C2 in M.client.screen)
									del(C2)
					overlays+=/STATUS_AILMENTS/POISON
				if(STATUS=="Slime")
					Slime()
					for(var/mob/M in world)
						if(src in M.Alives)
							M.Info("[name] has been turned into a Slime!")
							spawn(14)
								for(var/obj/INFOBOX/C2 in M.client.screen)
									del(C2)
					icon_state="Slime-[name]"
					overlays+=/STATUS_AILMENTS/SLIME
			if(STATUS=="Cure")
			//	for(var/mob/M in world)
				//	if(src in M.Alives)
					//	M.Info("[name] has been cured of their ailment!")
					//	spawn(14)
					//		for(var/obj/INFOBOX/C2 in M.client.screen)
					//			del(C2)
				ailment_amount=0
				overlays-=/STATUS_AILMENTS/POISON
				overlays-=/STATUS_AILMENTS/SLIME
				animate(src, color = 0,255,0,0, time = 1)
				icon_state="Stance"


		Slime()
			ailment_amount-=pick(1,2,3,4,5,6,7,8,9,10)
			if(ailment_amount<=0)
				Start_Ailment(STATUS="Cure")
			spawn(10)
				Slime()


		Poison()
	//		while(ailment_amount)
			ailment_amount-=pick(1,2,3,4,5,6,7,8,9,10)
			if(status_flash==0)
				status_flash =1
				animate(src, color=rgb(0,200,0), time = 10)
			if(status_flash==1)
				status_flash =0
				animate(src, color=rgb(255,255,255), time = 10)
			if(ailment_amount<=0)
				Start_Ailment(STATUS="Cure")
			var/damage=pick(1)

			new/effect/damage(loc,"<font color=purple><b>[round(damage)]</b></font>")
			HEALTH-=damage
			for(var/mob/M in world)
				if(src in M.Alives)
					M.HPUpdate()
					if(HEALTH<=0)
						dead=1
						M<<sound(dead_sound)
						if(M.TURN==src)
							if(attacking==1)
								attacking=0
								return
							else
								M.Turn_End(src)
						M.StatUpdate()
						M.HPUpdate()
					M.StatUpdate()
			spawn(15)
				Poison()

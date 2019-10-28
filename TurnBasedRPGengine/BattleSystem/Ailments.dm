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
	STONE
		icon_state="petrify"

Party_Members
	proc
		Start_Ailment(STATUS="Poison")
			if(ailment_amount==0&&!dead&&!stone)
				ailment_amount=100
				if(STATUS=="Petrify")
					Stone()
					for(var/mob/M in world)
						if(src in M.Alives)
							M.Info("Uh Oh! [name] is turning to stone!","black")
							spawn(14)
								for(var/obj/INFOBOX/C2 in M.client.screen)
									del(C2)
					overlays+=/STATUS_AILMENTS/STONE
					return
				if(STATUS=="Poison")
					Poison()
					for(var/mob/M in world)
						if(src in M.Alives)
							M.Info("[name] has been <font color=purple>poisoned!","green")
							spawn(14)
								for(var/obj/INFOBOX/C2 in M.client.screen)
									del(C2)
					overlays+=/STATUS_AILMENTS/POISON
					return
				if(STATUS=="Slime")
					Slime()
					for(var/mob/M in world)
						if(src in M.Alives)
							M.Info("[name] has been turned into a <font color=blue>Slime!</font>")
							spawn(14)
								for(var/obj/INFOBOX/C2 in M.client.screen)
									del(C2)
					icon_state="Slime-[name]"
					overlays+=/STATUS_AILMENTS/SLIME
					return
			if(STATUS=="Cure")
			//	for(var/mob/M in world)
				//	if(src in M.Alives)
					//	M.Info("[name] has been cured of their ailment!")
					//	spawn(14)
					//		for(var/obj/INFOBOX/C2 in M.client.screen)
					//			del(C2)
				ailment_amount=0
				stone=0
				overlays-=/STATUS_AILMENTS/POISON
				overlays-=/STATUS_AILMENTS/SLIME
				overlays-=/STATUS_AILMENTS/STONE
				animate(src, color = 0,255,0,0, time = 1)
				if(!dead)
					icon_state="Stance"
				return


		Slime()
			ailment_amount-=pick(1,2,3,4,5,6,7,8,9,10)
			if(ailment_amount<=0)
				Start_Ailment(STATUS="Cure")
			spawn(10)
				Slime()

		Stone()
			ailment_amount-=1
			if(status_flash==0)
				status_flash =1
				animate(src, color=rgb(200,200,200), time = 10)
			if(status_flash==1)
				status_flash =0
				animate(src, color=rgb(255,255,255), time = 10)
			if(ailment_amount<=0)
				animate(src, color=rgb(200,200,200), time = 10)
				for(var/mob/M in world)
					if(src in M.Alives)
						M.HPUpdate()
						stone=1
						if(M.TURN==src)
							if(attacking==1)
								attacking=0
								return
							else
								M.Turn_End(src)
						M.HPUpdate()
						M.StatUpdate()
			spawn(20)
				Stone()

		Poison()
	//		while(ailment_amount)
			if(dead)
				Start_Ailment(STATUS="Cure")
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

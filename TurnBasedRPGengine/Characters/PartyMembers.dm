Party_Members
	parent_type = /mob
	icon_state="Stance"
	density=0
	var
		sound
			ready_sound
			weak_sound
			win_sound
			dead_sound
		GUEST = 0
		portrait = null
		ailment_amount=0
		status_flash = 0
		HEALTH = 100
		MAX_HEALTH = 100
		MAGIC = 50
		MAX_MAGIC = 100
		STRENGTH = 6
		DEFENSE = 6
		STRENGTH_ADDED = 0
		DEFENSE_ADDED = 0
		ACCURACY = 10
		ACC_ADDED = 0
		POISON_RESIST = 1
		POIRESIST_ADDED = 0
		FIRE_RESIST = 1
		FIRERESIST_ADDED = 0
		ICE_RESIST = 1
		ICERESIST_ADDED = 0
		BOLT_RESIST = 1
		BOLTRESIST_ADDED = 0
		EARTH_RESIST = 1
		EARTHRESIST_ADDED = 0
		WEAPON_WEIGHT = 0
		ARMOR_WEIGHT = 0
		EXP = 0
		MAX_EXP = 564
		LEVEL = 3
		ATTACK_ELEMENT = "NONE"

		PORTRAIT = null
		CLASS = null

		ENABLE_MAGIC = 0

		ready = 0
		timer = 0
		timer_fill = 5
		timer_wait = 5
		attacking=0
		iteming=0
		paused= 0
		clicked=0

		dead = 0
		OutOfBattle = 0

		WEAPON_SLOT = "NONE"
		WEAPON_TYPE = "SWORD"
		weapon_overlay=null
		head_overlay=null
		mask_overlay=null
		hair_overlay=null
		eye_overlay=null
		outfit_overlay=null

		HAIR_SLOT = "NONE"
		EYE_SLOT = "NONE"
		HEAD_SLOT = "NONE"
		MASK_SLOT="NONE"
		OUTFIT_SLOT = "NONE"


		EXTRA1=null
		EXTRA2=null
		list
			SKILL1 = list()
			SKILL2 = list()
			SKILL3 = list()

		MAGIC1 = "EMPTY"
		MAGIC2 = "EMPTY"
		MAGIC3 = "EMPTY"
		MAGIC4 = "EMPTY"

		SUMMON1 = "EMPTY"
		SUMMON2 = "EMPTY"
		SUMMON3 = "EMPTY"
		SUMMON4 = "EMPTY"


		//battle calcs

	DblClick()
		//Start_Ailment("Poison")
		if(usr.managing==1)
			if(src.Party_Position==0)
				for(var/Party_Members/P1 in usr.Party)
					if(P1.Party_Position==1)
						usr.Reserves.Add(P1)
						usr.Party.Remove(P1)
						P1.Party_Position=0
				usr.Party.Add(src)
				usr.Reserves.Remove(src)
				usr<<equip
				usr<<sound(src.ready_sound)
				src.Party_Position=1
				usr.icon = file("Overworld/Characters/[src.name].dmi")
				usr.Manage()
				return


			else
				usr<<error
				winset(usr,"Manage.ERROR","is-visible=true;text='[src.name] already in party!")
				spawn(5)
					winset(usr,"Manage.ERROR","is-visible=false")
				return
		if(usr.managing==2)
			if(src.Party_Position==0)
				for(var/Party_Members/P1 in usr.Party)
					if(P1.Party_Position==2)
						usr.Reserves.Add(P1)
						usr.Party.Remove(P1)
						P1.Party_Position=0
				usr.Party.Add(src)
				usr.Reserves.Remove(src)
				usr<<equip
				usr<<sound(src.ready_sound)
				src.Party_Position=2
				usr.Manage()
				return
			else
				usr<<error
				winset(usr,"Manage.ERROR","is-visible=true;text='[src.name] already in party!")
				spawn(5)
					winset(usr,"Manage.ERROR","is-visible=false")
				return
		if(usr.managing==3)
			if(src.Party_Position==0)
				for(var/Party_Members/P1 in usr.Party)
					if(P1.Party_Position==3)
						usr.Reserves.Add(P1)
						usr.Party.Remove(P1)
						P1.Party_Position=0
				usr.Party.Add(src)
				usr.Reserves.Remove(src)
				usr<<equip
				usr<<sound(src.ready_sound)
				src.Party_Position=3
				usr.Manage()
				return
			else
				usr<<error
				winset(usr,"Manage.ERROR","is-visible=true;text='[src.name] already in party!")
				spawn(5)
					winset(usr,"Manage.ERROR","is-visible=false")
				return
		if(usr.managing==4)
			if(src.Party_Position==0)
				for(var/Party_Members/P1 in usr.Party)
					if(P1.Party_Position==4)
						usr.Reserves.Add(P1)
						usr.Party.Remove(P1)
						P1.Party_Position=0
				usr.Party.Add(src)
				usr.Reserves.Remove(src)
				usr<<equip
				usr<<sound(src.ready_sound)
				src.Party_Position=4
				usr.Manage()
				return
			else
				usr<<error
				winset(usr,"Manage.ERROR","is-visible=true;text='[src.name] already in party!")
				spawn(5)
					winset(usr,"Manage.ERROR","is-visible=false")
				return

	PIKACHU
		name="Pikachu"
		icon='BattleSystem/Skills/Pikachu/Pikachu2.dmi'
		GUEST = 1
		CLASS = "Electric Mouse"
		Party_Position = 4
		timer_wait=3
		timer_fill=8
		STRENGTH=6
		DEFENSE=8
		pixel_y=-30
		pixel_y=-25
		portrait='BattleSystem/Skills/Pikachu/Pikachu2.dmi'
		WEAPON_SLOT = "N/A"
		HAIR_SLOT = "N/A"
		EYE_SLOT = "N/A"
		HEAD_SLOT = "N/A"
		MASK_SLOT = "N/A"
		OUTFIT_SLOT = "N/A"
		ready_sound = sound('BattleSystem/Skills/Pikachu/intro3.wav',volume=50)
		New()
			..()
			dir=EAST

	BRENDAN
		name = "Brendan"
		CLASS = "Parzoople Knight"
		icon='Characters/BaseMaleWhite.dmi'
		Party_Position= 1
		timer_wait=4
		timer_fill=10
		STRENGTH=4
		DEFENSE=3
		pixel_y=-30
		pixel_y=-25
		portrait='Characters/Portraits/Brendan.dmi'
		ready_sound = sound('SOUND FX/Brendan/ready.wav',volume=40)
		win_sound = sound('SOUND FX/Brendan/win.wav',volume=40)
		weak_sound = sound('SOUND FX/Brendan/weak.wav',volume=40)
		dead_sound = sound('SOUND FX/Brendan/dead.wav',volume=40)
		New()
			..()
			EYE_SLOT=/obj/EYES/Energetic
			eye_overlay=/obj/EYES/Energetic
			overlays+=eye_overlay
			HAIR_SLOT=/obj/HAIR/Brendan
			hair_overlay='Hair/Brendan.dmi'
			overlays+=hair_overlay

	LAUNDRY
		name = "Laundry"
		CLASS = "Laundrinator"
		icon='Characters/BaseMaleWhite.dmi'
		pixel_y=-30
		pixel_y=-25
		Party_Position= 2
		timer_wait=6
		timer_fill=10
		STRENGTH=4
		DEFENSE=3
		portrait='Characters/Portraits/Laundry.dmi'
		ready_sound = sound('SOUND FX/Laundry/ready.wav',volume=50)
		win_sound = sound('SOUND FX/Laundry/win.wav',volume=80)
		weak_sound = sound('SOUND FX/Laundry/weak.wav',volume=80)
		dead_sound = sound('SOUND FX/Laundry/dead.wav',volume=80)
		New()
			..()
			HAIR_SLOT=/obj/HAIR/Laundry
			hair_overlay='Hair/Laundry.dmi'
			overlays+=hair_overlay

	BECCA
		name = "Becca"
		CLASS = "Cat Lady"
		icon='Characters/BaseFemaleWhite.dmi'
		pixel_y=-30
		pixel_y=-25
		Party_Position= 4
		timer_wait=4
		timer_fill=8
		STRENGTH=4
		DEFENSE=3
		portrait='Characters/Portraits/Becca.dmi'
		ready_sound = sound('SOUND FX/Becca/ready.ogg',volume=50)
		win_sound = sound('SOUND FX/Becca/win.ogg',volume=80)
		weak_sound = sound('SOUND FX/Becca/weak.ogg',volume=80)
		dead_sound = sound('SOUND FX/Becca/dead.ogg',volume=80)
		New()
			..()
			HAIR_SLOT=/obj/HAIR/Becca
			hair_overlay='Hair/Becca.dmi'
			overlays+=hair_overlay
	HUNTER
		name = "Hunter"
		CLASS = "Meth Addict"
		icon='Characters/BaseMaleWhite.dmi'
		pixel_y=-30
		pixel_y=-25
		Party_Position= 3
		timer_wait=3
		timer_fill=10
		STRENGTH=4
		DEFENSE=4
		portrait='Characters/Portraits/Hunter.dmi'
		ready_sound = sound('SOUND FX/Hunter/ready.wav',volume=30)
		win_sound = sound('SOUND FX/Hunter/win.wav',volume=30)
		weak_sound = sound('SOUND FX/Hunter/weak.wav',volume=30)
		dead_sound = sound('SOUND FX/Hunter/dead.wav',volume=30)
		New()
			..()
			HAIR_SLOT=/obj/HAIR/Hunter
			hair_overlay='Hair/Hunter.dmi'
			overlays+=hair_overlay
	DEREK
		name = "Derek"
		CLASS = "Moose Blade"
		icon='Characters/BaseMaleWhite.dmi'
		pixel_y=-30
		pixel_y=-25
		Party_Position= 1
		timer_wait=5
		timer_fill=10
		STRENGTH=3
		DEFENSE=4
		portrait='Characters/Portraits/Derek.dmi'
		ready_sound = sound('SOUND FX/Derek/ready.wav',volume=30)
		win_sound = sound('SOUND FX/Derek/win.wav',volume=30)
		weak_sound = sound('SOUND FX/Hunter/weak.wav',volume=30)
		dead_sound = sound('SOUND FX/Derek/dead.wav',volume=30)
		New()
			..()
			HAIR_SLOT=/obj/HAIR/Derek
			hair_overlay='Hair/Derek.dmi'
			overlays+=hair_overlay

		//	OUTFIT_SLOT=/EQUIPMENT/ARMOR/OUTFIT/Tempestra_Garb
		//	outfit_overlay=OUTFIT_SLOT
		//	overlays+=outfit_overlay
		//	DEFENSE+=3

	//		MASK_SLOT=/EQUIPMENT/ARMOR/MASK/Glasses
	//		for(var/mob/M in world)
	//			if(M.client&&src in M.Party)
	//				for(var/EQUIPMENT/ARMOR/MASK/Glasses/G in M.Equipment)
	//					MASK_SLOT=G
	//		mask_overlay=MASK_SLOT
	//		overlays+=mask_overlay
		//	DEFENSE+=1

	Click()
		for(var/Party_Members/P in usr.Party)
			if(usr.IN_DUEL&&usr.TURN==P&&P.attacking&&!P.clicked&&P.IN_BATTLE)
				P.clicked=1
				if(usr.CLASS2=="Attacker")
					P.x-=4
				else
					P.x+=4
				spawn(1)
					flick("Attack",P)
					if(prob(70+P.ACCURACY))
						spawn(1)
							usr<<hit
						spawn(2)
							pixel_y+=4
							animate(src,color=rgb(255,0,0),time=3)
							src.icon_state="Hit"
							spawn(4)
								src.icon_state="Stance"
							usr<<hit
							spawn(0.5)
								pixel_y-=4
								pixel_x+=4
								spawn(0.5)
									pixel_y-=4
									pixel_x-=4
									spawn(0.5)
										pixel_y+=4
										pixel_x-=4
										spawn(0.5)
											pixel_y=0
											pixel_x=0
											animate(src,color=rgb(255,255,255),time=3)
						spawn(5)
							if(usr.CLASS2=="Attacker")
								P.x+=4
							else
								P.x-=4
							var/damage=P.STRENGTH*rand(1,1.25)+P.STRENGTH_ADDED-DEFENSE/2

							new/effect/damage(src.loc,"<font color=red><b>[round(damage)]</b></font>")
							HEALTH-=damage

							if(HEALTH<=0)
								for(var/mob/M in world)
									if(M.client&&src in M.Party)
										if(M.TURN==P)
											M.Turn_End(P)
								spawn(2.5)
									Death(usr,P)
							if(HEALTH<-100)
								spawn(1)
								new/effect/damage(src.loc,"<font color=yellow><b>OVERKILL</b></font>")
								usr.OVERKILLED=1
							for(var/mob/M in world)
								if(M.client&&src in M.Party)
									M.StatUpdate()
									M.HPUpdate()
							P.attacking=0
							P.clicked=0
							usr.Turn_End(P)
					else
						spawn(5)
							if(usr.CLASS2=="Attacker")
								P.x+=4
							else
								P.x-=4
							new/effect/damage(src.loc,"<font color=white><b>MISS</b></font>")
							P.attacking=0
							P.clicked=0
							usr.Turn_End(P)
	proc
		Death(mob/killer,Party_Members/killer2)
			animate(src,color=rgb(255,0,0),time=3)
			animate(src,transform=matrix()*1.5,alpha=0,color=rgb(255,0,0),time=8)
			spawn(7)
				view()<<enemy_kill
				killer.ENEMY_NUMBER--
				killer2.EXP+=src.MAX_HEALTH/2
				killer.EXP_GAINED+=src.MAX_HEALTH/2
				killer.GOLD_GAINED+=100*src.LEVEL
				killer.moneys+=100*src.LEVEL
				if(killer.ENEMY_NUMBER<=0)
					spawn(5)
						killer.DuelWin()
						for(var/mob/M in world)
							if(src in M.Party)
								M.DuelLoss()

		LevelUp()
			for(var/mob/m in world)
				if(src in m.Party)
					src.EXP=0
					src.MAX_EXP=src.MAX_EXP*2
					src.MAX_HEALTH+=5
					src.MAX_MAGIC+=4
					src.LEVEL+=1
					m.Info("[src.name] leveled up!")
					spawn(6)
						src.STRENGTH+=1
						for(var/obj/INFOBOX/C2 in m.client.screen)
							del(C2)
						m.Info("[src.name]'s STR +1!")
						spawn(6)
							src.DEFENSE+=1
							for(var/obj/INFOBOX/C2 in m.client.screen)
								del(C2)
							m.Info("[src.name]'s DEF +1!")
							spawn(6)
								for(var/obj/INFOBOX/C2 in m.client.screen)
									del(C2)






		Timer()
			if(!dead&&IN_BATTLE&&!paused)
				spawn(5+ARMOR_WEIGHT)
					var/A = 10-WEAPON_WEIGHT
					if(A <=5)
						A=6
					timer += A
					for(var/mob/M in world)
						if(M.client&&M.IN_BATTLE)
							if(src in M.Party)
								M.TimerUpdate()
					if(timer>=100)
						for(var/mob/M in world)
							if(M.client&&M.IN_BATTLE)
								if(src in M.Party)
									if(M.TURN==null)
										M.TURN=src
										ready = 1
										overlays += /obj/ARROW
										overlays += /obj/CIRCLE

									//	TURN=src
										M.Turn_Start(src)

									else
										M.Wait_List.Add(src)


					else
						Timer()

		Cast(var/MATERIA/MA.Action(src))
			var/MATERIA/MA
			for(var/mob/M in world)
				if(M.client&&M.IN_BATTLE)
					if(src in M.Party && M.TURN==src && !src.attacking && src.MAGIC>MA.MANA_COST)
						src.MAGIC-=MA.MANA_COST
						M.MAGICUpdate()
						src.icon_state="Cast"
						src.overlays+=/obj/SKILL/CAST/aura
						src.attacking=1
						M<<cast
						spawn(5)
							M.Message("<center>[src.name] casts [MA.NAME]!",10,"bottom")
						spawn(10)
							src.icon_state="Stance"
							src.overlays-=/obj/SKILL/CAST/aura


obj
	portraits
		Derek
			icon='Characters/Portraits/Derek.dmi'
		Brendan
			icon='Characters/Portraits/Brendan.dmi'
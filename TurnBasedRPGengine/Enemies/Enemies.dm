obj
	ENEMY_NAME
		layer=998
		New()
			initiate_maptext(src, 32,156,578, 60)
	ENEMY_BAR_UNDER
		layer=996
		invisibility=4
		pixel_y=-8
		icon='BattleSystem/miniBar.dmi'
		var
			owner=null
		New(var/obj/ENEMY_BAR/B)
			owner=B

	ENEMY_BAR
		layer=997
		invisibility=4
		pixel_y=-8
		icon='BattleSystem/miniBar.dmi'
		icon_state="bar"
		var
			owner = null
		New(var/ENEMY/E)
			var/obj/ENEMY_BAR_UNDER/U=new /obj/ENEMY_BAR_UNDER(src)
			src.loc=E.loc
			U.loc=src.loc
			owner=E
		proc
			Update()
				for(var/ENEMY/E in world)
					if(owner==E)
						var/size = E.HEALTH/E.MAX_HEALTH
						if(E.HEALTH<=0)
							for(var/obj/ENEMY_BAR_UNDER/U in world)
								if(U.owner==src)
									del(U)
									del(src)
						var/matrix/M = new
						var/const/width = 64    // width of icon
						M.Translate(width/2,0)    // shift 50px right, so the left of the icon is now where its center used to be
						M.Scale(size,1)           // scale
						M.Translate(-width/2,0)   // shift it back
						animate(src,transform = M,time=1)

ENEMY
	parent_type = /mob
	var
		HEALTH = -3
		MAX_HEALTH=0
		EXP_GAIN = 15
		GOLD_GAIN = 0
		STRENGTH = 10
		DEFENSE = 10
		WEAK_TO = "BOLT"
		BOSS = 0
		ATTACK_TIMER = 25
		STATUS_GIVE = "NONE"
		STATUS_PERCENT = 0

		IMMUNE_TO_PHYS = 0
		IS_BOSS = 0


		dead = 0
		attacking=0
		can_attack = 1
		can_skill = 1
		skilling=0
		list/
			E_Skills = list()
			Drops = list()
	proc
		BarUpdate()
			for(var/obj/ENEMY_BAR/E in world)
				if(E.owner==src)
					E.Update()
		Active()
			if(name=="pbag")
				return
			if(IS_BOSS)
				spawn(pick(60,80))
					for(var/mob/M in world)
						if(M.client)
							if(src in M.Battlers)
								for(var/Party_Members/P in M.Party)
									if(P.attacking)
										spawn(pick(20))
											Active()
								for(var/ENEMY/E in M.Battlers)
									if(E.attacking||E.skilling)
										spawn(pick(20))
											Active()
									else
										if(!attacking&&!E.skilling&&!skilling)
											if(can_attack)

												if(prob(10))
													Miss()
												else
													if(prob(40))
														Attack()
													else
														if(E_Skills.len != 0 && !E.skilling && E.can_skill)
															var/E_SKILL/ES=pick(E_Skills)
															ES.Activate(src)
														else
															Attack()
												spawn(pick(20))
													Active()
											else
												spawn(pick(20))
													Active()
			else
				spawn(pick(95,105,125,150))
					for(var/mob/M in world)
						if(M.client)
							if(src in M.Battlers)
								for(var/Party_Members/P in M.Party)
									if(P.attacking)
										spawn(pick(50))
											Active()
								for(var/ENEMY/E in M.Battlers)
									if(E.attacking||E.skilling)
										spawn(pick(50))
											Active()
									else
										if(!attacking&&!E.skilling&&!skilling)
											if(can_attack)

												if(prob(15))
													Miss()
												else
													if(prob(80))
														Attack()
													else
														if(E_Skills.len != 0 && !E.skilling && E.can_skill && E.name!="Metool")
															var/E_SKILL/ES=pick(E_Skills)
															ES.Activate(src)
														else
															Attack()
												spawn(pick(50))
													Active()
											else
												spawn(pick(50))
													Active()


	MouseEntered()
		draw_nametag("[name]")
		for(var/Party_Members/P in usr.Party)
			if(P.attacking)
				overlays+=/obj/EARROW
	MouseExited()
		overlays -= nametag
		overlays-=/obj/EARROW

	Click()
		for(var/Party_Members/P in world)
			if(usr.TURN==P&&P.attacking&&!P.clicked&&!src.attacking)
				src.attacking=1
				overlays-=/obj/EARROW
				if(P.name=="Pikachu")
					P.clicked=1
					P.x+=10
					spawn(1)
						usr<<pikaattack
						flick("Cast",P)
						if(prob(70+P.ACCURACY))
							spawn(2)
								usr<<shock
							spawn(2)
								pixel_y+=4
								animate(src,color=rgb(255,0,0),time=3)
								if(src.name=="Boo"||src.name=="Saibamen")
									flick("HIT",src)
								new/obj/FX/Shock(src.loc)
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
							spawn(6)
								P.x-=10
								P.pixel_y=-30
								P.pixel_y=-25
								var/damage=P.STRENGTH*rand(2,2.25)+P.STRENGTH_ADDED-DEFENSE/2
								if(WEAK_TO == "BOLT")
									damage=damage*2
								HEALTH-=damage
								BarUpdate()
								new/effect/damage(src.loc,"<font color=red><b>[round(damage)]</b></font>")
								if(HEALTH<=0)
									spawn(2.5)
										Death(usr,P)
								if(HEALTH<-100)
									spawn(1)
									new/effect/damage(src.loc,"<font color=yellow><b>OVERKILL</b></font>")
									usr.OVERKILLED=1

								P.attacking=0
								P.clicked=0
								src.attacking=0
								Turn_End(P)
						else
							x+=6
							spawn(5)
								x-=6
								P.x-=10
								P.pixel_y=-30
								P.pixel_y=-25
								new/effect/damage(src.loc,"<font color=white><b>MISS</b></font>")
								P.attacking=0
								P.clicked=0
								src.attacking=0
								Turn_End(P)

				else
					if(P.WEAPON_TYPE=="GUN")
						P.clicked=1
						P.x+=2
						var/crit=0
						spawn(1)
							if(P.icon_state!="Slime-[P.name]")
								flick("Shoot",P)
							if(prob(80+P.ACCURACY))
								spawn(2)
									usr<<shoot

								spawn(2.5)
									if(src.IMMUNE_TO_PHYS==1&&P.ATTACK_ELEMENT=="NONE")
										usr<<armor
									if(P.ATTACK_ELEMENT=="BOLT")
										usr<<shock
									if(prob(10))
										usr<<crit
										crit=1
									else
										usr<<shoot
									pixel_y+=4
									animate(src,color=rgb(255,0,0),time=3)
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
								spawn(4)
									P.x-=2
									P.pixel_y=-30
									P.pixel_y=-25
									var/damage=P.STRENGTH*rand(1,1.25)+P.ACC_ADDED-DEFENSE/2
									if(crit)
										damage=damage*2
										new/effect/damage(src.loc,"<font color=yellow><b>CRIT! </b></font><font color=red><b>[round(damage)]</b></font>")
										HEALTH-=damage
										crit=0
									if(src.IMMUNE_TO_PHYS==0)
										new/effect/damage(src.loc,"<font color=red><b>[round(damage)]</b></font>")
										HEALTH-=damage
									if(P.ATTACK_ELEMENT=="BOLT"&&WEAK_TO == "BOLT")
										new/effect/damage(src.loc,"<font color=red><b>[round(damage)]</b></font>")
										damage=damage*2
										HEALTH-=damage
									if(src.IMMUNE_TO_PHYS==1&&P.ATTACK_ELEMENT=="NONE")
										new/effect/damage(src.loc,"<font color=white><b>BLOCKED</b></font>")
										HEALTH-=0
									if(HEALTH<=0)
										spawn(2.5)
											Death(usr,P)
									if(HEALTH<-100)
										spawn(1)
										new/effect/damage(src.loc,"<font color=yellow><b>OVERKILL</b></font>")
										usr.OVERKILLED=1
									if(HEALTH>0)
										if(name=="Metool"&&!skilling &&can_skill&&!IMMUNE_TO_PHYS)
											var/E_SKILL/ES=pick(E_Skills)
											ES.Activate(src)
									BarUpdate()
									P.attacking=0
									P.clicked=0
									src.attacking=0
									Turn_End(P)
							else
								x+=2
								spawn(2)
									usr<<shoot
								spawn(3)
									usr<<miss
								spawn(4)
									x-=2
									P.x-=2
									P.pixel_y=-30
									P.pixel_y=-25
									new/effect/damage(src.loc,"<font color=white><b>MISS</b></font>")
									P.attacking=0
									P.clicked=0
									src.attacking=0
									Turn_End(P)
					if(P.WEAPON_TYPE=="SWORD")
						P.clicked=1
						P.x+=6
						var/crit=0
						spawn(1)
							if(P.icon_state!="Slime-[P.name]")
								flick("Attack",P)
							if(prob(70+P.ACCURACY))
								spawn(1)
									if(src.IMMUNE_TO_PHYS==1&&P.ATTACK_ELEMENT=="NONE")
										usr<<armor
									if(P.ATTACK_ELEMENT=="BOLT")
										usr<<shock
									else
										usr<<hit
								spawn(2)
									pixel_y+=4
									animate(src,color=rgb(255,0,0),time=3)
									if(src.name=="Boo"||src.name=="Saibamen")
										flick("HIT",src)
									if(src.IMMUNE_TO_PHYS==1&&P.ATTACK_ELEMENT=="NONE")
										usr<<armor
									if(P.ATTACK_ELEMENT=="BOLT")
										usr<<shock
									if(prob(10))
										usr<<crit
										crit=1
									else
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
									P.x-=6
									P.pixel_y=-30
									P.pixel_y=-25
									var/damage=P.STRENGTH*rand(1,1.25)+P.STRENGTH_ADDED-DEFENSE/2
									if(crit)
										damage=damage*2
										new/effect/damage(src.loc,"<font color=yellow><b>CRIT! </b></font><font color=red><b>[round(damage)]</b></font>")
										HEALTH-=damage
										crit=0
									if(src.IMMUNE_TO_PHYS==0)
										new/effect/damage(src.loc,"<font color=red><b>[round(damage)]</b></font>")
										HEALTH-=damage
									if(P.ATTACK_ELEMENT=="BOLT"&&WEAK_TO == "BOLT")
										new/effect/damage(src.loc,"<font color=red><b>[round(damage)]</b></font>")
										damage=damage*2
										HEALTH-=damage
									if(src.IMMUNE_TO_PHYS==1&&P.ATTACK_ELEMENT=="NONE")
										new/effect/damage(src.loc,"<font color=white><b>BLOCKED</b></font>")
										HEALTH-=0
									if(HEALTH<=0)
										spawn(2.5)
											Death(usr,P)
									if(HEALTH<-100)
										spawn(1)
										new/effect/damage(src.loc,"<font color=yellow><b>OVERKILL</b></font>")
										usr.OVERKILLED=1
									if(HEALTH>0)
										if(name=="Metool"&&!skilling &&can_skill&&!IMMUNE_TO_PHYS)
											var/E_SKILL/ES=pick(E_Skills)
											ES.Activate(src)
									BarUpdate()
									P.attacking=0
									P.clicked=0
									src.attacking=0
									Turn_End(P)
							else
								x+=2
								spawn(1)
									usr<<miss
								spawn(2)
									usr<<miss
								spawn(5)
									x-=2
									P.x-=6
									P.pixel_y=-30
									P.pixel_y=-25
									new/effect/damage(src.loc,"<font color=white><b>MISS</b></font>")
									P.attacking=0
									P.clicked=0
									src.attacking=0
									Turn_End(P)

	SQUID
		name="Ninja Squid"
		icon='Enemies/NinjaSquid.dmi'
		HEALTH = 45
		MAX_HEALTH = 45
		EXP_GAIN = 16
		STRENGTH = 5
		DEFENSE = 1
		GOLD_GAIN = 10
	BOO
		name="Boo"
		icon='Enemies/Boo.dmi'
		icon_state="BOO"
		HEALTH = 45
		MAX_HEALTH = 45
		EXP_GAIN = 16
		STRENGTH = 6
		DEFENSE = 2
		GOLD_GAIN = 10
		STATUS_GIVE = "Poison"
		STATUS_PERCENT = 25
		New()
			E_Skills.Add(new/E_SKILL/BOO)
			Drops.Add(new/MATERIALS/BOO/ECTOPLASM, new/MATERIALS/BOO/FANG, new/MATERIALS/BOO/SKIN, new/MATERIALS/BOO/TONGUE,)
	METOOL
		name="Metool"
		icon='Enemies/Metool.dmi'
		icon_state="METOOL"
		HEALTH = 45
		MAX_HEALTH = 45
		EXP_GAIN = 16
		STRENGTH = 4
		DEFENSE = 2
		GOLD_GAIN = 10
		New()
			E_Skills.Add(new/E_SKILL/METOOL)
	PBAG
		name="pbag"
		icon='Enemies/Baddies64.dmi'
		icon_state="pbag"
		HEALTH = 100
		MAX_HEALTH = 100
		EXP_GAIN = 1
		STRENGTH = 1
		DEFENSE = 1
		GOLD_GAIN = 1
	SAIBAMEN
		name="Saibamen"
		icon='Enemies/Saibamen.dmi'
		icon_state="SAIBAMEN"
		HEALTH = 55
		MAX_HEALTH = 55
		EXP_GAIN = 16
		STRENGTH = 6
		DEFENSE = 2
		GOLD_GAIN = 25
		New()
			E_Skills.Add(new/E_SKILL/SAIBA)
			E_Skills.Add(new/E_SKILL/ACID)
	GAMMA
		name="E-102 Gamma"
		icon='Enemies/Baddies64.dmi'
		icon_state="GAMMA"
		HEALTH = 55
		MAX_HEALTH = 55
		EXP_GAIN = 25
		STRENGTH = 4
		DEFENSE = 2
		GOLD_GAIN = 34
		New()
			E_Skills.Add(new/E_SKILL/GAMMA)
	MANKEY
		name="#048 Mankey"
		icon='Enemies/Baddies64.dmi'
		icon_state="MANKEY"
		HEALTH = 55
		MAX_HEALTH = 55
		EXP_GAIN = 45
		STRENGTH = 6
		DEFENSE = 2
		GOLD_GAIN = 45
		WEAK_TO = "WATER"
	SLIME
		name="Slime"
		icon='Enemies/Baddies1.dmi'
		icon_state="SLIME"
		HEALTH = 30
		MAX_HEALTH = 30
		EXP_GAIN = 32
		STRENGTH = 6
		DEFENSE = 0
		GOLD_GAIN = 25
		STATUS_GIVE = "Slime"
		STATUS_PERCENT = 4
		WEAK_TO = "SLIME"


	BOSS
		IS_BOSS=1
		GROUDON
			name="Groudon"
			icon='Enemies/Bosses/Groudon.dmi'
			HEALTH=150
			MAX_HEALTH = 150
			EXP_GAIN=240
			STRENGTH=15
			DEFENSE=8
			GOLD_GAIN=2400
		HOOH
			name="Ho-Oh"
			icon='BattleSystem/Skills/HoOh/HoOh.dmi'
			dir=WEST
			HEALTH=200
			MAX_HEALTH = 200
			EXP_GAIN=250
			STRENGTH=16
			DEFENSE=10
			WEAK_TO = "WATER"
			GOLD_GAIN=3200
			New()
				E_Skills.Add(new/E_SKILL/SACRED_FIRE, new/E_SKILL/BURN_UP)


	proc
		Death(mob/killer,Party_Members/killer2)
			dead=1
			animate(src,color=rgb(255,0,0),time=3)
			animate(src,transform=matrix()*1.5,alpha=0,color=rgb(255,0,0),time=5)
			killer<<enemy_kill
			killer.ENEMY_NUMBER--
			killer.Battlers.Remove(src)
			killer.DropCheck(src)
			for(var/Party_Members/P in killer.Party)
				if(killer.Party.len==2)
					P.EXP+=src.EXP_GAIN/2
				if(killer.Party.len==3)
					P.EXP+=src.EXP_GAIN/3
				if(killer.Party.len==4)
					P.EXP+=src.EXP_GAIN/4
			killer2.EXP+=src.EXP_GAIN
			killer.EXP_GAINED+=src.EXP_GAIN
			killer.GOLD_GAINED+=src.GOLD_GAIN
			killer.moneys+=src.GOLD_GAIN
			if(killer.ENEMY_NUMBER<=0)
				spawn(5)
					killer.BattleEnd()
			spawn(10)
				for(var/obj/ENEMY_BAR/E in world)
					if(E.owner==src)
						del(E)
				del(src)
		Miss()
			if(!attacking&&!dead)
				attacking=1
				for(var/mob/M in world)
					if(src in M.Battlers)
						var/Party_Members/Target=pick(M.Party)
						if(!Target.dead)
							Target.BEING_ATTACKED=1
							pixel_x+=6
							spawn(3)
								pixel_x-=6
								Target.BEING_ATTACKED=0
							new/effect/damage(Target.loc,"<font color=white><b>MISS</b></font>")
						spawn(10)
							attacking=0
		Attack()
			if(!attacking&&!dead)
				attacking=1
				for(var/mob/M in world)
					if(src in M.Battlers)
						var/Party_Members/Target=pick(M.Party)
						if(!Target.dead&&!Target.clicked&&Target.IN_BATTLE&&!Target.attacking)
							Target.BEING_ATTACKED=1
							var/spot=loc
							loc=Target.loc
							if(icon!='Baddies1.dmi')
								if(icon!='Baddies64.dmi')
									if(icon!='BattleSystem/Skills/HoOh/HoOh.dmi')
										flick("ATTACK",src)
							spawn(3)
								loc=spot
							M<<hit
							flick("Hit",Target)
							if(Target.name=="Pikachu")
								M<<pikahurt
							var/damage=STRENGTH*rand(1,1.25)-Target.DEFENSE
							new/effect/damage(Target.loc,"<font color=red><b>[round(damage)]</b></font>")
							Target.HEALTH-=damage
							if(prob(STATUS_PERCENT))
								Target.Start_Ailment(STATUS="[STATUS_GIVE]")
							M.HPUpdate()
							if(Target.HEALTH<=0)
								Target.dead=1
								M<<sound(Target.dead_sound)
								if(TURN==Target)
									if(Target.attacking==1)
										Target.attacking=0
										return
									else
										Turn_End(Target)
								M.StatUpdate()
								M.HPUpdate()
							M.StatUpdate()
							spawn(5)
								Target.BEING_ATTACKED=0
						spawn(15)
							attacking=0




effect/damage
	parent_type = /obj
	layer = EFFECTS_LAYER
	pixel_x=14
	maptext_width=256
	New(newloc, val)
		maptext = val
		src.loc=newloc
		spawn(5)
			animate(src,alpha=0,pixel_y=96,time=4)
			spawn(10)
				del(src)
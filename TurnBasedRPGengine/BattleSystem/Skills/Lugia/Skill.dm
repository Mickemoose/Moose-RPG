SKILL
	parent_type = /obj
	var
		USES_PER_BATTLE = 100
		MAGIC_USE = 50

	icon='BattleSystem/Skills/Skills1.dmi'
	proc
		Activate()
			..()
	LUGIA
		icon_state="lugia"
		name="Aeroblast"
		desc="Lugia is summoned and fires an Aeroblast at all enemies."
		USES_PER_BATTLE = 1
		MAGIC_USE = 24

		Activate()
			USES_PER_BATTLE--
			for(var/Party_Members/P in world)
				if(usr.TURN==P&&!P.attacking&&P.MAGIC>23)
					P.MAGIC-=23
					usr.MAGICUpdate()
					P.icon_state="Cast"
					P.overlays+=/obj/SKILL/CAST/aura
					P.attacking=1
					usr<<cast
					spawn(5)
						usr.Message("<center>[src.name]",10,"bottom")
					spawn(10)

						P.icon_state="Stance"
						P.overlays-=/obj/SKILL/CAST/aura
						for(var/ENEMY/E2 in usr.Battlers)
							E2.can_attack=0

						var/obj/FX/LUGIA/Lugia/L=new/obj/FX/LUGIA/Lugia(usr.loc)
					//	L.loc=locate(29,139,2)
						fade.Map(usr, 200, 16, 8)
						usr<<lugia
						spawn(2)
							for(var/ENEMY/E in usr.Battlers)
								E.overlays+=/obj/FX/LUGIA/Blast
								pixel_y+=4
								animate(E,color=rgb(255,0,0),time=3)
								usr<<hit
								spawn(0.5)
									pixel_y-=4
									pixel_x+=4
									spawn(0.5)
										pixel_y-=4
										pixel_x-=4
										usr<<hit
										spawn(0.5)
											pixel_y+=4
											pixel_x-=4
											spawn(0.5)
												pixel_y=0
												pixel_x=0

												animate(E,color=rgb(255,255,255),time=5)

								var/damage=pick(64,72,88,54,56,66,75,83)
								new/effect/damage(E.loc,"<font color=red><b>[round(damage)]</b></font>")
								E.HEALTH-=damage

								usr<<wind
							//	animate(L, transform = null, alpha=0, time = 10)
								spawn(10)
									del(L)
									E.overlays-=E.overlays
									E.can_attack=1
									if(E.HEALTH<=0)
										E.Death(usr,P)
										E.overlays-=E.overlays
									if(E.HEALTH<-100)
										spawn(1)
											new/effect/damage(E.loc,"<font color=yellow><b>OVERKILL</b></font>")
											usr.OVERKILLED=1

									fade.Map(usr, 0, 32, 5)
									P.attacking=0
									usr.Turn_End(P)




obj
	FX
		LUGIA
			Blast
				icon='BattleSystem/Skills/Lugia/FX.dmi'
				layer=EFFECTS_LAYER
			Lugia
				icon='BattleSystem/Skills/Lugia/Lugia.dmi'
				dir=EAST

				layer=EFFECTS_LAYER
				New()
			//		..()
					animate(src, transform = matrix(), alpha=0, time = 0)
					animate(src, transform = matrix(), alpha=255, time = 4)
					animate(src, transform = matrix(), pixel_y=96, time = 4)
				//	..()

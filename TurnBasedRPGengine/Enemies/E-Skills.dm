E_SKILL
	parent_type = /obj
	var
		USES_PER_BATTLE = 100
		MAGIC_USE = 50

//	icon='BattleSystem/Skills/Skills1.dmi'
	proc
		Activate()
			..()
	SAIBA
		name="Suicide Explode"
		Activate(ENEMY/usr)
			for(var/mob/M in world)
				if(usr in M.Battlers)
					for(var/ENEMY/E in M.Battlers)
						if(M.Battlers.len>1)
							if(!usr.skilling&&usr.can_skill)
								usr.skilling=1
								usr.can_skill = 0
								M.Info("Saibamen is choosing its target!")
								var/Party_Members/TARGET=pick(M.Alives)

								spawn(14)
									for(var/obj/INFOBOX/C2 in M.client.screen)
										del(C2)

								spawn(30)
									if(!usr.dead&&TARGET.GUEST==0&&TARGET.IN_BATTLE)
										M<<saiba
										M.Info("[TARGET] can't get out of Saibamens Grasp!")
										usr.invisibility=101
										M.ENEMY_NUMBER--
										M.Battlers.Remove(src)
										TARGET.overlays+=/obj/FX/SaibaHold
										TARGET.icon_state="Hit"
										TARGET.IN_BATTLE=0
										if(M.TURN==TARGET)
											M.Turn_End(TARGET)
										M.Wait_List.Remove(TARGET)
										M.StatUpdate()
										spawn(60)
											if(!usr.dead)
												TARGET.icon_state="Boom"
												M.Info("Saibamen is releasing a ton of energy!?")
												M<<saibaboom
												spawn(14)
													for(var/obj/INFOBOX/C2 in M.client.screen)
														del(C2)
												spawn(20)
													new/obj/FX/Explosion(TARGET.loc)
													M<<splode
													spawn(2)
														TARGET.overlays-=/obj/FX/SaibaHold
														TARGET.HEALTH=0
														TARGET.dead=1
														M<<sound(TARGET.dead_sound)
														M.HPUpdate()
														M.StatUpdate()
													usr.skilling=0
													del(usr)
													spawn(10)

														usr.can_skill=1
														del(usr)

	METOOL
		name="Metool Hide"
		Activate(ENEMY/usr)
			if(!usr.skilling)
				usr.skilling=1
				usr.can_skill = 0
				for(var/mob/M in world)
					if(usr in M.Battlers)
						M.Info("Metool goes into his hat!")
						spawn(14)
							for(var/obj/INFOBOX/C2 in M.client.screen)
								del(C2)
						flick("CHANGE",usr)
						spawn(3)
							usr.icon_state="HIDE"
							usr.IMMUNE_TO_PHYS=1
							spawn(50)
								flick("BACK",usr)
								spawn(3)
									usr.icon_state="METOOL"
									usr.IMMUNE_TO_PHYS=0
									M.Info("Metool is visible again!")
									spawn(14)
										for(var/obj/INFOBOX/C2 in M.client.screen)
											del(C2)
									spawn(2)
										usr.skilling=0
									spawn(30)
										usr.can_skill=1
	BOO
		name="Boo Hide"
		Activate(ENEMY/usr)
			if(!usr.skilling)
				usr.skilling=1
				usr.can_skill = 0
				for(var/mob/M in world)
					if(usr in M.Battlers)
						M.Info("Boo is shy!")
						animate(usr, alpha = 150, time = 5)
						spawn(14)
							for(var/obj/INFOBOX/C2 in M.client.screen)
								del(C2)
						for(var/mob/M2 in world)
							if(usr in M2.Battlers)
								M2<<BOO
						spawn(5)
							usr.icon_state="HIDDEN"
							usr.IMMUNE_TO_PHYS=1
							spawn(75)
								animate(usr, alpha = 255, time = 5)
								for(var/mob/M2 in world)
									if(usr in M2.Battlers)
										M2<<BOO
								usr.icon_state="BOO"
								usr.IMMUNE_TO_PHYS=0
								M.Info("Boo is confident again!")
								spawn(14)
									for(var/obj/INFOBOX/C2 in M.client.screen)
										del(C2)
								usr.skilling=0
								spawn(30)
									usr.can_skill=1
	GAMMA
		name="Gamma Shocker"
		Activate(ENEMY/usr)
			if(!usr.skilling)
				usr.skilling=1
				usr.can_skill=0
				for(var/mob/M in world)
					if(usr in M.Battlers)
						M.Info("Gamma Blast")
						spawn(14)
							for(var/obj/INFOBOX/C2 in M.client.screen)
								del(C2)
				//		usr.overlays+=/obj/SKILL/CAST/aura
						for(var/mob/M2 in world)
							if(usr in M2.Battlers)
								M2<<gammavoice
						//		M2<<cast
					//	for(var/Party_Members/P in view(10))
					//		P.paused=1
						spawn(5)
							flick("GAMMA-ATTACK",usr)
							spawn(3)
								view(8)<<blast
								var/Party_Members/Target=pick(M.Party)
								new /obj/FX/GAMMA/Blast(Target.loc)
								if(!Target.dead&&Target.IN_BATTLE)
									M<<hit
									Target.pixel_y+=4
									animate(Target,color=rgb(255,0,0),time=3)
									spawn(0.5)
										Target.pixel_y-=4
										Target.pixel_x+=4
										spawn(0.5)
											Target.pixel_y-=4
											Target.pixel_x-=4
											spawn(0.5)
												Target.pixel_y+=4
												Target.pixel_x-=4
												spawn(0.5)
													Target.pixel_x+=4
													Target.pixel_y+=0
													animate(Target,color=rgb(255,255,255),time=3)
									new/effect/damage(Target.loc,"<font color=red><b>8</b></font>")
									Target.HEALTH-=8
									M.HPUpdate()
									if(Target.HEALTH<=0)
										Target.dead=1
										M<<sound(Target.dead_sound)
										if(usr.TURN==Target)
											if(Target.attacking==1)
												Target.attacking=0
												return
											else
												M.Turn_End(Target)
										M.StatUpdate()
										M.HPUpdate()
									M.StatUpdate()
									spawn(2)
										M<<hit
										Target.pixel_y+=4
										animate(Target,color=rgb(255,0,0),time=3)
										spawn(0.5)
											Target.pixel_y-=4
											Target.pixel_x+=4
											spawn(0.5)
												Target.pixel_y-=4
												Target.pixel_x-=4
												spawn(0.5)
													Target.pixel_y+=4
													Target.pixel_x-=4
													spawn(0.5)
														Target.pixel_y+=4
														Target.pixel_x+=4
														animate(Target,color=rgb(255,255,255),time=3)
										new/effect/damage(Target.loc,"<font color=red><b>8</b></font>")
										Target.HEALTH-=8
										M.HPUpdate()
										if(Target.HEALTH<=0)
											Target.dead=1
											M<<sound(Target.dead_sound)
											if(M.TURN==Target)
												if(Target.attacking==1)
													Target.attacking=0
													return
												else
													M.Turn_End(Target)
											M.StatUpdate()
											M.HPUpdate()
										M.StatUpdate()
										spawn(2)
											M<<hit
											Target.pixel_y+=4
											animate(Target,color=rgb(255,0,0),time=3)
											spawn(0.5)
												Target.pixel_y-=4
												Target.pixel_x+=4
												spawn(0.5)
													Target.pixel_y-=4
													Target.pixel_x-=4
													spawn(0.5)
														Target.pixel_y+=4
														Target.pixel_x-=4
														spawn(0.5)
															Target.pixel_y+=0
															Target.pixel_x+=4
															animate(Target,color=rgb(255,255,255),time=3)
											new/effect/damage(Target.loc,"<font color=red><b>8</b></font>")
											Target.HEALTH-=8
											M.HPUpdate()
											if(Target.HEALTH<=0)
												Target.dead=1
												M<<sound(Target.dead_sound)
												if(M.TURN==Target)
													if(Target.attacking==1)
														Target.attacking=0
														return
													else
														M.Turn_End(Target)
												M.StatUpdate()
												M.HPUpdate()
											M.StatUpdate()
											usr.skilling=0
											spawn(10)
												usr.can_skill=1



obj
	FX
		Shock
			icon='Enemies/FX96.dmi'
			icon_state="shock"
			layer=EFFECTS_LAYER
			New()
				spawn(8)
					del(src)
		GAMMA
			Blast
				icon='Enemies/FX.dmi'
				icon_state="GAMMA"
				layer=EFFECTS_LAYER
				var/STRENGTH=35
				var/timer=100
				var/owner=null
				New()
					spawn(10)
						del src
		Explosion
			icon='Enemies/Explosion.dmi'
			icon_state=null
			layer=MOB_LAYER+100
			New()
				flick("splode",src)
				spawn(10)
					del(src)
		SaibaHold
			icon='Enemies/SaibaFX.dmi'
			icon_state="Hit"
			layer=MOB_LAYER+5




mob
	proc
		Duel_Start(mob/Attacker,mob/Defender)
			for(var/ARENAS/A in world)
				if(!A.taken&&A.special==1&&Attacker.IN_BATTLE==0&&Defender.IN_BATTLE==0)
					Attacker.IN_BATTLE=1
					Defender.IN_BATTLE=1
					Attacker.IN_DUEL=1
					Defender.IN_DUEL=1
					A.user=Attacker.key
					A.taken=1
					Attacker<<sound(null)
					Attacker.CLASS2="Attacker"
					Defender.CLASS2="Defender"
					Attacker<<duel
					Attacker.overloc=Attacker.loc
					Attacker.loc=locate(32,32,2)
					Attacker.invisibility=101
					Defender<<sound(null)
					Defender<<duel
					Defender.overloc=Defender.loc
					Defender.loc=locate(33,33,2)
					Defender.invisibility=101
					Defender.ENEMY_NUMBER=1
					Attacker.ENEMY_NUMBER=1

					if(A.taken&&A.user==Attacker.key)
						spawn(22)

							for(var/SPAWNS/Camera/C in A.contents)
								if(A.user==Attacker.key)
									Attacker.loc=C.loc
									Defender.loc=C.loc

							for(var/Party_Members/PA in Defender.Party)
								if(PA.Party_Position==1)
									for(var/SPAWNS/PVP_P1/P1 in A.contents)
										PA.loc=P1.loc
										PA.IN_BATTLE=1
										Defender.Alives.Add(PA)
										PA.Timer()
									//	return
							for(var/Party_Members/PB in Attacker.Party)
								if(PB.Party_Position==1)
									for(var/SPAWNS/PVP_P2/P1 in A.contents)
										PB.loc=P1.loc
										PB.IN_BATTLE=1
									//	P.icon=Flip(WEST)
										var/icon/I = new(PB.icon)
										I.Flip(WEST)
										PB.icon = I
										PB.overlays-=PB.overlays
										if(PB.HAIR_SLOT != "NONE")
											var/icon/I2 = new(PB.hair_overlay)
											I2.Flip(WEST)
											PB.overlays+=I2
										if(PB.EYE_SLOT != "NONE")
											var/icon/I2 = new(PB.eye_overlay)
											I2.Flip(WEST)
											PB.overlays+=I2
										if(PB.HEAD_SLOT != "NONE")
											var/icon/I2 = new(PB.head_overlay)
											I2.Flip(WEST)
											PB.overlays+=I2
										if(PB.MASK_SLOT != "NONE")
											var/icon/I2 = new(PB.mask_overlay)
											I2.Flip(WEST)
											PB.overlays+=I2
										if(PB.OUTFIT_SLOT != "NONE")
											var/icon/I2 = new(PB.outfit_overlay)
											I2.Flip(WEST)
											PB.overlays+=I2
										if(PB.WEAPON_SLOT != "NONE")
											var/icon/I2 = new(PB.weapon_overlay)
											I2.Flip(WEST)
											PB.overlays+=I2




										Attacker.Alives.Add(PB)
										PB.Timer()
								//		return
							Attacker.Stats()
							Attacker.HPUpdate()
							Attacker.MAGICUpdate()
							Defender.Stats()
							Defender.HPUpdate()
							Defender.MAGICUpdate()
							break
				else
					continue

						//set to battle
						//start time bars
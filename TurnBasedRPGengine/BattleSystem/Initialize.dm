mob
	proc
		Battle_Start(enemy,enemy_count=1)
			for(var/ARENAS/A in world)
				if(!A.taken&&!A.special&&src.IN_BATTLE==0)
					src.IN_BATTLE=1
					A.user=src.key
					A.taken=1
					src<<sound(null)
					if(enemy=="Ho-Oh")
						src<<hoohmusic
					else
						src<<battle
					src.overloc=src.loc
					src.loc=locate(32,32,2)
					src.invisibility=101
					if(A.user==src.key)
						spawn(22)
							src.ENEMY_NUMBER=enemy_count
							if(A.user==src.key)
								for(var/SPAWNS/Camera/C in A.contents)
									if(A.user==src.key)
										src.loc=C.loc

							src.invisibility=101
					//		if(enemy_count>1)
						//		src.Message("<center>[enemy_count] bad guys appear!",10,"bottom")
							if(enemy=="Ho-Oh")
								var/ENEMY/BOSS/E=new /ENEMY/BOSS/HOOH
								src.Message("<center>[E.name] rises to the challenge!",15,"bottom")
								Target_List.Add(E)
								src.Battlers.Add(E)
								if(A.user==src.key)
									for(var/SPAWNS/Boss/E1 in A.contents)
										if(!E1.taken)
											E.loc=E1.loc
											E1.taken=1
											E.Active()
							if(enemy==1)
								if(enemy_count==1)
									var/ENEMY/E
									E=pick(Region01)
									var/ENEMY/O = text2path("/ENEMY/[E]")
									if(A.user==src.key)
										for(var/SPAWNS/Enemy/E1 in A.contents)
											if(!E1.taken)
												E = new O(E1.loc)
												Target_List.Add(E)
												src.Battlers.Add(E)
												new /obj/ENEMY_BAR(E)
												E1.taken=1
												E.Active()
									src.Message("<center>[enemy_count] [E.name] appears!",15,"bottom")
								if(enemy_count==2)
									var/ENEMY/E
									E=pick(Region01)
									var/ENEMY/O = text2path("/ENEMY/[E]")
									if(A.user==src.key)
										for(var/SPAWNS/Enemy/E1 in A.contents)
											if(!E1.taken)
												E = new O(E1.loc)
												Target_List.Add(E)
												src.Battlers.Add(E)
												new /obj/ENEMY_BAR(E)
												E1.taken=1
												E.Active()
									var/ENEMY/E2
									E2=pick(Region01)
									var/ENEMY/O2 = text2path("/ENEMY/[E2]")
									if(A.user==src.key)
										for(var/SPAWNS/Enemy2/S2 in A.contents)
											if(!S2.taken)
												E2 = new O2(S2.loc)
												Target_List.Add(E2)
												src.Battlers.Add(E2)
												new /obj/ENEMY_BAR(E2)
												S2.taken=1
												E2.Active()
									src.Message("<center>[E.name] and [E2.name] appear!",15,"bottom")

								if(enemy_count==3)
									var/ENEMY/E
									E=pick(Region01)
									var/ENEMY/O = text2path("/ENEMY/[E]")
									if(A.user==src.key)
										for(var/SPAWNS/Enemy/E1 in A.contents)
											if(!E1.taken)
												E = new O(E1.loc)
												Target_List.Add(E)
												src.Battlers.Add(E)
												new /obj/ENEMY_BAR(E)
												E1.taken=1
												E.Active()
									var/ENEMY/E2
									E2=pick(Region01)
									var/ENEMY/O2 = text2path("/ENEMY/[E2]")
									if(A.user==src.key)
										for(var/SPAWNS/Enemy2/S2 in A.contents)
											if(!S2.taken)
												E2 = new O2(S2.loc)
												Target_List.Add(E2)
												src.Battlers.Add(E2)
												new /obj/ENEMY_BAR(E2)
												S2.taken=1
												E2.Active()
									var/ENEMY/E3
									E3=pick(Region01)
									var/ENEMY/O3 = text2path("/ENEMY/[E3]")
									if(A.user==src.key)
										for(var/SPAWNS/Enemy3/S3 in A.contents)
											if(!S3.taken)
												E3 = new O3(S3.loc)
												Target_List.Add(E3)
												src.Battlers.Add(E3)
												new /obj/ENEMY_BAR(E3)
												S3.taken=1
												E3.Active()
									src.Message("<center>[E.name], [E2.name] and [E3.name] appear!",15,"bottom")
							//set the background

							for(var/Party_Members/P in src.Party)
								P.IN_BATTLE=1
								src.Alives.Add(P)
								if(A.user==src.key)
									if(P.Party_Position==1)

										for(var/SPAWNS/Party_Slot1/P1 in A.contents)
											P.loc=P1.loc
									if(P.Party_Position==2)
										for(var/SPAWNS/Party_Slot2/P2 in A.contents)
											P.loc=P2.loc
									if(P.Party_Position==3)
										for(var/SPAWNS/Party_Slot3/P3 in A.contents)
											P.loc=P3.loc
									if(P.Party_Position==4)
										for(var/SPAWNS/Party_Slot4/P4 in A.contents)
											P.loc=P4.loc
									P.Timer()
							Stats()
							HPUpdate()
							MAGICUpdate()
							break
				else

					continue

						//set to battle
						//start time bars
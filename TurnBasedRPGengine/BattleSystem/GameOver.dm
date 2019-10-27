



mob
	proc
		RunAway()
			for(var/Party_Members/P in src.Party)
				P.IN_BATTLE=0
			src.Info("The Party runs away!","black")
			src<<sound(null)
			src<<escape
			spawn(10)
				for(var/obj/INFOBOX/C2 in src.client.screen)
					del(C2)
			src.Wait_List.Remove(src.Wait_List)
			src.IN_BATTLE=0
			src.TURN=null
			fade.Map(src, 255, 15, 8)
			spawn(16)
				for(var/ARENAS/A in world)
					if(A.user==src.key)
						for(var/ENEMY/E in src.Battlers)
							Target_List.Remove(E)
							Battlers.Remove(E)
							for(var/obj/ENEMY_BAR/E2 in world)
								if(E2.owner==src)
									for(var/obj/ENEMY_BAR_UNDER/U in world)
										if(U.owner==E2)
											del(U)
									del(E2)

							del(E)
						for(var/SPAWNS/Enemy/E1 in A.contents)
							E1.taken=0
						for(var/SPAWNS/Enemy2/E1 in A.contents)
							E1.taken=0
						for(var/SPAWNS/Enemy3/E1 in A.contents)
							E1.taken=0
						A.taken=0
						A.user = null
			for(var/BATTLE_BUTTONS/B in src.client.screen)
				del(B)
			for(var/BATTLE_STATS/S in src.client.screen)
				del(S)
			for(var/obj/BATTLEBOX/B in src.client.screen)
				del(B)
			spawn(19)

				src<<realm
				src.loc=src.overloc
				src.invisibility=0
			spawn(20)
				fade.Map(src, 0, 15, 8)
				src.OVERKILLED=0
				for(var/Party_Members/P in src.Party)
					P.IN_BATTLE=0
					P.timer=0
					src.Alives.Remove(P)
					P.overlays-=/obj/ARROW
					P.overlays-=/obj/CIRCLE
					P.Start_Ailment(STATUS="Cure")
					P.loc=src.contents





		GameOver()
			src<<sound(null)
	//		src<<fanfare
			for(var/Party_Members/P in src.Party)
				P.IN_BATTLE=0
			src.Info("The Party has fallen...","black")
			spawn(30)
				for(var/obj/INFOBOX/C2 in src.client.screen)
					del(C2)
			spawn(30)
				src<<sound(null)
				src<<realm
				src.loc=src.overloc
				src.invisibility=0
				src.IN_BATTLE=0
				src.TURN=null
				src.OVERKILLED=0
				src.Wait_List.Remove(src.Wait_List)
				for(var/Party_Members/P in src.Party)
					P.IN_BATTLE=0
					P.HEALTH=P.MAX_HEALTH
					P.dead=0
					P.icon_state="Stance"
					P.timer=0
					src.Alives.Remove(P)
					P.overlays-=/obj/ARROW
					P.overlays-=/obj/CIRCLE
					P.Start_Ailment(STATUS="Cure")
					P.loc=src.contents
				for(var/ARENAS/A in world)
					if(A.user==src.key)
						for(var/ENEMY/E in src.Battlers)
							Target_List.Remove(E)
							Battlers.Remove(E)
							for(var/obj/ENEMY_BAR/E2 in world)
								if(E2.owner==src)
									for(var/obj/ENEMY_BAR_UNDER/U in world)
										if(U.owner==E2)
											del(U)
									del(E2)
							del(E)
						for(var/SPAWNS/Enemy/E1 in A.contents)
							E1.taken=0
						for(var/SPAWNS/Enemy2/E1 in A.contents)
							E1.taken=0
						for(var/SPAWNS/Enemy3/E1 in A.contents)
							E1.taken=0
						A.taken=0
						A.user = null
				for(var/BATTLE_BUTTONS/B in src.client.screen)
					del(B)
				for(var/BATTLE_STATS/S in src.client.screen)
					del(S)
				for(var/obj/BATTLEBOX/B in src.client.screen)
					del(B)

		BattleEnd()
			for(var/obj/INFOBOX/C2 in src.client.screen)
				del(C2)
			src<<sound(null)
			src<<fanfare

			var/Party_Members/quote=pick(src.Party)
			src<<sound(quote.win_sound)
			for(var/Party_Members/P in src.Party)
				if(P.icon_state!="Dead")
					P.icon_state="Win"
				P.IN_BATTLE=0
				P.timer=0
				P.overlays-=/obj/ARROW
				P.overlays-=/obj/CIRCLE
				P.Start_Ailment(STATUS="Cure")
				src.Alives.Remove(P)
		//	Message("VICT",30,"top")
			src.Info("The Battle is won!")
			spawn(6)
				for(var/obj/INFOBOX/C2 in src.client.screen)
					del(C2)
				src.Info("[src.GOLD_GAINED] money gained!")
				spawn(10)
					src.GOLD_GAINED=0
					for(var/obj/INFOBOX/C2 in src.client.screen)
						del(C2)
					src.Info("[src.EXP_GAINED] experience earned!")
					spawn(10)
						src.EXP_GAINED=0
						for(var/obj/INFOBOX/C2 in src.client.screen)
							del(C2)
						for(var/Party_Members/P in src.Party)
							if(P.EXP>=P.MAX_EXP)
								P.LevelUp()
						if(prob(50))
							itemAdd(new/ITEMS/Ether)
							src.Info("Ether found!")
						if(prob(35))
							itemAdd(new/ITEMS/Elixir)
							src.Info("Elixir found!")
						if(prob(35))
							itemAdd(new/ITEMS/Hi_Potion)
							src.Info("Hi Potion found!")
						if(prob(25))
							itemAdd(new/ITEMS/Max_Potion)
							src.Info("Max Potion found!")
						if(prob(25))
							itemAdd(new/ITEMS/Max_Ether)
							src.Info("Max Ether found!")
						if(prob(5))
							itemAdd(new/ITEMS/Max_Elixir)
							src.Info("Max Elixir found!")
						if(prob(50))
							itemAdd(new/ITEMS/Potion)
							src.Info("Potion found!")
						spawn(10)
							for(var/obj/INFOBOX/C2 in src.client.screen)
								del(C2)
							if(OVERKILLED)
								src.Info("<font color=yellow>OVERKILL BONUS")
								spawn(10)
									for(var/obj/INFOBOX/C2 in src.client.screen)
										del(C2)
									if(prob(50))
										src.Info("<font color=yellow>MORE EXP!!")
										for(var/Party_Members/P in src.Party)
											P.EXP+=154
											if(P.EXP>=P.MAX_EXP)
												P.LevelUp()
									if(prob(50))
										src.Info("<font color=yellow>MORE GOLD!!")
										src.moneys+=145
						spawn(59)
							for(var/Party_Members/P in src.Party)
								P.icon_state="Stance"
								P.loc=src.contents
						spawn(60)
							for(var/obj/INFOBOX/C2 in src.client.screen)
								del(C2)
							src<<sound(null)
							src<<realm
							src.loc=src.overloc
							src.invisibility=0
							src.IN_BATTLE=0
							src.TURN=null
						//	Info("[Region01.len] monsters left")
							src.Wait_List.Remove(src.Wait_List)
							src.OVERKILLED=0
							for(var/ARENAS/A in world)
								if(A.user==src.key)
									for(var/SPAWNS/Enemy/E1 in A.contents)
										E1.taken=0
									for(var/SPAWNS/Enemy2/E1 in A.contents)
										E1.taken=0
									for(var/SPAWNS/Enemy3/E1 in A.contents)
										E1.taken=0
									A.taken=0
									A.user = null
							for(var/BATTLE_BUTTONS/B in src.client.screen)
								del(B)
							for(var/BATTLE_STATS/S in src.client.screen)
								del(S)
							for(var/obj/BATTLEBOX/B in src.client.screen)
								del(B)


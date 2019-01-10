mob
	proc
		DuelWin()
			for(var/obj/INFOBOX/C2 in src.client.screen)
				del(C2)
			src<<sound(null)
			src<<fanfare

			for(var/Party_Members/P in src.Party)
				P.IN_BATTLE=0
				P.timer=0
				P.overlays-=/obj/ARROW
				P.overlays-=/obj/CIRCLE
				P.loc=src.contents
				if(src.CLASS2=="Attacker")
					P.icon = 'Characters/BaseMaleWhite.dmi'
					P.overlays-=P.overlays
					if(P.HAIR_SLOT != "NONE")
						P.overlays+=P.hair_overlay
					if(P.EYE_SLOT != "NONE")
						P.overlays+=P.eye_overlay
					if(P.HEAD_SLOT != "NONE")
						P.overlays+=P.head_overlay
					if(P.MASK_SLOT != "NONE")
						P.overlays+=P.mask_overlay
					if(P.OUTFIT_SLOT != "NONE")
						P.overlays+=P.outfit_overlay
					if(P.WEAPON_SLOT != "NONE")
						P.overlays+=P.weapon_overlay
				src.Alives.Remove(P)
		//	Message("VICT",30,"top")
			src.Info("The Duel is won!")
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
						spawn(60)
							for(var/obj/INFOBOX/C2 in src.client.screen)
								del(C2)
							src<<sound(null)
							src<<realm
							src.loc=src.overloc
							src.invisibility=0
							src.IN_BATTLE=0
							src.IN_DUEL=0
							src.TURN=null
							src.Wait_List.Remove(src.Wait_List)
							src.OVERKILLED=0
							src.CLASS2="NONE"
							for(var/ARENAS/A in world)
								if(A.user==src.key)
									for(var/SPAWNS/PVP_P1/E1 in A.contents)
										E1.taken=0
									for(var/SPAWNS/PVP_P2/E1 in A.contents)
										E1.taken=0
									A.taken=0
									A.user = null
							for(var/BATTLE_BUTTONS/B in src.client.screen)
								del(B)
							for(var/BATTLE_STATS/S in src.client.screen)
								del(S)
							for(var/obj/BATTLEBOX/B in src.client.screen)
								del(B)
		DuelLoss()
			src<<sound(null)
	//		src<<fanfare
			for(var/Party_Members/P in src.Party)
				P.IN_BATTLE=0
			src.Message("The Duel has been lost...",30,"top")
			spawn(30)
				src<<sound(null)
				src<<realm
				src.loc=src.overloc
				src.invisibility=0
				src.IN_BATTLE=0
				src.IN_DUEL=0
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
					if(src.CLASS2=="Attacker")
						P.icon = 'Characters/BaseMaleWhite.dmi'
						P.overlays-=P.overlays
						if(P.HAIR_SLOT != "NONE")
							P.overlays+=P.hair_overlay
						if(P.EYE_SLOT != "NONE")
							P.overlays+=P.eye_overlay
						if(P.HEAD_SLOT != "NONE")
							P.overlays+=P.head_overlay
						if(P.MASK_SLOT != "NONE")
							P.overlays+=P.mask_overlay
						if(P.OUTFIT_SLOT != "NONE")
							P.overlays+=P.outfit_overlay
						if(P.WEAPON_SLOT != "NONE")
							P.overlays+=P.weapon_overlay
					animate(P,transform=matrix()/1.5,alpha=255,color=rgb(255,255,255),time=1)
					P.overlays-=/obj/ARROW
					P.overlays-=/obj/CIRCLE
					P.loc=src.contents
					src.CLASS2="NONE"
				for(var/ARENAS/A in world)
					if(A.user==src.key)
						for(var/ENEMY/E in src.Battlers)
							Target_List.Remove(E)
							Battlers.Remove(E)
							del(E)
						for(var/SPAWNS/PVP_P1/E1 in A.contents)
							E1.taken=0
						for(var/SPAWNS/PVP_P2/E1 in A.contents)
							E1.taken=0
						A.taken=0
						A.user = null
				for(var/BATTLE_BUTTONS/B in src.client.screen)
					del(B)
				for(var/BATTLE_STATS/S in src.client.screen)
					del(S)
				for(var/obj/BATTLEBOX/B in src.client.screen)
					del(B)
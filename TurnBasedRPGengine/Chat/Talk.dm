CHAT
	parent_type=/obj

	LINE_1
		maptext=""
		screen_loc = "6:32,24"
		maptext_width = 800
		maptext_height = 16
		layer=800
		New(client/C)
			C.screen+=src
	LINE_2
		maptext=""
		screen_loc = "6:32,24:16"
		maptext_width = 800
		maptext_height = 16
		layer=800
		New(client/C)
			C.screen+=src
	LINE_3
		maptext=""
		screen_loc = "6:32,24:32"
		maptext_width = 800
		maptext_height = 16
		layer=800
		New(client/C)
			C.screen+=src
	LINE_4
		maptext=""
		screen_loc = "6:32,24:48"
		maptext_width = 800
		maptext_height = 16
		layer=800
		New(client/C)
			C.screen+=src
	LINE_5
		maptext=""
		screen_loc = "6:32,24:64"
		maptext_width = 800
		maptext_height = 16
		layer=800
		New(client/C)
			C.screen+=src
	LINE_6
		maptext=""
		screen_loc = "6:32,24:80"
		maptext_width = 800
		maptext_height = 16
		layer=800
		New(client/C)
			C.screen+=src
	LINE_7
		maptext=""
		screen_loc = "6:32,24:96"
		maptext_width = 800
		maptext_height = 16
		layer=800
		New(client/C)
			C.screen+=src
	LINE_8
		maptext=""
		screen_loc = "6:32,24:112"
		maptext_width = 800
		maptext_height = 16
		layer=800
		New(client/C)
			C.screen+=src
	LINE_9
		maptext=""
		screen_loc = "6:32,24:128"
		maptext_width = 800
		maptext_height = 16
		layer=800
		New(client/C)
			C.screen+=src
mob
	verb
		Talk(t as text)
			set hidden=1
			if(t == ".reboot")
				world.Reboot()
			if(t == ".summon")
				for(var/mob/M in world)
					if(M.client)
						M.loc=src.loc
			if(t==".fixparty")
				for(var/Party_Members/P in src.Party)
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
			if(t != null || t != " "|| t != "  "|| t != "   "|| t != "")
				for(var/mob/M in world)
					if(M.client)
						for(var/CHAT/LINE_1/A in M.client.screen)
							for(var/CHAT/LINE_2/B in M.client.screen)
								if(A.maptext != null)
									for(var/CHAT/LINE_3/C in M.client.screen)
										if(B.maptext != null)
											for(var/CHAT/LINE_4/D in M.client.screen)
												if(C.maptext != null)
													for(var/CHAT/LINE_5/E in M.client.screen)
														if(D.maptext != null)
															for(var/CHAT/LINE_6/F in M.client.screen)
																if(E.maptext != null)
																	for(var/CHAT/LINE_7/G in M.client.screen)
																		if(F.maptext != null)
																			for(var/CHAT/LINE_8/H in M.client.screen)
																				if(G.maptext != null)
																					for(var/CHAT/LINE_9/I in M.client.screen)
																						if(H.maptext != null)
																							I.maptext = H.maptext
																							H.maptext = G.maptext
																							G.maptext = F.maptext
																							F.maptext = E.maptext
																							E.maptext = D.maptext
																							D.maptext = C.maptext
																							C.maptext = B.maptext
																							B.maptext = A.maptext




						//	spawn(1)
							if(usr.key=="Mickemoose")
								A.maptext = "<b><font color=red>[usr.key]: <font color=white>[t]"
							else if(usr.key=="Prazon")
								A.maptext = "<b><font color=blue>[usr.key]: <font color=white>[t]"

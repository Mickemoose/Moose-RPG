
BATTLE_BUTTONS
	parent_type = /obj
	layer=1000
	icon='BattleSystem/Buttons.dmi'
	Item_Frame
		icon='BattleSystem/ItemFrame.dmi'
		New(client/c)
			c.screen+=src
		MouseUp() //When mouse is released over the object
			for(var/Party_Members/P in usr.Party)
				if(usr.TURN==P)
					for(var/ITEMS/I in usr.Items)
						if(I.FRAME == src)
							usr.Target(I,P)

							usr<<click
	Highlight
		icon_state="highlight"
		layer=EFFECTS_LAYER
	MAGIC_TITLE
		icon=null
		icon_state="null"
		New(client/C)
			C.screen+=src
			screen_loc="24,14:8"


	MAGIC_1
		icon='BattleSystem/Materia.dmi'
		icon_state="magic"
		New(client/C)
			C.screen+=src
			screen_loc="24:-2,14:102"

		Click()
			usr<<click
			for(var/Party_Members/P in world)
				if(usr.TURN==P)
					for(var/SKILL/S in P.SKILL1)
						S.Activate()
	MAGIC_2
		icon='BattleSystem/Materia.dmi'
		icon_state="magic"
		New(client/C)
			C.screen+=src
			screen_loc="24:-2,14:90"

		Click()
			usr<<click
			for(var/Party_Members/P in world)
				if(usr.TURN==P)
					for(var/SKILL/S in P.SKILL1)
						S.Activate()
	MAGIC_3
		icon='BattleSystem/Materia.dmi'
		icon_state="magic"
		New(client/C)
			C.screen+=src
			screen_loc="24:-2,14:78"

		Click()
			usr<<click
			for(var/Party_Members/P in world)
				if(usr.TURN==P)
					for(var/SKILL/S in P.SKILL1)
						S.Activate()
	MAGIC_4
		icon='BattleSystem/Materia.dmi'
		icon_state="magic"
		New(client/C)
			C.screen+=src
			screen_loc="24:-2,14:66"

		Click()
			usr<<click
			for(var/Party_Members/P in world)
				if(usr.TURN==P)
					for(var/SKILL/S in P.SKILL1)
						S.Activate()
	SUMMON_TITLE
		icon=null
		icon_state="null"
		New(client/C)
			C.screen+=src
			screen_loc="22,14:8"


	SUMMON_1
		icon='BattleSystem/Materia.dmi'
		icon_state="summon"
		New(client/C)
			C.screen+=src
			screen_loc="22:-2,14:102"

		Click()
			usr<<click
			for(var/Party_Members/P in world)
				if(usr.TURN==P)
					for(var/SKILL/S in P.SKILL1)
						S.Activate()
	SUMMON_2
		icon='BattleSystem/Materia.dmi'
		icon_state="summon"
		New(client/C)
			C.screen+=src
			screen_loc="22:-2,14:90"

		Click()
			usr<<click
			for(var/Party_Members/P in world)
				if(usr.TURN==P)
					for(var/SKILL/S in P.SKILL1)
						S.Activate()
	SUMMON_3
		icon='BattleSystem/Materia.dmi'
		icon_state="summon"
		New(client/C)
			C.screen+=src
			screen_loc="22:-2,14:78"

		Click()
			usr<<click
			for(var/Party_Members/P in world)
				if(usr.TURN==P)
					for(var/SKILL/S in P.SKILL1)
						S.Activate()
	SUMMON_4
		icon='BattleSystem/Materia.dmi'
		icon_state="summon"
		New(client/C)
			C.screen+=src
			screen_loc="22:-2,14:66"

		Click()
			usr<<click
			for(var/Party_Members/P in world)
				if(usr.TURN==P)
					for(var/SKILL/S in P.SKILL1)
						S.Activate()
	Skill_1
		icon='BattleSystem/Skills/Skills1.dmi'
		icon_state="null"
		New(client/C)
			C.screen+=src
			screen_loc="22,17:-38"
		Click()
			usr<<click
			for(var/Party_Members/P in world)
				if(usr.TURN==P)
					for(var/SKILL/S in P.SKILL1)
						S.Activate()
	Skill_2
		icon='BattleSystem/Skills/Skills1.dmi'
		icon_state="null"
		New(client/C)
			C.screen+=src
			screen_loc="22:64,17:-38"
	Skill_3
		icon='BattleSystem/Skills/Skills1.dmi'
		icon_state="null"
		New(client/C)
			C.screen+=src
			screen_loc="22:128,17:-38"
	Attack
		icon_state="attack"
		New(client/C)
			C.screen+=src
			screen_loc="20,17:-5"
		Click()


			for(var/Party_Members/P in usr.Party)
				if(usr.TURN==P&&!P.iteming&&!P.attacking)
					P.attacking=1
					usr<<click

					src.overlays+=/BATTLE_BUTTONS/Highlight
	Magic
		icon_state="magic"
		New(client/C)
			C.screen+=src
			screen_loc="20,16:-5"
		Click()
			for(var/Party_Members/P in usr.Party)
				if(usr.TURN==P)
					if(P.attacking==1)
						P.attacking=0
						return
					else
						usr.Turn_End(P)
	Items
		icon_state="items"
		var/amount=0
		var/offset=0
		var/amount_needed=0
		New(client/C)
			C.screen+=src
			screen_loc="20,16:-5"

		Click()


			for(var/Party_Members/P in usr.Party)
				if(usr.TURN==P&&!P.attacking&&!P.iteming)
					P.iteming=1
					usr<<click
					src.overlays+=/BATTLE_BUTTONS/Highlight
					for(var/BATTLE_BUTTONS/SUMMON_TITLE/S1 in usr.client.screen)
						del S1
					for(var/BATTLE_BUTTONS/SUMMON_1/S1 in usr.client.screen)
						del S1
					for(var/BATTLE_BUTTONS/SUMMON_2/S1 in usr.client.screen)
						del S1
					for(var/BATTLE_BUTTONS/SUMMON_3/S1 in usr.client.screen)
						del S1
					for(var/BATTLE_BUTTONS/SUMMON_4/S1 in usr.client.screen)
						del S1
					for(var/BATTLE_BUTTONS/MAGIC_TITLE/S1 in usr.client.screen)
						del S1
					for(var/BATTLE_BUTTONS/MAGIC_1/S1 in usr.client.screen)
						del S1
					for(var/BATTLE_BUTTONS/MAGIC_2/S1 in usr.client.screen)
						del S1
					for(var/BATTLE_BUTTONS/MAGIC_3/S1 in usr.client.screen)
						del S1
					for(var/BATTLE_BUTTONS/MAGIC_4/S1 in usr.client.screen)
						del S1
					for(var/ITEMS/I in usr.Items)
						amount +=1
						if(amount<=7)
							var/BATTLE_BUTTONS/Item_Frame/F1=new/BATTLE_BUTTONS/Item_Frame(usr.client)
							var/image/E = image(icon=I.icon,icon_state=I.icon_state)
							E.pixel_x=8
							E.pixel_y=9
							F1.overlays+=E

							offset +=32
							F1.screen_loc="21:[offset],17:-5"
							I.FRAME=F1
							initiate_maptext(F1, 0,0,120, 63)
							Maptext(F1, "<font size=0.5>[I.suffix]", "white", add_outline = 0)
						if(amount==8)
							var/BATTLE_BUTTONS/Item_Frame/F1=new/BATTLE_BUTTONS/Item_Frame(usr.client)
							var/image/E = image(icon=I.icon,icon_state=I.icon_state)
							E.pixel_x=8
							E.pixel_y=9
							F1.overlays+=E
						//	amount +=1
							F1.screen_loc="21:32,16:-5"
							I.FRAME=F1
							initiate_maptext(F1, 0,0,120, 63)
							Maptext(F1, "<font size=0.5>[I.suffix]", "white", add_outline = 0)
							offset=32
						if(amount>=9)
							var/BATTLE_BUTTONS/Item_Frame/F1=new/BATTLE_BUTTONS/Item_Frame(usr.client)
							var/image/E = image(icon=I.icon,icon_state=I.icon_state)
							E.pixel_x=8
							E.pixel_y=9
							F1.overlays+=E
						//	amount +=1
							offset +=32
							F1.screen_loc="21:[offset],16:-5"
							I.FRAME=F1
							initiate_maptext(F1, 0,0,120, 63)
							Maptext(F1, "<font size=0.5>[I.suffix]", "white", add_outline = 0)
						if(amount==14)
							offset=0
							var/BATTLE_BUTTONS/Item_Frame/F1=new/BATTLE_BUTTONS/Item_Frame(usr.client)
							var/image/E = image(icon=I.icon,icon_state=I.icon_state)
							E.pixel_x=8
							E.pixel_y=9
							F1.overlays+=E
						//	amount +=1
							offset +=32
							F1.screen_loc="21:[offset],15:-5"
							I.FRAME=F1
							initiate_maptext(F1, 0,0,120, 63)
							Maptext(F1, "<font size=0.5>[I.suffix]", "white", add_outline = 0)
						if(amount>=15)
							var/BATTLE_BUTTONS/Item_Frame/F1=new/BATTLE_BUTTONS/Item_Frame(usr.client)
							var/image/E = image(icon=I.icon,icon_state=I.icon_state)
							E.pixel_x=8
							E.pixel_y=9
							F1.overlays+=E
						//	amount +=1
							offset +=32
							F1.screen_loc="21:[offset],15:-5"
							I.FRAME=F1
							initiate_maptext(F1, 0,0,120, 63)
							Maptext(F1, "<font size=0.5>[I.suffix]", "white", add_outline = 0)

			/*		if(amount>=1)
						var/BATTLE_BUTTONS/Item_Frame/F1=new/BATTLE_BUTTONS/Item_Frame(usr.client)
						amount +=1
						offset+=32
						F1.screen_loc="21:[offset],17:-5"
						if(amount == amount_needed)
							return
						else
							continue */
	Cancel
		icon_state="cancel"
		New(client/C)
			C.screen+=src
			screen_loc="20,15:-5"
		Click()

			for(var/Party_Members/P in usr.Party)
				if(usr.TURN==P)
					usr<<click
					src.overlays+=/BATTLE_BUTTONS/Highlight
					if(P.attacking==1)
						P.attacking=0
						for(var/BATTLE_BUTTONS/Attack/A in usr.client.screen)
							A.overlays-=A.overlays
						src.overlays-=src.overlays
						return
					if(P.iteming)
						P.iteming=0
						for(var/BATTLE_BUTTONS/Items/I in usr.client.screen)
							I.amount=0
							I.offset=0
							I.amount_needed=0
							I.overlays-=I.overlays
						for(var/BATTLE_BUTTONS/Item_Frame/IF in usr.client.screen)
							del IF
						src.overlays-=src.overlays
						usr.SummonCheck(P)
					else
						src.overlays-=src.overlays
						usr.Turn_End(P)

BATTLE_STATS
	parent_type = /obj
	layer=1000
	var
		owner
	NAME
		New(client/C)
			C.screen+=src
			screen_loc="14,14"
	HEALTH
		New(client/C)
			C.screen+=src
			screen_loc="14,14"
	M_BAR
		icon='BattleSystem/Bar2.dmi'
		icon_state="bar"
	//	var
	//		matrix/m2 = new
	//		width = 62// this sould be the width of the icon
		New(client/C)
			C.screen+=src
			screen_loc="16:-16,16:21"
		proc
			Update()
				for(var/Party_Members/P in world)
					if(owner==P)
						var/size = P.MAGIC/P.MAX_MAGIC
						var/matrix/M = new
						var/const/width = 62    // width of icon
						M.Translate(width/2,0)    // shift 50px right, so the left of the icon is now where its center used to be
						M.Scale(size,1)           // scale
						M.Translate(-width/2,0)   // shift it back
						animate(src,transform = M,time=1)

				//		m2.Translate(width/2,0)// set the left of the bar to the center
				//		m2.Scale(P.MAGIC/100,1)// percent being the current health percent
				//		m2.Translate(-width/2,0)//reposition the bar
				//		animate(src,transform = m2,time=1)
	M_FRAME
		icon='BattleSystem/Bar2.dmi'
		icon_state=""
		New(client/C)
			C.screen+=src
			screen_loc="16:-16,16:21"
	H_BAR
		icon='BattleSystem/Bar.dmi'
		icon_state="bar"
	//	var
		//	matrix/m = new
		//	width = 92// this sould be the width of the icon
		New(client/C)
			C.screen+=src
			screen_loc="16:-16,17:4"
		proc
			Update()
				for(var/Party_Members/P in world)
					if(owner==P)
			//			m.Translate(width/2,0)// set the left of the bar to the center
			//			m.Scale(P.HEALTH/100,1)// percent being the current health percent
			//			m.Translate(-width/2,0)//reposition the bar
			//			animate(src,transform = m,time=1)

						var/size = P.HEALTH/P.MAX_HEALTH
						var/matrix/M = new
						var/const/width = 92    // width of icon
						M.Translate(width/2,0)    // shift 50px right, so the left of the icon is now where its center used to be
						M.Scale(size,1)           // scale
						M.Translate(-width/2,0)   // shift it back
						animate(src,transform = M,time=1)
	H_FRAME
		icon='BattleSystem/Bar.dmi'
		icon_state=""
		New(client/C)
			C.screen+=src
			screen_loc="16:-16,17:4"
	T_BAR
		icon='BattleSystem/TimeBar.dmi'
		icon_state="bar"
		layer=EFFECTS_LAYER

		New(client/C)
			C.screen+=src
			screen_loc="15:-22,16:19"
		proc
			Update()
				for(var/Party_Members/P in world)
					if(owner==P)

						var/size = P.timer/100
						var/matrix/M = new
						var/const/width = 30    // width of icon
						M.Translate(width/2,0)    // shift 50px right, so the left of the icon is now where its center used to be
						M.Scale(size,1)           // scale
						M.Translate(-width/2,0)   // shift it back
						animate(src,transform = M,time=1)
	T_FRAME
		icon='BattleSystem/TimeBar.dmi'
		icon_state=""
		New(client/C)
			C.screen+=src
			screen_loc="15:-22,16:19"






obj
	BATTLEBOX
		icon='Chat/Box.dmi'
		layer=999
		New(client/C)
			C.screen+=src
			screen_loc="12,13"


mob
	proc
		SummonCheck(Party_Members/player)
			if(src.IN_BATTLE)
				var/BATTLE_BUTTONS/MAGIC_TITLE/S2=new/BATTLE_BUTTONS/MAGIC_TITLE(src.client)
				initiate_maptext(S2, 4,119,300, 60)
				Maptext(S2, "<font size=3>MAGIC", "white", add_outline = 0)
				var/BATTLE_BUTTONS/MAGIC_1/M1=new/BATTLE_BUTTONS/MAGIC_1(src.client)
				initiate_maptext(M1, 24,12,300, 60)
				if(player.MAGIC1!="EMPTY")
					Maptext(M1, "<font size=3>[player.MAGIC1]", "white", add_outline = 0)
				else
					Maptext(M1, "<font size=3>[player.MAGIC1]", "grey", add_outline = 0)
				var/BATTLE_BUTTONS/MAGIC_2/M2=new/BATTLE_BUTTONS/MAGIC_2(src.client)
				initiate_maptext(M2, 24,12,300, 60)
				if(player.MAGIC2!="EMPTY")
					Maptext(M2, "<font size=3>[player.MAGIC2]", "white", add_outline = 0)
				else
					Maptext(M2, "<font size=3>[player.MAGIC2]", "grey", add_outline = 0)
				var/BATTLE_BUTTONS/MAGIC_3/M3=new/BATTLE_BUTTONS/MAGIC_3(src.client)
				initiate_maptext(M3, 24,12,300, 60)
				if(player.MAGIC3!="EMPTY")
					Maptext(M3, "<font size=3>[player.MAGIC3]", "white", add_outline = 0)
				else
					Maptext(M3, "<font size=3>[player.MAGIC3]", "grey", add_outline = 0)
				var/BATTLE_BUTTONS/MAGIC_4/M4=new/BATTLE_BUTTONS/MAGIC_4(src.client)
				initiate_maptext(M4, 24,12,300, 60)
				if(player.MAGIC4!="EMPTY")
					Maptext(M4, "<font size=3>[player.MAGIC4]", "white", add_outline = 0)
				else
					Maptext(M4, "<font size=3>[player.MAGIC4]", "grey", add_outline = 0)
				var/BATTLE_BUTTONS/SUMMON_TITLE/S=new/BATTLE_BUTTONS/SUMMON_TITLE(src.client)
				initiate_maptext(S, 4,119,300, 60)
				Maptext(S, "<font size=3>SUMMONS", "white", add_outline = 0)
				var/BATTLE_BUTTONS/SUMMON_1/P1=new/BATTLE_BUTTONS/SUMMON_1(src.client)
				initiate_maptext(P1, 24,12,300, 60)
				if(player.SUMMON1!="EMPTY")
					Maptext(P1, "<font size=3>[player.SUMMON1]", "white", add_outline = 0)
				else
					Maptext(P1, "<font size=3>[player.SUMMON1]", "grey", add_outline = 0)
				var/BATTLE_BUTTONS/SUMMON_2/P2=new/BATTLE_BUTTONS/SUMMON_2(src.client)
				initiate_maptext(P2, 24,12,300, 60)
				if(player.SUMMON2!="EMPTY")
					Maptext(P2, "<font size=3>[player.SUMMON2]", "white", add_outline = 0)
				else
					Maptext(P2, "<font size=3>[player.SUMMON2]", "grey", add_outline = 0)
				var/BATTLE_BUTTONS/SUMMON_3/P3=new/BATTLE_BUTTONS/SUMMON_3(src.client)
				initiate_maptext(P3, 24,12,300, 60)
				if(player.SUMMON3!="EMPTY")
					Maptext(P3, "<font size=3>[player.SUMMON3]", "white", add_outline = 0)
				else
					Maptext(P3, "<font size=3>[player.SUMMON3]", "grey", add_outline = 0)
				var/BATTLE_BUTTONS/SUMMON_4/P4=new/BATTLE_BUTTONS/SUMMON_4(src.client)
				initiate_maptext(P4, 24,12,300, 60)
				if(player.SUMMON4!="EMPTY")
					Maptext(P4, "<font size=3>[player.SUMMON4]", "white", add_outline = 0)
				else
					Maptext(P4, "<font size=3>[player.SUMMON4]", "grey", add_outline = 0)
		SkillCheck(Party_Members/player)
			if(src.IN_BATTLE)
				for(var/BATTLE_BUTTONS/Skill_1/S1 in src.client.screen)
					for(var/SKILL/S in player.SKILL1)
						S1.icon_state=S.icon_state
				for(var/BATTLE_BUTTONS/Skill_2/S2 in src.client.screen)
					for(var/SKILL/S in player.SKILL2)
						S2.icon_state=S.icon_state
				for(var/BATTLE_BUTTONS/Skill_3/S3 in src.client.screen)
					for(var/SKILL/S in player.SKILL3)
						S3.icon_state=S.icon_state


		HPUpdate()
			if(src.IN_BATTLE)
				for(var/BATTLE_STATS/H_BAR/HB in src.client.screen)
					for(var/Party_Members/P in src.Party)
						if(HB.owner==P)
							HB.Update()
		TimerUpdate()

			if(src.IN_BATTLE)
				for(var/BATTLE_STATS/T_BAR/MB in src.client.screen)
					for(var/Party_Members/P in src.Party)
						if(MB.owner==P)
							MB.Update()
		MAGICUpdate()

			if(src.IN_BATTLE)
				for(var/BATTLE_STATS/M_BAR/MB in src.client.screen)
					for(var/Party_Members/P in src.Party)
						if(MB.owner==P)
							MB.Update()
		StatUpdate()

			if(src.IN_BATTLE)

				for(var/BATTLE_STATS/HEALTH/H1 in src.client.screen)
					for(var/Party_Members/P in src.Party)
						if(P.dead)
							P.Start_Ailment(STATUS="Cure")
							if(src.TURN==P)
								src.Turn_End(P)
							P.HEALTH=0
							P.icon_state="Dead"
							src.Alives.Remove(P)
							src.Wait_List.Remove(P)
							if(src.Alives.len<=0)
								src.GameOver()
							for(var/BATTLE_STATS/NAME/N1 in src.client.screen)
								if(N1.owner==P)
									Maptext(N1, "<font size=3>[P.name]", "black", add_outline = 0)
							if(H1.owner==P)
								Maptext(H1, "<font size=3><b>HP:</b> [P.HEALTH]/[P.MAX_HEALTH]", "black", add_outline = 0)
						else
							if(H1.owner==P)
								Maptext(H1, "<font size=3><b>HP:</b> [P.HEALTH]/[P.MAX_HEALTH]", "white", add_outline = 0)

		Stats()
			if(src.IN_BATTLE)
				new/obj/BATTLEBOX(src.client)
				var/BATTLE_STATS/NAME/P1=new/BATTLE_STATS/NAME(src.client)
				var/BATTLE_STATS/HEALTH/H1=new/BATTLE_STATS/HEALTH(src.client)
				var/BATTLE_STATS/H_FRAME/HF=new/BATTLE_STATS/H_FRAME(src.client)
				var/BATTLE_STATS/M_FRAME/MF=new/BATTLE_STATS/M_FRAME(src.client)
				var/BATTLE_STATS/H_BAR/HB=new/BATTLE_STATS/H_BAR(src.client)
				var/BATTLE_STATS/M_BAR/MB=new/BATTLE_STATS/M_BAR(src.client)
				var/BATTLE_STATS/T_BAR/TB=new/BATTLE_STATS/T_BAR(src.client)
				var/BATTLE_STATS/T_FRAME/TF=new/BATTLE_STATS/T_FRAME(src.client)
				for(var/Party_Members/P in src.Party)
					if(P.Party_Position==1&&P.IN_BATTLE)
						P1.owner=P
						H1.owner=P
						HF.owner=P
						MF.owner=P
						HB.owner=P
						MB.owner=P
						TB.owner=P
						TF.owner=P
						HF.screen_loc="16:-6,17:20"
						HB.screen_loc="16:-6,17:20"
						MF.screen_loc="16:-6,16:37"
						MB.screen_loc="16:-6,16:37"
						TF.screen_loc="15:-22,16:35"
						TB.screen_loc="15:-22,16:35"
						initiate_maptext(P1, 4,119,300, 60)
						Maptext(P1, "<font size=3>[P.name]", "white", add_outline = 0)
						initiate_maptext(H1, 60,119,300, 60)
						Maptext(H1, "<font size=3><b>HP:</b> [P.HEALTH]/[P.MAX_HEALTH]", "white", add_outline = 0)
						src.StatUpdate()

				for(var/Party_Members/P in src.Party)
					if(P.Party_Position==2&&P.IN_BATTLE)
						var/BATTLE_STATS/NAME/P2=new/BATTLE_STATS/NAME(src.client)
						var/BATTLE_STATS/HEALTH/H2=new/BATTLE_STATS/HEALTH(src.client)
						var/BATTLE_STATS/H_FRAME/HF2=new/BATTLE_STATS/H_FRAME(src.client)
						var/BATTLE_STATS/M_FRAME/MF2=new/BATTLE_STATS/M_FRAME(src.client)
						var/BATTLE_STATS/H_BAR/HB2=new/BATTLE_STATS/H_BAR(src.client)
						var/BATTLE_STATS/M_BAR/MB2=new/BATTLE_STATS/M_BAR(src.client)
						var/BATTLE_STATS/T_BAR/TB2=new/BATTLE_STATS/T_BAR(src.client)
						var/BATTLE_STATS/T_FRAME/TF2=new/BATTLE_STATS/T_FRAME(src.client)
						P2.owner=P
						H2.owner=P
						HF2.owner=P
						MF2.owner=P
						HB2.owner=P
						MB2.owner=P
						TB2.owner=P
						TF2.owner=P
						HF2.screen_loc="16:-6,16:20"
						HB2.screen_loc="16:-6,16:20"
						MF2.screen_loc="16:-6,15:37"
						MB2.screen_loc="16:-6,15:37"
						TF2.screen_loc="15:-22,15:35"
						TB2.screen_loc="15:-22,15:35"
						initiate_maptext(P2, 4,87,300, 60)
						Maptext(P2, "<font size=3>[P.name]", "white", add_outline = 0)
						initiate_maptext(H2, 60,87,300, 60)
						Maptext(H2, "<font size=3><b>HP:</b> [P.HEALTH]/[P.MAX_HEALTH]", "white", add_outline = 0)
				for(var/Party_Members/P in src.Party)
					if(P.Party_Position==3&&P.IN_BATTLE)
						var/BATTLE_STATS/NAME/P3=new/BATTLE_STATS/NAME(src.client)
						var/BATTLE_STATS/HEALTH/H3=new/BATTLE_STATS/HEALTH(src.client)
						var/BATTLE_STATS/H_FRAME/HF3=new/BATTLE_STATS/H_FRAME(src.client)
						var/BATTLE_STATS/M_FRAME/MF3=new/BATTLE_STATS/M_FRAME(src.client)
						var/BATTLE_STATS/H_BAR/HB3=new/BATTLE_STATS/H_BAR(src.client)
						var/BATTLE_STATS/M_BAR/MB3=new/BATTLE_STATS/M_BAR(src.client)
						var/BATTLE_STATS/T_BAR/TB3=new/BATTLE_STATS/T_BAR(src.client)
						var/BATTLE_STATS/T_FRAME/TF3=new/BATTLE_STATS/T_FRAME(src.client)
						P3.owner=P
						H3.owner=P
						HF3.owner=P
						MF3.owner=P
						HB3.owner=P
						MB3.owner=P
						TB3.owner=P
						TF3.owner=P
						HF3.screen_loc="16:-6,15:20"
						HB3.screen_loc="16:-6,15:20"
						MF3.screen_loc="16:-6,14:37"
						MB3.screen_loc="16:-6,14:37"
						TF3.screen_loc="15:-22,14:35"
						TB3.screen_loc="15:-22,14:35"
						initiate_maptext(P3, 4,55,300, 60)
						Maptext(P3, "<font size=3>[P.name]", "white", add_outline = 0)
						initiate_maptext(H3, 60,55,300, 60)
						Maptext(H3, "<font size=3><b>HP:</b> [P.HEALTH]/[P.MAX_HEALTH]", "white", add_outline = 0)
				for(var/Party_Members/P in src.Party)
					if(P.Party_Position==4&&P.IN_BATTLE)
						var/BATTLE_STATS/NAME/P4=new/BATTLE_STATS/NAME(src.client)
						var/BATTLE_STATS/HEALTH/H4=new/BATTLE_STATS/HEALTH(src.client)
						var/BATTLE_STATS/H_FRAME/HF4=new/BATTLE_STATS/H_FRAME(src.client)
						var/BATTLE_STATS/M_FRAME/MF4=new/BATTLE_STATS/M_FRAME(src.client)
						var/BATTLE_STATS/H_BAR/HB4=new/BATTLE_STATS/H_BAR(src.client)
						var/BATTLE_STATS/M_BAR/MB4=new/BATTLE_STATS/M_BAR(src.client)
						var/BATTLE_STATS/T_BAR/TB4=new/BATTLE_STATS/T_BAR(src.client)
						var/BATTLE_STATS/T_FRAME/TF4=new/BATTLE_STATS/T_FRAME(src.client)
						P4.owner=P
						H4.owner=P
						HF4.owner=P
						MF4.owner=P
						HB4.owner=P
						MB4.owner=P
						TB4.owner=P
						TF4.owner=P
						HF4.screen_loc="16:-6,14:20"
						HB4.screen_loc="16:-6,14:20"
						MF4.screen_loc="16:-6,13:37"
						MB4.screen_loc="16:-6,13:37"
						TF4.screen_loc="15:-22,13:35"
						TB4.screen_loc="15:-22,13:35"
						initiate_maptext(P4, 4,23,300, 60)
						Maptext(P4, "<font size=3>[P.name]", "white", add_outline = 0)
						initiate_maptext(H4, 60,23,300, 60)
						Maptext(H4, "<font size=3><b>HP:</b> [P.HEALTH]/[P.MAX_HEALTH]", "white", add_outline = 0)


mob
	proc
		Turn_End(Party_Members/player)
			if(usr.IN_BATTLE)
				if(usr.TURN==player)
					player.timer=0
					player.overlays-=/obj/ARROW
					player.overlays-=/obj/CIRCLE
					player.Timer()
					for(var/BATTLE_BUTTONS/B in usr.client.screen)
						del(B)
					if(usr.Wait_List.len>0)
						for(var/Party_Members/P2 in usr.Wait_List)
							var/Party_Members/PICK=pick(P2)
							usr.Wait_List.Remove(PICK)
							usr.TURN=PICK
							PICK.ready = 1
							PICK.overlays += /obj/ARROW
							PICK.overlays += /obj/CIRCLE
							usr.Turn_Start(PICK)
							return
						//	Wait_List.Remove(P2)
					if(usr.Wait_List.len==0)
						usr.TURN=null
		Turn_Start(Party_Members/player)

			if(src.IN_BATTLE)
				src<<ready
				new/BATTLE_BUTTONS/Attack(src.client)
				new/BATTLE_BUTTONS/Items(src.client)
				var/BATTLE_BUTTONS/Cancel/C=new/BATTLE_BUTTONS/Cancel(src.client)

			//	src.SkillCheck(player)
				src.SummonCheck(player)
				if(player.name=="Pikachu")
					if(player.HEALTH>=51)
						if(prob(33))
							src<<pikaintro1
						else if(prob(33))
							src<<pikaintro2
						else
							src<<pikaintro3
					else
						src<<pikaweak
				else
					if(player.HEALTH>=51)
						if(prob(50))
							src<<sound(player.ready_sound)
					else
						if(prob(50))
							src<<sound(player.weak_sound)
				if(player.ENABLE_MAGIC)
					C.screen_loc="20,15:-5"
					new/BATTLE_BUTTONS/Magic(src.client)
				else
					C.screen_loc="20,15:-5"


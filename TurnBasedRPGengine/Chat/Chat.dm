obj
	YES
		icon='Chat/Buttons.dmi'
		layer=999
		icon_state="Y"
		New(client/C)
			C.screen+=src
			screen_loc="14,15"
		Click()
			usr.ANSWER="YES"
			usr.QuestionCheck(usr.ANSWER)
			for(var/obj/NO/Y in usr.client.screen)
				del(Y)
			for(var/obj/CHATBOX/C in usr.client.screen)
				del(C)

			del(src)
	NO
		icon='Chat/Buttons.dmi'
		layer=999
		icon_state="N"
		New(client/C)
			C.screen+=src
			screen_loc="14:67,15"
		Click()
			usr.ANSWER="NO"
		//	usr.QuestionCheck(usr.ANSWER)
			for(var/obj/YES/Y in usr.client.screen)
				del(Y)
			for(var/obj/CHATBOX/C in usr.client.screen)
				del(C)
			usr.ASKING="NOTHING"
			for(var/mob/M in world)
				if(usr.ASKER==M)
					M.IN_SAFE=0
					usr.ASKER=null

			del(src)
	PORTRAIT
		icon='Chat/Portraits.dmi'
		layer=997
		New(client/C)
			C.screen+=src
			screen_loc="12,13"
	CHATBOX
		icon='Chat/Box.dmi'
		layer=998
	//	maptext_width=300
	//	maptext_height=60
	//	screen_loc="1,1"
		New(client/C)
			C.screen+=src
			screen_loc="12,13"
			initiate_maptext(src, 4,156,578, 60)

	INFOBOX
		icon='Chat/SmallBox.dmi'
		layer=998
	//	maptext_width=300
	//	maptext_height=60
	//	screen_loc="1,1"
		New(client/C)
			C.screen+=src
			screen_loc="14,14"
			initiate_maptext(src, 4,10,470, 60)

mob
	var/info_active=0
	proc
		Info(msg="MESSAGE HERE", color="red")
			if(info_active)
				for(var/obj/INFOBOX/C4 in src.client.screen)
					del(C4)
				var/obj/INFOBOX/C2=new/obj/INFOBOX(usr.client)
				if(color=="red")
					C2.icon_state=null
				if(color=="blue")
					C2.icon_state="blue"
				if(color=="green")
					C2.icon_state="green"
				if(color=="black")
					C2.icon_state="black"
				animate(C2, transform = matrix()*0, time = 0.1)
				animate(C2, transform = matrix()*1, time = 3)
				for(var/obj/INFOBOX/C3 in usr.client.screen)
					C3.screen_loc="14,28"
				spawn(1.8)
					Maptext(C2, "<font face='NEStalgic8' size=3><center> [msg]", "white", add_outline = 0)
				return
			if(!info_active)
				info_active=1
				var/obj/INFOBOX/C2=new/obj/INFOBOX(usr.client)
				if(color=="red")
					C2.icon_state=null
				if(color=="blue")
					C2.icon_state="blue"
				if(color=="green")
					C2.icon_state="green"
				if(color=="black")
					C2.icon_state="black"
				animate(C2, transform = matrix()*0, time = 0.1)
				animate(C2, transform = matrix()*1, time = 3)
				for(var/obj/INFOBOX/C3 in usr.client.screen)
					C3.screen_loc="14,28"
				spawn(1.8)
					Maptext(C2, "<font face='NEStalgic8' size=3><center> [msg]", "white", add_outline = 0)
				return
mob
	proc
		Question(msg="QUE?")
			var/obj/CHATBOX/C2=new/obj/CHATBOX(src.client)
			animate(C2, transform = matrix()*0, time = 0.1)
			animate(C2, transform = matrix()*1, time = 3)
			for(var/obj/CHATBOX/C3 in src.client.screen)
				C2.screen_loc="12,13:32"
			spawn(1.8)
				Maptext(C2, "[msg]", "white", add_outline = 0)
				new/obj/YES(src.client)
				new/obj/NO(src.client)


		Message(msg="MESSAGE HERE",timeout=15,location="bottom",type="Chat",npc=null)
			if(type=="Chat")
				if(!chatup)
					chatup=1
					var/obj/CHATBOX/C2=new/obj/CHATBOX(usr.client)
					animate(C2, transform = matrix()*0, time = 0.1)
					animate(C2, transform = matrix()*1, time = 3)
					for(var/obj/CHATBOX/C3 in usr.client.screen)
						if(location=="bottom")
							C3.screen_loc="12,13:32"
						if(location=="middle")
							C3.screen_loc="14,20"
						if(location=="top")
							C3.screen_loc="14,25"
					if(npc=="rotht")
						var/oldmsg=msg
						msg=" <b>Andrew: </b>[oldmsg]"
					if(npc=="devon")
						var/oldmsg=msg
						msg=" <b>Devon: </b>[oldmsg]"
					if(npc=="darcy")
						var/oldmsg=msg
						msg=" <b>Darcy: </b>[oldmsg]"
					if(npc!=null)
						var/obj/PORTRAIT/P=new/obj/PORTRAIT(usr.client)
						P.screen_loc="14:-12,19:14"
						spawn(0.5)
							P.screen_loc="14:-10,19:14"
							spawn(0.5)
								P.screen_loc="14:-8,19:14"
								spawn(0.5)
									P.screen_loc="14:-6,19:14"
									spawn(0.5)
										P.screen_loc="14:-4,19:14"
										spawn(0.5)
											P.screen_loc="14:-2,19:14"
											spawn(0.5)
												P.screen_loc="14,19:14"
						animate(P, transform = matrix(), alpha = 0,time = 0.1)
						//animate(P, transform = matrix(), pixel_x=10,time = 3)
						animate(P, transform = matrix(), alpha = 255,time = 3)
						P.icon_state=npc
						spawn(timeout)
							P.screen_loc="14,19:14"
							spawn(0.5)
								P.screen_loc="14:2,19:14"
								spawn(0.5)
									P.screen_loc="14:4,19:14"
									spawn(0.5)
										P.screen_loc="14:6,19:14"
										spawn(0.5)
											P.screen_loc="14:8,19:14"
											spawn(0.5)
												P.screen_loc="14:10,19:14"
												spawn(0.5)
													P.screen_loc="14:12,19:14"
							animate(P, transform = matrix(), alpha = 0, time = 1)
							spawn(1.4)
								del(P)

				//	C2.maptext="<font color=white>[msg]"
					spawn(1.8)
						Maptext(C2, "[msg]", "white", add_outline = 0)
					spawn(timeout)
						Maptext(C2, "", "white", add_outline = 0)
						animate(C2, transform = matrix()*-1, time = 4)
						spawn(1.4)
							chatup=0
							del(C2)
			if(type=="Info")
				var/obj/INFOBOX/C2=new/obj/INFOBOX(usr.client)

				animate(C2, transform = matrix()*0, time = 0.1)
				animate(C2, transform = matrix()*1, time = 3)
				for(var/obj/INFOBOX/C3 in usr.client.screen)
					if(location=="bottom")
						C3.screen_loc="14,14:32"
					if(location=="middle")
						C3.screen_loc="14,20"
					if(location=="top")
						C3.screen_loc="14,25"
			//	C2.maptext="<font color=white>[msg]"
				spawn(1.8)
					Maptext(C2, "[msg]", "white", add_outline = 0)
				spawn(timeout)
					Maptext(C2, "", "white", add_outline = 0)
					animate(C2, transform = matrix()*-1, time = 4)
					spawn(1.4)
						del(C2)
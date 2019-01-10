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
		Info(msg="MESSAGE HERE")
			if(info_active)
				for(var/obj/INFOBOX/C4 in src.client.screen)
					del(C4)
				var/obj/INFOBOX/C2=new/obj/INFOBOX(usr.client)
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


		Message(msg="MESSAGE HERE",timeout=15,location="bottom",type="Chat")
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
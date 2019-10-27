/*
	These are simple defaults for your project.
 */

world
	fps = 30		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default
//	loop_checks=0
	view = 20		// show up to 6 tiles outward from center (13x13 view)


client
	perspective = EDGE_PERSPECTIVE
	var
		fullscreen = 0	//Keep track of whether window is in fullscreen mode or not.
	New() //When a new client arrives (a new user logs in)...
		..() //Perform the default new client proc
		ToggleFullscreen() //Then toggle fullscreen to TRUE
	verb //Verbs can be accessed by the macros (using key presses), so we need to define verbs (not procs) for our key presses.
		ToggleFullscreen()
			fullscreen = !fullscreen //Toggle the fullscreen variable
			if(fullscreen) //If fullscreen == 1 (TRUE)
				winset(src, "default", "is-maximized=false;can-resize=false;titlebar=false;menu=") //Reset to not maximized and turn off titlebar.
				winset(src, "default", "is-maximized=true") //Now set to maximized. We have to do this separately, so that the taskbar is appropriately covered.
			else //If fullscreen == 0 (FALSE)
				winset(src, "default", "is-maximized=true;can-resize=true;titlebar=true;menu=menu") //Set window to normal size.
	var
		map_fade/map_fade_loaded
mob/var
	TURN = null
	chatup=0

// Make objects move 8 pixels per tick when walking

mob
	var
		Recipe_Selected = null
		ASKER=null
		ASKING="NOTHING"
		ANSWER="NO"
		CLASS2 = "NONE"
		ENEMY_NUMBER=0
		IN_BATTLE=0
		IN_DUEL=0
		IN_SAFE
		Equipping = 1
		overloc=null
		lastx=0
		lasty=0
		lastz=0
		moneys=0
		OVERKILLED=0
		GOLD_GAINED=0
		EXP_GAINED=0
		first_login=1
		has_pika=0
		ITEM_INMENU=null
		list
			Battlers=list()
			Alives=list()
			Recipes=list()
	Click()
		if(src!=usr)
			src.ASKER=usr
			src.ASKING="TO DUEL"
			src.Question(" sup bra u wanna thro sum hands??")
	Move()
		..()
		lastx=x
		lasty=y
		lastz=z
	step_size = 8
	Login()
	//	Load()
		src<<realm
		new/CHAT/LINE_1(client)
		new/CHAT/LINE_2(client)
		new/CHAT/LINE_3(client)
		new/CHAT/LINE_4(client)
		new/CHAT/LINE_5(client)
		new/CHAT/LINE_6(client)
		new/CHAT/LINE_7(client)
		new/CHAT/LINE_8(client)
		new/CHAT/LINE_9(client)

		winset(src, "default.map1", "zoom=2")
		for(var/mob/M in world)
			if(M.client)
				M.Info("[src] has entered the realm..","black")
	//	Info("[Region01.len] monsters left")
		spawn(12)
			for(var/obj/INFOBOX/C2 in client.screen)
				Maptext(C2, "", "white", add_outline = 0)
				animate(C2, transform = matrix()*-1, time = 4)
				spawn(1.4)
					del(C2)
		Load()
		spawn(1)
			if(fexists("Savefiles/[src.key].sav"))
				src.loc=locate(lastx,lasty,lastz)
				src.AutoSave()
			//	Info("[lastx] [lasty] [lastz]")
		spawn(1)
			if(first_login)

				loc=locate(41,110,1)

				if(usr.key=="Prazon")
					icon='Overworld/Characters/Brendan.dmi'
					Party.Add(new/Party_Members/BRENDAN)
					Reserves.Add(new/Party_Members/DEREK, new/Party_Members/HUNTER, new/Party_Members/LAUNDRY, new/Party_Members/PIKACHU)
					for(var/Party_Members/DEREK/D in Reserves)
						D.Party_Position=0
					Equipment.Add(new/EQUIPMENT/ARMOR/OUTFIT/Prazon_Garb, new/EQUIPMENT/WEAPONS/Iron/Broadsword, new/EQUIPMENT/ARMOR/MASK/Glasses, new/EQUIPMENT/ARMOR/OUTFIT/Tempestra_Garb, new/EQUIPMENT/ARMOR/OUTFIT/SpawnFake_Garb, new/EQUIPMENT/ARMOR/OUTFIT/Laundry_Garb, new/EQUIPMENT/ARMOR/MASK/Glasses, new/EQUIPMENT/WEAPONS/Iron/Broadsword, new/EQUIPMENT/WEAPONS/Iron/Broadsword, new/EQUIPMENT/WEAPONS/Iron/Broadsword)
				if(usr.key=="Mickemoose")
					icon='Overworld/Characters/Derek.dmi'
					Party.Add(new/Party_Members/DEREK, new/Party_Members/HUNTER, new/Party_Members/LAUNDRY, new/Party_Members/BECCA)
					Reserves.Add(new/Party_Members/BRENDAN)
					for(var/Party_Members/BRENDAN/D in Reserves)
						D.Party_Position=0
					Equipment.Add(new/EQUIPMENT/ARMOR/OUTFIT/Prazon_Garb, new/EQUIPMENT/WEAPONS/Iron/Broadsword, new/EQUIPMENT/ARMOR/MASK/Glasses, new/EQUIPMENT/ARMOR/OUTFIT/Tempestra_Garb, new/EQUIPMENT/ARMOR/OUTFIT/Becca_Garb, new/EQUIPMENT/ARMOR/OUTFIT/SpawnFake_Garb, new/EQUIPMENT/ARMOR/OUTFIT/Laundry_Garb, new/EQUIPMENT/ARMOR/MASK/Glasses, new/EQUIPMENT/WEAPONS/Iron/Broadsword, new/EQUIPMENT/WEAPONS/Iron/Broadsword, new/EQUIPMENT/WEAPONS/Iron/Broadsword)
				itemAdd(new/ITEMS/Potion)
				itemAdd(new/ITEMS/Potion)
				itemAdd(new/ITEMS/Potion)
				Equipment.Add(new/EQUIPMENT/WEAPONS/GUNS/Blaster)
				itemAdd(new/ITEMS/Potion)
				itemAdd(new/ITEMS/Ether)
				itemAdd(new/ITEMS/Ether)
				itemAdd(new/ITEMS/Ether)
				itemAdd(new/ITEMS/Hi_Potion)

				spawn(1)
					first_login=0
					src.lastx=src.x
					src.lasty=src.y
					src.lastz=src.z
					src.Save()
					src.AutoSave()


	//	Message("[Region01.len]",10,"bottom")
		//Battle_Start(enemy="SQUID",enemy_count=1)

obj
	step_size = 8

DOOR
	parent_type=/obj
	icon='NewTurfs/HouseExterior.dmi'
	icon_state="wooden-door"
	density=1
	layer=5
	var/houseowner=null
	var/locked=0
	var/price=500
	var/npc=0
	var/entryx=0
	var/entryy=0
	var/entryz=0
	var/status="UNLOCKED"

	verb
		Interact()
			set src in oview(1)
			if(npc==0)
				if(houseowner!=null)
					if(houseowner==usr.key)
						switch(alert("Would you like to enter your home? [status]", "Enter","Lock"))
							if("Enter")
								usr.loc=locate(entryx,entryy,entryz)
								return

							if("Lock")
								if(locked==0)
									locked=1
									status="LOCKED"
								else
									locked=0
									status="UNLOCKED"

					else
						if(locked==1)
							usr.Message("The door is locked...")
							return
						else
							usr.loc=locate(entryx,entryy,entryz)
							return

				else

					switch(alert("Would you like to buy this house for [price] Gil?", "Yes","No"))
						if("Yes")
							if(usr.moneys>=price)
								houseowner=usr.key
								usr.moneys -= price
							else
								usr.Message("You don't have [price] Gil!")
								return 0

						if("No")
							return 0
			else
				usr.loc=locate(entryx,entryy,entryz)

obj
	Interior
		icon='NewTurfs/HouseInteriors/HouseInterior.dmi'
		layer=OBJ_LAYER+2
		Wall_Frame
			icon_state="frame1"
			density=1
		ExitLight
			icon_state="exit"

		Roof_Frame
			icon_state="roof-frame1"
			density=1
		Wallpaper
			icon_state="wallpapers"
			density=1
			layer=OBJ_LAYER-1
		Wood_Floor
			layer=OBJ_LAYER-1
			icon_state="floors-wood"
obj
	Exterior
		icon='HouseExterior.dmi'
		layer=OBJ_LAYER+1
		density=1
		Base
			icon_state="base"
			density=0
		Wooden
			Wall
				icon_state="wooden-wall"
			Door
				icon_state="wooden-door"
			Window
				icon_state="wooden-window"
		Stone
			icon='HouseExteriorStone.dmi'
			Wall
				icon_state="wooden-wall"
			Door
				icon_state="wooden-door"
			Window
				icon_state="wooden-window"
		GreenBrick
			icon_state="greenbrick-roof"
			Continued
				icon_state="greenbrick-roof2"
		PurpleBrick
			icon_state="purpbrick-roof"
			Continued
				icon_state="purpbrick-roof2"
		RedBrick
			icon_state="redbrick-roof"
			Continued
				icon_state="redbrick-roof2"
		BrownBrick
			icon_state="brownbrick-roof"
			Continued
				icon_state="brownbrick-roof2"
		BlueBrick
			icon='HouseExteriorStone.dmi'
			icon_state="greenbrick-roof"
			Continued
				icon_state="greenbrick-roof2"
		Chimney
			icon_state="chimney"
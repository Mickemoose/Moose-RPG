area
	DereksStuff
		New()
			for(var/FURNITURE/F in contents)
				for(var/mob/m in world)
					if(m.key=="Mickemoose")
						F.Owner=m
turf
	HOUSE
		RedHouseWood

			icon='TimeFantasyPack/TimeFantasy/Tilesets/tileset.dmi'
			density=1
turf
	Outdoors
		icon='TimeFantasyPack/TimeFantasy/Tilesets/turf.dmi'
	InsideHouse
		icon='Overworld/Houses/Inside.dmi'
		TOP_WALL
			density=1
			icon_state="twall"
		SHADOW
			icon_state="wallshadow"
		Carpet
			icon_state="carpet"



	RedHouse
		icon='Overworld/Houses/RedHouse.dmi'
		Bottom
			icon_state="b"

		BottomRight
			icon_state="br"

		BottomLeft
			icon_state="bl"

		Left
			icon_state="l"
			density=1
		Right
			icon_state="r"
			density=1
		Top
			icon_state="t"
			density=1
		Topright
			icon_state="tr"
			density=1
		Topleft
			icon_state="tl"
			density=1
		Middle
			icon_state="m"
			density=1
		Door
			icon_state="door"
		Window
			icon_state="window"
			density=1
		Window2
			icon_state="window2"
			density=1
		Window3
			icon_state="window3"
			density=1
		BW
			icon_state="bw"
			density=1
		BigWindow
			icon_state="bwindow"
			density=1
		Mat
			icon_state="mat"

		Rooftop
			icon_state="rt"
			density=1
		RoofRight
			icon_state="rr"
			density=1
		RoofLeft
			icon_state="rl"
			density=1
		RoofMiddle
			icon_state="roof"
			density=1
		RoofMiddle2
			icon_state="roof2"
			density=1
		StairsUp
			icon='turf.dmi'
			icon_state="stairs-up"
		StairsDown
			icon_state="stairs-down"
			icon='turf.dmi'
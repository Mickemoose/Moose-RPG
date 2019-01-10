FURNITURE
	parent_type = /obj
	layer=OBJ_LAYER+5
	var
		Buy_Price = 0
		Sell_Price = 0
		Owner = null
		list/
			Storage = list()

	MouseDrag()
		var/icon/I = new(src.icon,src.icon_state)
		mouse_drag_pointer = I
		if(Owner==null)
			Owner=usr
	MouseDrop(turf/A)
		if(istype(A,/turf)&&Owner==usr)
			if(get_dist(usr,A)<=4)
				Move(A)
			//	usr.Inventory()

	PAINTINGS
		icon='NewTurfs/HouseInteriors/Paintings.dmi'
		icon_state="1"
		density=1
	BOOKSHELVES
		icon='NewTurfs/HouseInteriors/Furniture96.dmi'
		icon_state="bookshelf"
		density=1
	TABLES
		icon='NewTurfs/HouseInteriors/Furniture96.dmi'
		density=1
		MediumGlass
			icon_state="glass-table-medium"
	BEDS
		icon='Overworld/Houses/Furnish/Beds.dmi'
		layer=OBJ_LAYER+5
		RED
			icon_state="RED"
			density=1
		Wood_Bed
			icon='NewTurfs/HouseInteriors/Furniture96.dmi'
			icon_state="bed"
			density=1
		BLUE
			icon_state="Blue-Bed"
			density=1
		GREEN
			icon_state="Green-Bed"
			density=1
		RASTA
			icon_state="Rasta-Bed"
			density=1
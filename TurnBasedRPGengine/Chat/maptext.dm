
//just makign datums to make life eaiser
txt
	parent_type = /obj
	maptext_width = 9999
	maptext_height = 32

	New(atom/trg, px = 0, py = 0, mW = 32, mH = 32, lyr = null)
		..()
		if(!trg) del(src)
		if(!lyr) layer = trg.layer+101
		else layer = lyr

		maptext_width = mW
		maptext_height = mH

		pixel_x = px
		pixel_y = py

		trg.map_text = src


//just makign datums to make life eaiser
outline
	parent_type = /obj
	maptext_width = 9999
	maptext_height = 32

	New(atom/trg, px = 0, py = 0, mW = 32, mH = 32, lyr = null)
		..()
		if(!trg) del(src)
		if(!lyr) layer = trg.layer+100
		else layer = lyr

		maptext_width = mW
		maptext_height = mH

		pixel_x = px
		pixel_y = py

		trg.outline += src
atom//couple of varibale to make access to the maptext easier
	var
		list/outline = list()
		txt/map_text


proc
	initiate_maptext(atom/trg, px, py, mW = 32, mH = 32)//this creats the maptext and outlines for the atom
	//, but doesnt actually give, leave this alone.
		if(!trg) return

		new/txt(trg, px, py, mW, mH)

		gen_outline(trg, px, py, mW, mH)



	gen_outline(atom/trg, px, py, mW, mH)//generates outline peices, leave this alone.(unless you wish to change the size of outline
		//in which case change the -1 and +1 to bigger values.
		new/outline(trg, px-1, py-1, mW, mH)
		new/outline(trg, px-1, py+1, mW, mH)
		new/outline(trg, px+1, py-1, mW, mH)
		new/outline(trg, px+1, py+1, mW, mH)
		new/outline(trg, px+1, py+0, mW, mH)
		new/outline(trg, px+0, py+1, mW, mH)
		new/outline(trg, px+0, py-1, mW, mH)
		new/outline(trg, px-1, py+0, mW, mH)

	Maptext(atom/trg, txt = "", color = "#ffffff", add_outline = 0, outline_color = "#000000")
		if(!trg) return// Changes the maptext of an atom. leave this alone as much as you possibly can.

		trg.overlays -= trg.map_text
		trg.map_text.maptext = "<font face='NEStalgic8' size=3><font color = [color]>[txt]"
		trg.overlays += trg.map_text

		for(var/outline/O in trg.outline)
			trg.overlays -=O
			O.maptext = "<font face='NEStalgic8' size=3><font color = [outline_color]>[txt]"
			if(add_outline) trg.overlays += O
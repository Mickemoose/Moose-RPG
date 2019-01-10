mob
	var
		list
			KeyItems = list()
			Equipment = list()
			Materials = list()
			Armor = list()
			Magic = list()
			Items = list()



mob/proc
	materialUse(MATERIALS/o)
		if(o.canStack && o.contents.len)
			var/MATERIALS/theItem=pick(o.contents)
			if(o.contents.len)
				o.suffix="x[o.contents.len+1]"
			else
				o.suffix="x1"
			del(theItem)
		else
			o.suffix=""
			del(o)
	materialDrop(MATERIALS/o)
		if(o.canStack && o.contents.len)
			var/MATERIALS/theItem=pick(o.contents)
			theItem.loc=src.loc
			if(o.contents.len)
				o.suffix="x[o.contents.len+1]"
			else
				o.suffix="x1"
		else
			o.loc=src.loc
			o.suffix=""

	materialAdd(MATERIALS/o)

		for(var/MATERIALS/i in src.Materials)
			Materials+=i.type

		if(o.type in Materials) //if a similer item is found in the contents
			if(o.canStack)
				var/MATERIALS/theItem
				for(var/MATERIALS/i in src.Materials) if(i.type == o.type) theItem=i
				if(theItem)
					theItem.contents+=o
					theItem.suffix="x[theItem.contents.len+1]"
				else
					src.Materials+=o
					o.suffix="x1"
			else
				src.Materials+=o

		else
			src.Materials+=o
			o.suffix="[o.canStack ? "x1" : "[o.suffix]"]"
	itemDrop(ITEMS/o)
		if(o.canStack && o.contents.len)
			var/ITEMS/theItem=pick(o.contents)
			theItem.loc=src.loc
			if(o.contents.len)
				o.suffix="x[o.contents.len+1]"
			else
				o.suffix="x1"
		else
			o.loc=src.loc
			o.suffix=""

	itemAdd(ITEMS/o)

		for(var/ITEMS/i in src.Items)
			Items+=i.type

		if(o.type in Items) //if a similer item is found in the contents
			if(o.canStack)
				var/ITEMS/theItem
				for(var/ITEMS/i in src.Items) if(i.type == o.type) theItem=i
				if(theItem)
					theItem.contents+=o
					theItem.suffix="x[theItem.contents.len+1]"
				else
					src.Items+=o
					o.suffix="x1"
			else
				src.Items+=o

		else
			src.Items+=o
			o.suffix="[o.canStack ? "x1" : "[o.suffix]"]"
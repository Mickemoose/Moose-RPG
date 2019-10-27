mob
	verb
		CraftRecipe()
			set hidden=1
			usr<<craft
			winset(usr,"CRAFT.CraftButton","is-visible=false")
			var/num=0
			winset(usr,"CRAFT.ERROR","is-visible=true;text='Crafting Successful!")
			spawn(8)
				winset(usr,"CRAFT.ERROR","is-visible=false")
			if(usr.Recipe_Selected=="Boo Helmet")
				for(num=0, num<2, num++)
					for(var/MATERIALS/BOO/ECTOPLASM/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<6, num++)
					for(var/MATERIALS/BOO/FANG/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<2, num++)
					for(var/MATERIALS/BOO/SKIN/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<1, num++)
					for(var/MATERIALS/BOO/TONGUE/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				Equipment.Add(new/EQUIPMENT/ARMOR/HEAD/Boo_Helmet)
			if(usr.Recipe_Selected=="Spooky Chopper")
				for(num=0, num<1, num++)
					for(var/MATERIALS/BOO/ECTOPLASM/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<6, num++)
					for(var/MATERIALS/BOO/FANG/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<4, num++)
					for(var/MATERIALS/BOO/SKIN/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)
				for(num=0, num<2, num++)
					for(var/MATERIALS/BOO/TONGUE/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)
				Equipment.Add(new/EQUIPMENT/WEAPONS/Boo_Axe)
			if(usr.Recipe_Selected=="Slime Slayer")
				for(num=0, num<10, num++)
					for(var/MATERIALS/SLIME/GOOP/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<2, num++)
					for(var/MATERIALS/SLIME/EYE/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				Equipment.Add(new/EQUIPMENT/WEAPONS/Slime_Slayer)
			if(usr.Recipe_Selected=="Boo Armor")
				for(num=0, num<2, num++)
					for(var/MATERIALS/BOO/ECTOPLASM/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<8, num++)
					for(var/MATERIALS/BOO/FANG/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<4, num++)
					for(var/MATERIALS/BOO/SKIN/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				Equipment.Add(new/EQUIPMENT/ARMOR/OUTFIT/Boo_Armor)

			if(usr.Recipe_Selected=="Gamma Visor")
				for(num=0, num<1, num++)
					for(var/MATERIALS/GAMMA/CPU/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<4, num++)
					for(var/MATERIALS/GAMMA/ARMOR/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<2, num++)
					for(var/MATERIALS/GAMMA/GEAR/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<2, num++)
					for(var/MATERIALS/GAMMA/FUEL/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				Equipment.Add(new/EQUIPMENT/ARMOR/MASK/Gamma_Visor)

			if(usr.Recipe_Selected=="Gamma Vector")
				for(num=0, num<1, num++)
					for(var/MATERIALS/GAMMA/CPU/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<10, num++)
					for(var/MATERIALS/GAMMA/ARMOR/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<6, num++)
					for(var/MATERIALS/GAMMA/GEAR/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<4, num++)
					for(var/MATERIALS/GAMMA/FUEL/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				Equipment.Add(new/EQUIPMENT/WEAPONS/Gamma_Vector)
			if(usr.Recipe_Selected=="Gamma Ray")
				for(num=0, num<1, num++)
					for(var/MATERIALS/GAMMA/CPU/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<4, num++)
					for(var/MATERIALS/GAMMA/ARMOR/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<2, num++)
					for(var/MATERIALS/GAMMA/GEAR/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<1, num++)
					for(var/MATERIALS/GAMMA/FUEL/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				Equipment.Add(new/EQUIPMENT/WEAPONS/GUNS/Gamma_Ray)
			if(usr.Recipe_Selected=="Gamma Plating")
				for(num=0, num<4, num++)
					for(var/MATERIALS/GAMMA/CPU/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<8, num++)
					for(var/MATERIALS/GAMMA/ARMOR/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<4, num++)
					for(var/MATERIALS/GAMMA/GEAR/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<4, num++)
					for(var/MATERIALS/GAMMA/FUEL/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				Equipment.Add(new/EQUIPMENT/ARMOR/OUTFIT/Gamma_Plating)
			if(usr.Recipe_Selected=="Sacred Blade")
				for(num=0, num<1, num++)
					for(var/MATERIALS/HOOH/EYE/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<1, num++)
					for(var/MATERIALS/HOOH/FLAME/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<2, num++)
					for(var/MATERIALS/HOOH/PELT/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				for(num=0, num<4, num++)
					for(var/MATERIALS/HOOH/FEATHER/E in usr.Materials)
						if(E.canStack && E.contents.len)
							var/MATERIALS/theItem=pick(E.contents)
							theItem.loc=usr.loc
							del(theItem)
							if(E.contents.len)
								E.suffix="x[E.contents.len+1]"
							else
								E.suffix="x1"
						else
							E.loc=usr.loc
							del(E)

				Equipment.Add(new/EQUIPMENT/WEAPONS/Sacred_Blade)


RECIPES
	parent_type=/obj
	var
		Ingredient_1 =""
		Ingredient_2 =""
		Ingredient_3 =""
		Ingredient_4 =""
		DisplayIcon = null
	icon='Items/Icons.dmi'
	Click()
		if(usr.IN_MENU)
			usr.Recipe_Selected = "[src]"
			winset(usr,"CRAFT.CraftButton","is-visible=false")
			winset(usr,"CRAFT.Name","text='[src.name]'")
			winset(usr,"CRAFT.In1","text='0[src.Ingredient_1]'")
			winset(usr,"CRAFT.In2","text='0[src.Ingredient_2]'")
			winset(usr,"CRAFT.In3","text='0[src.Ingredient_3]'")
			winset(usr,"CRAFT.In4","text='0[src.Ingredient_4]'")
			usr << output("<BIG>\icon [src.DisplayIcon]</BIG>", "CRAFT.grid")
	Boo_Armor
		icon_state="outfit"
		DisplayIcon='Equipment/Sets/Boo/Armor.dmi'
		Ingredient_1="/2 Boo Ectoplasm"
		Ingredient_2="/8 Boo Fang"
		Ingredient_3="/4 Boo Skin"
		Click()
			..()
			usr << output("<BIG>\icon [src.DisplayIcon]</BIG>", "CRAFT.grid")
			for(var/MATERIALS/BOO/ECTOPLASM/E in usr.Materials)
				winset(usr,"CRAFT.In1","text='[E.suffix][src.Ingredient_1]'")
			for(var/MATERIALS/BOO/FANG/E in usr.Materials)
				winset(usr,"CRAFT.In2","text='[E.suffix][src.Ingredient_2]'")
			for(var/MATERIALS/BOO/SKIN/E in usr.Materials)
				winset(usr,"CRAFT.In3","text='[E.suffix][src.Ingredient_3]'")
			winset(usr,"CRAFT.In4","text=''")
			for(var/MATERIALS/BOO/ECTOPLASM/E in usr.Materials)
				if(E.contents.len+1>=2)
					for(var/MATERIALS/BOO/FANG/E2 in usr.Materials)
						if(E2.contents.len+1>=8)
							for(var/MATERIALS/BOO/SKIN/E3 in usr.Materials)
								if(E3.contents.len+1>=4)
									winset(usr,"CRAFT.CraftButton","is-visible=true")


	Spooky_Chopper
		icon_state="weapon"
		DisplayIcon='Equipment/Sets/Boo/Axe.dmi'
		Ingredient_1="/1 Boo Ectoplasm"
		Ingredient_2="/6 Boo Fang"
		Ingredient_3="/4 Boo Skin"
		Ingredient_4="/2 Boos Tongue"
		Click()
			..()
			usr << output("<BIG>\icon [src.DisplayIcon]</BIG>", "CRAFT.grid")
			for(var/MATERIALS/BOO/ECTOPLASM/E in usr.Materials)
				winset(usr,"CRAFT.In1","text='[E.suffix][src.Ingredient_1]'")
			for(var/MATERIALS/BOO/FANG/E in usr.Materials)
				winset(usr,"CRAFT.In2","text='[E.suffix][src.Ingredient_2]'")
			for(var/MATERIALS/BOO/SKIN/E in usr.Materials)
				winset(usr,"CRAFT.In3","text='[E.suffix][src.Ingredient_3]'")
			for(var/MATERIALS/BOO/TONGUE/E in usr.Materials)
				winset(usr,"CRAFT.In4","text='[E.suffix][src.Ingredient_4]'")
			for(var/MATERIALS/BOO/ECTOPLASM/E in usr.Materials)
				if(E.contents.len+1>=1)
					for(var/MATERIALS/BOO/FANG/E2 in usr.Materials)
						if(E2.contents.len+1>=6)
							for(var/MATERIALS/BOO/SKIN/E3 in usr.Materials)
								if(E3.contents.len+1>=4)
									for(var/MATERIALS/BOO/TONGUE/E4 in usr.Materials)
										if(E4.contents.len+1>=2)
											winset(usr,"CRAFT.CraftButton","is-visible=true")
	Boo_Helmet
		icon_state="helm"
		DisplayIcon='Equipment/Sets/Boo/Helm.dmi'
		Ingredient_1="/2 Boo Ectoplasm"
		Ingredient_2="/6 Boo Fang"
		Ingredient_3="/2 Boo Skin"
		Ingredient_4="/1 Boos Tongue"
		Click()
			..()
			usr << output("<BIG>\icon [src.DisplayIcon]</BIG>", "CRAFT.grid")
			for(var/MATERIALS/BOO/ECTOPLASM/E in usr.Materials)
				winset(usr,"CRAFT.In1","text='[E.suffix][src.Ingredient_1]'")
			for(var/MATERIALS/BOO/FANG/E in usr.Materials)
				winset(usr,"CRAFT.In2","text='[E.suffix][src.Ingredient_2]'")
			for(var/MATERIALS/BOO/SKIN/E in usr.Materials)
				winset(usr,"CRAFT.In3","text='[E.suffix][src.Ingredient_3]'")
			for(var/MATERIALS/BOO/TONGUE/E in usr.Materials)
				winset(usr,"CRAFT.In4","text='[E.suffix][src.Ingredient_4]'")
			for(var/MATERIALS/BOO/ECTOPLASM/E in usr.Materials)
				if(E.contents.len+1>=2)
					for(var/MATERIALS/BOO/FANG/E2 in usr.Materials)
						if(E2.contents.len+1>=6)
							for(var/MATERIALS/BOO/SKIN/E3 in usr.Materials)
								if(E3.contents.len+1>=2)
									for(var/MATERIALS/BOO/TONGUE/E4 in usr.Materials)
										if(E4.contents.len+1>=1)
											winset(usr,"CRAFT.CraftButton","is-visible=true")

	Gamma_Visor
		icon_state="mask"
		DisplayIcon='Equipment/Mask/GammaVisor.dmi'
		Ingredient_1 ="/1 E-100 Series CPU"
		Ingredient_2 ="/4 Gamma Armor Plate"
		Ingredient_3 ="/2 Gamma Series Gear"
		Ingredient_4 ="/2 Robotnik Robo Fuel"
		Click()
			..()
			usr << output("<BIG>\icon [src.DisplayIcon]</BIG>", "CRAFT.grid")
			for(var/MATERIALS/GAMMA/CPU/E in usr.Materials)
				winset(usr,"CRAFT.In1","text='[E.suffix][src.Ingredient_1]'")
			for(var/MATERIALS/GAMMA/ARMOR/E in usr.Materials)
				winset(usr,"CRAFT.In2","text='[E.suffix][src.Ingredient_2]'")
			for(var/MATERIALS/GAMMA/GEAR/E in usr.Materials)
				winset(usr,"CRAFT.In3","text='[E.suffix][src.Ingredient_3]'")
			for(var/MATERIALS/GAMMA/FUEL/E in usr.Materials)
				winset(usr,"CRAFT.In4","text='[E.suffix][src.Ingredient_4]'")
			for(var/MATERIALS/GAMMA/CPU/E in usr.Materials)
				if(E.contents.len+1>=1)
					for(var/MATERIALS/GAMMA/ARMOR/E2 in usr.Materials)
						if(E2.contents.len+1>=4)
							for(var/MATERIALS/GAMMA/GEAR/E3 in usr.Materials)
								if(E3.contents.len+1>=2)
									for(var/MATERIALS/GAMMA/FUEL/E4 in usr.Materials)
										if(E4.contents.len+1>=2)
											winset(usr,"CRAFT.CraftButton","is-visible=true")
	Gamma_Vector
		icon_state="weapon"
		DisplayIcon='Equipment/Weapon/GammaShocker.dmi'
		Ingredient_1 ="/1 E-100 Series CPU"
		Ingredient_2 ="/10 Gamma Armor Plate"
		Ingredient_3 ="/6 Gamma Series Gear"
		Ingredient_4 ="/4 Robotnik Robo Fuel"
		Click()
			..()
			usr << output("<BIG>\icon [src.DisplayIcon]</BIG>", "CRAFT.grid")
			for(var/MATERIALS/GAMMA/CPU/E in usr.Materials)
				winset(usr,"CRAFT.In1","text='[E.suffix][src.Ingredient_1]'")
			for(var/MATERIALS/GAMMA/ARMOR/E in usr.Materials)
				winset(usr,"CRAFT.In2","text='[E.suffix][src.Ingredient_2]'")
			for(var/MATERIALS/GAMMA/GEAR/E in usr.Materials)
				winset(usr,"CRAFT.In3","text='[E.suffix][src.Ingredient_3]'")
			for(var/MATERIALS/GAMMA/FUEL/E in usr.Materials)
				winset(usr,"CRAFT.In4","text='[E.suffix][src.Ingredient_4]'")
			for(var/MATERIALS/GAMMA/CPU/E in usr.Materials)
				if(E.contents.len+1>=1)
					for(var/MATERIALS/GAMMA/ARMOR/E2 in usr.Materials)
						if(E2.contents.len+1>=10)
							for(var/MATERIALS/GAMMA/GEAR/E3 in usr.Materials)
								if(E3.contents.len+1>=6)
									for(var/MATERIALS/GAMMA/FUEL/E4 in usr.Materials)
										if(E4.contents.len+1>=4)
											winset(usr,"CRAFT.CraftButton","is-visible=true")
	Gamma_Plating
		icon_state="outfit"
		DisplayIcon='Equipment/Outfit/GammaOutfit.dmi'
		Ingredient_1 ="/4 E-100 Series CPU"
		Ingredient_2 ="/8 Gamma Armor Plate"
		Ingredient_3 ="/4 Gamma Series Gear"
		Ingredient_4 ="/4 Robotnik Robo Fuel"
		Click()
			..()
			usr << output("<BIG>\icon [src.DisplayIcon]</BIG>", "CRAFT.grid")
			for(var/MATERIALS/GAMMA/CPU/E in usr.Materials)
				winset(usr,"CRAFT.In1","text='[E.suffix][src.Ingredient_1]'")
			for(var/MATERIALS/GAMMA/ARMOR/E in usr.Materials)
				winset(usr,"CRAFT.In2","text='[E.suffix][src.Ingredient_2]'")
			for(var/MATERIALS/GAMMA/GEAR/E in usr.Materials)
				winset(usr,"CRAFT.In3","text='[E.suffix][src.Ingredient_3]'")
			for(var/MATERIALS/GAMMA/FUEL/E in usr.Materials)
				winset(usr,"CRAFT.In4","text='[E.suffix][src.Ingredient_4]'")
			for(var/MATERIALS/GAMMA/CPU/E in usr.Materials)
				if(E.contents.len+1>=4)
					for(var/MATERIALS/GAMMA/ARMOR/E2 in usr.Materials)
						if(E2.contents.len+1>=8)
							for(var/MATERIALS/GAMMA/GEAR/E3 in usr.Materials)
								if(E3.contents.len+1>=4)
									for(var/MATERIALS/GAMMA/FUEL/E4 in usr.Materials)
										if(E4.contents.len+1>=4)
											winset(usr,"CRAFT.CraftButton","is-visible=true")
	Gamma_Ray
		icon_state="gun"
		DisplayIcon='Equipment/Weapon/Gun/GammaBlaster.dmi'
		Ingredient_1 ="/1 E-100 Series CPU"
		Ingredient_2 ="/4 Gamma Armor Plate"
		Ingredient_3 ="/2 Gamma Series Gear"
		Ingredient_4 ="/1 Robotnik Robo Fuel"
		Click()
			..()
			usr << output("<BIG>\icon [src.DisplayIcon]</BIG>", "CRAFT.grid")
			for(var/MATERIALS/GAMMA/CPU/E in usr.Materials)
				winset(usr,"CRAFT.In1","text='[E.suffix][src.Ingredient_1]'")
			for(var/MATERIALS/GAMMA/ARMOR/E in usr.Materials)
				winset(usr,"CRAFT.In2","text='[E.suffix][src.Ingredient_2]'")
			for(var/MATERIALS/GAMMA/GEAR/E in usr.Materials)
				winset(usr,"CRAFT.In3","text='[E.suffix][src.Ingredient_3]'")
			for(var/MATERIALS/GAMMA/FUEL/E in usr.Materials)
				winset(usr,"CRAFT.In4","text='[E.suffix][src.Ingredient_4]'")
			for(var/MATERIALS/GAMMA/CPU/E in usr.Materials)
				if(E.contents.len+1>=1)
					for(var/MATERIALS/GAMMA/ARMOR/E2 in usr.Materials)
						if(E2.contents.len+1>=4)
							for(var/MATERIALS/GAMMA/GEAR/E3 in usr.Materials)
								if(E3.contents.len+1>=2)
									for(var/MATERIALS/GAMMA/FUEL/E4 in usr.Materials)
										if(E4.contents.len+1>=1)
											winset(usr,"CRAFT.CraftButton","is-visible=true")
	Sacred_Blade
		icon_state="weapon"
		DisplayIcon='Equipment/Weapon/HoOhSword.dmi'
		Ingredient_1 ="/2 Rainbow Pelt"
		Ingredient_2 ="/1 Fierce Eye"
		Ingredient_3 ="/4 Rainbow Feather"
		Ingredient_4 ="/1 Sacred Flame"
		Click()
			..()
			usr << output("<BIG>\icon [src.DisplayIcon]</BIG>", "CRAFT.grid")
			for(var/MATERIALS/HOOH/PELT/E in usr.Materials)
				winset(usr,"CRAFT.In1","text='[E.suffix][src.Ingredient_1]'")
			for(var/MATERIALS/HOOH/EYE/E in usr.Materials)
				winset(usr,"CRAFT.In2","text='[E.suffix][src.Ingredient_2]'")
			for(var/MATERIALS/HOOH/FEATHER/E in usr.Materials)
				winset(usr,"CRAFT.In3","text='[E.suffix][src.Ingredient_3]'")
			for(var/MATERIALS/HOOH/FLAME/E in usr.Materials)
				winset(usr,"CRAFT.In4","text='[E.suffix][src.Ingredient_4]'")
			for(var/MATERIALS/HOOH/PELT/E in usr.Materials)
				if(E.contents.len+1>=2)
					for(var/MATERIALS/HOOH/EYE/E2 in usr.Materials)
						if(E2.contents.len+1>=1)
							for(var/MATERIALS/HOOH/FEATHER/E3 in usr.Materials)
								if(E3.contents.len+1>=4)
									for(var/MATERIALS/HOOH/FLAME/E4 in usr.Materials)
										if(E4.contents.len+1>=1)
											winset(usr,"CRAFT.CraftButton","is-visible=true")
	Slime_Slayer
		icon_state="weapon"
		DisplayIcon='Equipment/Weapon/SlimeSword.dmi'
		Ingredient_1="/10 Slime Goop"
		Ingredient_2="/2 Uncanny Eye"
		Click()
			..()
			usr << output("<BIG>\icon [src.DisplayIcon]</BIG>", "CRAFT.grid")
			for(var/MATERIALS/SLIME/GOOP/E in usr.Materials)
				winset(usr,"CRAFT.In1","text='[E.suffix][src.Ingredient_1]'")
			for(var/MATERIALS/SLIME/EYE/E in usr.Materials)
				winset(usr,"CRAFT.In2","text='[E.suffix][src.Ingredient_2]'")
			winset(usr,"CRAFT.In3","text=''")
			winset(usr,"CRAFT.In4","text=''")
			for(var/MATERIALS/SLIME/GOOP/E in usr.Materials)
				if(E.contents.len+1>=10)
					for(var/MATERIALS/SLIME/EYE/E2 in usr.Materials)
						if(E2.contents.len+1>=2)
							winset(usr,"CRAFT.CraftButton","is-visible=true")
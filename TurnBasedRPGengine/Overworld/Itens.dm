obj
	OVERWORLD
		Boss
			HoOh
				icon='Overworld/Enemies/HoOh.dmi'
				density=1
				verb
					Interact()
						set src in oview(1)
						usr.ASKER=usr
						usr.ASKING="BOSS: HO-OH"
						usr.Question("    Do you wish to challenge Ho-Oh?")
		Item
			icon='Party/Overworld.dmi'
			icon_state="item"
			var
				list
					contains = list()
			TEMP
				contains=new/EQUIPMENT/WEAPONS/DEREK/Tempestra_Blade
			Potions
				contains=new/ITEMS/Potion
			LOL
				New()
					..()
					contains.Add(new/EQUIPMENT/ARMOR/HEAD/Boo_Helmet, new/EQUIPMENT/ARMOR/HEAD/Lugia_Helmet, new/EQUIPMENT/ARMOR/OUTFIT/Lugia_Armor, new/EQUIPMENT/ARMOR/OUTFIT/Boo_Armor)
			verb
				Interact()
					set src in oview(1)
					usr.Equipment.Add(contains)




					del(src)
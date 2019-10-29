mob
	var
		IN_MENU = 0
		managing=0
		Selected= null
		Slot=1
		OldSlot2=1
	verb
		ExitGame()
			set hidden=1
			usr.Save()
		//	usr.WorldSave()
			sleep(5)
			winset(usr, null, "command=.quit")
		ToggleFullscreen()
			set hidden=1
			usr.client.ToggleFullscreen()
		CraftMenu()
			set hidden=1
			usr<<menubutton
			winset(src, "default.MENU", "right=CRAFT")
			var/I = 0
			for(var/RECIPES/R in src.Recipes)//Loop through all the items in the players contents

				winset(src, "CRAFT.grid2", "current-cell=1,[++I]")	//Add multiple cells horizontally for each obj
				src << output(R, "CRAFT.grid2")//Send the obj's in src.contents to the Grid
			winset(src,"CRAFT.grid2", "cells=[I]")//Set the amount of cells to the amount within I
		//	usr.CraftingSetup()
		P1Equip()
			set hidden=1
			usr<<menubutton
			for(var/Party_Members/P3 in usr.Party)
				if(P3.Party_Position==1)
					winset(usr,"EQUIP.NAME","text='[P3.name]")
					winset(usr,"EQUIP.LEVEL","text='LVL [P3.LEVEL]")
					winset(usr,"EQUIP.WEP","text='[P3.WEAPON_SLOT]")
					winset(usr,"EQUIP.HEAD","text='HEAD: [P3.HEAD_SLOT]")
					Equipping=P3
					usr.EquipUpdate()
					return
		P2Equip()
			set hidden=1
			usr<<menubutton
			for(var/Party_Members/P3 in usr.Party)
				if(P3.Party_Position==2)
					winset(usr,"EQUIP.NAME","text='[P3.name]")
					winset(usr,"EQUIP.LEVEL","text='LVL [P3.LEVEL]")
					winset(usr,"EQUIP.WEP","text='[P3.WEAPON_SLOT]")
					winset(usr,"EQUIP.HEAD","text='HEAD: [P3.HEAD_SLOT]")
					Equipping=P3
					usr.EquipUpdate()
					return
		P3Equip()
			set hidden=1
			usr<<menubutton
			for(var/Party_Members/P3 in usr.Party)
				if(P3.Party_Position==3)
					winset(usr,"EQUIP.NAME","text='[P3.name]")
					winset(usr,"EQUIP.LEVEL","text='LVL [P3.LEVEL]")
					winset(usr,"EQUIP.WEP","text='[P3.WEAPON_SLOT]")
					winset(usr,"EQUIP.HEAD","text='HEAD: [P3.HEAD_SLOT]")
					Equipping=P3
					usr.EquipUpdate()
					return
		P4Equip()
			set hidden=1
			usr<<menubutton
			for(var/Party_Members/P3 in usr.Party)
				if(P3.Party_Position==4)
					winset(usr,"EQUIP.NAME","text='[P3.name]")
					winset(usr,"EQUIP.LEVEL","text='LVL [P3.LEVEL]")
					winset(usr,"EQUIP.WEP","text='[P3.WEAPON_SLOT]")
					winset(usr,"EQUIP.HEAD","text='HEAD: [P3.HEAD_SLOT]")
					Equipping=P3
					usr.EquipUpdate()
					return
		Send2Reserve()
			set hidden=1
			if(usr.managing==1)
				if(usr.Party.len<=1)
					usr<<error
					winset(usr,"Manage.ERROR","is-visible=true;text='fuck off lmao")
					spawn(5)
						winset(usr,"Manage.ERROR","is-visible=false")
						Manage()
					return
				else
					for(var/Party_Members/P1 in usr.Party)
						if(P1.Party_Position==1)
							usr.Reserves.Add(P1)
							usr.Party.Remove(P1)
							P1.Party_Position=0
							usr.Manage()
			if(usr.managing==2)
				if(usr.Party.len<=1)
					usr<<error
					winset(usr,"Manage.ERROR","is-visible=true;text='fuck off lmao")
					spawn(5)
						winset(usr,"Manage.ERROR","is-visible=false")
						Manage()
					return
				else
					for(var/Party_Members/P1 in usr.Party)
						if(P1.Party_Position==2)
							usr.Reserves.Add(P1)
							usr.Party.Remove(P1)
							P1.Party_Position=0
							usr.Manage()
			if(usr.managing==3)
				if(usr.Party.len<=1)
					usr<<error
					winset(usr,"Manage.ERROR","is-visible=true;text='fuck off lmao")
					spawn(5)
						winset(usr,"Manage.ERROR","is-visible=false")
						Manage()
					return
				else
					for(var/Party_Members/P1 in usr.Party)
						if(P1.Party_Position==3)
							usr.Reserves.Add(P1)
							usr.Party.Remove(P1)
							P1.Party_Position=0
							usr.Manage()
			if(usr.managing==4)
				if(usr.Party.len<=1)
					usr<<error
					winset(usr,"Manage.ERROR","is-visible=true;text='fuck off lmao")
					spawn(5)
						winset(usr,"Manage.ERROR","is-visible=false")
						Manage()
					return
				else
					for(var/Party_Members/P1 in usr.Party)
						if(P1.Party_Position==4)
							usr.Reserves.Add(P1)
							usr.Party.Remove(P1)
							P1.Party_Position=0
							usr.Manage()
		P1Manage()
			set hidden=1
			if(usr.managing==0)
				usr.managing=1
				usr<<equip
				winset(usr,"Manage.P1_BORDER","is-visible=true")
			else
				Manage()
				usr.managing=1
				usr<<equip
				winset(usr,"Manage.P1_BORDER","is-visible=true")
		P2Manage()
			set hidden=1
			if(usr.managing==0)
				usr.managing=2
				usr<<equip
				winset(usr,"Manage.P2_BORDER","is-visible=true")
			else
				Manage()
				usr.managing=2
				usr<<equip
				winset(usr,"Manage.P2_BORDER","is-visible=true")
		P3Manage()
			set hidden=1
			if(usr.managing==0)
				usr.managing=3
				usr<<equip
				winset(usr,"Manage.P3_BORDER","is-visible=true")
			else
				Manage()
				usr.managing=3
				usr<<equip
				winset(usr,"Manage.P3_BORDER","is-visible=true")
		P4Manage()
			set hidden=1
			if(usr.managing==0)
				usr.managing=4
				usr<<equip
				winset(usr,"Manage.P4_BORDER","is-visible=true")
			else
				Manage()
				usr.managing=4
				usr<<equip
				winset(usr,"Manage.P4_BORDER","is-visible=true")
		P1Item()
			set hidden=1
			for(var/Party_Members/P in usr.Party)
				if(P.Party_Position==1)
					for(var/ITEMS/I in usr.Items)
						if(usr.ITEM_INMENU==I)
							I.ItemMenuUse(P)
					usr.ItemCheck()
					usr.PartyCheckItem()
		P2Item()
			set hidden=1
			for(var/Party_Members/P in usr.Party)
				if(P.Party_Position==2)
					for(var/ITEMS/I in usr.Items)
						if(usr.ITEM_INMENU==I)
							I.ItemMenuUse(P)
					usr.ItemCheck()
					usr.PartyCheckItem()
		P3Item()
			set hidden=1
			for(var/Party_Members/P in usr.Party)
				if(P.Party_Position==3)
					for(var/ITEMS/I in usr.Items)
						if(usr.ITEM_INMENU==I)
							I.ItemMenuUse(P)
					usr.ItemCheck()
					usr.PartyCheckItem()
		P4Item()
			set hidden=1
			for(var/Party_Members/P in usr.Party)
				if(P.Party_Position==4)
					for(var/ITEMS/I in usr.Items)
						if(usr.ITEM_INMENU==I)
							I.ItemMenuUse(P)
					usr.ItemCheck()
					usr.PartyCheckItem()

		Menu()
			set hidden=1
			if(usr.IN_BATTLE==0)
				if(IN_MENU==0)
					usr<<menubutton
					IN_MENU=1
				//	usr.UpdateInv()
				//	usr<<sound('select.wav')
					winset(usr,"default.MENU","is-visible=true")
					winset(usr,"default.TIME","is-visible=true")
				//	winset(usr,"default.BUTTONS","is-visible=false")
					PartyCheck2()
					EquipUpdate()

				else
					usr<<menubutton
					IN_MENU=0
					winset(usr,"default.MENU","is-visible=false")
					winset(usr,"default.TIME","is-visible=false")
				//	winset(usr,"default.BUTTONS","is-visible=false")

		Equip()
			usr<<menubutton
			winset(usr, "default.MENU", "right=EQUIP")
			EquipSet()
		SaveButton()

			usr.Save()
			winset(usr, "PARTY.savetext","is-visible=true")
			spawn(8)
				winset(usr, "PARTY.savetext","is-visible=false")
		Items()
			usr<<menubutton
			winset(usr, "default.MENU", "right=ITEMS")
			ItemCheck()
		PartyManage()
			usr<<menubutton
			winset(usr, "default.MENU", "right=Manage")
			Manage()
		Materials()
			usr<<menubutton
			winset(usr, "default.MENU", "right=MATERIALS")
			MaterialCheck()
		Back()
			usr<<menubutton
			winset(usr, "default.MENU", "right=PARTY")
			PartyCloseItem()
			PartyCheck2()
		EquipScreen2()
			usr<<menubutton
			winset(usr, "default.MENU", "right=EQUIP")
			EquipSet()
		EquipNext()
			usr<<menubutton
			if(usr.Slot==1)
				for(var/Party_Members/P3 in usr.Party)
					if(usr.Equipping!=P3)
						Slot=Party.Find(P3,2)
						if(Slot==2)
							winset(usr,"EQUIP.NAME","text='[P3.name]")
							winset(usr,"EQUIP.LEVEL","text='LVL [P3.LEVEL]")
							winset(usr,"EQUIP.WEP","text='[P3.WEAPON_SLOT]")
							winset(usr,"EQUIP.HEAD","text='HEAD: [P3.HEAD_SLOT]")
							var/icon/I = getFlatIcon(P3, SOUTH, cache=0)
							I = fcopy_rsc(I)
							winset(usr,"EQUIP.P1_ICON","image='\ref[I]'")
							Equipping=P3
							usr.EquipUpdate()
							return
						if(Slot==0) continue
			if(usr.Slot==2)
				for(var/Party_Members/P3 in usr.Party)
					if(usr.Equipping!=P3)
						Slot=Party.Find(P3,3)
						if(Slot==3)
							winset(usr,"EQUIP.NAME","text='[P3.name]")
							winset(usr,"EQUIP.LEVEL","text='LVL [P3.LEVEL]")
							winset(usr,"EQUIP.WEP","text='[P3.WEAPON_SLOT]")
							winset(usr,"EQUIP.HEAD","text='HEAD: [P3.HEAD_SLOT]")
							var/icon/I = getFlatIcon(P3, SOUTH, cache=0)
							I = fcopy_rsc(I)
							winset(usr,"EQUIP.P1_ICON","image='\ref[I]'")
							Equipping=P3
							usr.EquipUpdate()
							return
						if(Slot==0) continue




			if(usr.Slot==3)
				for(var/Party_Members/P3 in usr.Party)
					if(usr.Equipping!=P3)
						Slot=Party.Find(P3,4)
						if(Slot==4)
							winset(usr,"EQUIP.NAME","text='[P3.name]")
							winset(usr,"EQUIP.LEVEL","text='LVL [P3.LEVEL]")
							winset(usr,"EQUIP.WEP","text='[P3.WEAPON_SLOT]")
							winset(usr,"EQUIP.HEAD","text='HEAD: [P3.HEAD_SLOT]")
							var/icon/I = getFlatIcon(P3, SOUTH, cache=0)
							I = fcopy_rsc(I)
							winset(usr,"EQUIP.P1_ICON","image='\ref[I]'")
							Equipping=P3
							usr.EquipUpdate()
							return
						if(Slot==0) continue


			if(usr.Slot==4)
				for(var/Party_Members/P3 in usr.Party)
					if(usr.Equipping!=P3)
						Slot=Party.Find(P3,1)
						if(Slot==1)
							winset(usr,"EQUIP.NAME","text='[P3.name]")
							winset(usr,"EQUIP.LEVEL","text='LVL [P3.LEVEL]")
							winset(usr,"EQUIP.WEP","text='[P3.WEAPON_SLOT]")
							winset(usr,"EQUIP.HEAD","text='HEAD: [P3.HEAD_SLOT]")
							var/icon/I = getFlatIcon(P3, SOUTH, cache=0)
							I = fcopy_rsc(I)
							winset(usr,"EQUIP.P1_ICON","image='\ref[I]'")
							Equipping=P3
							usr.EquipUpdate()
							return
						if(Slot==0) return


	/*		else
				Slot=Party.Find(P3,3)
				if(Slot!=0&&Slot==3)
					winset(usr,"EQUIP.NAME","text='[P3.name]")
					winset(usr,"EQUIP.LEVEL","text='LVL [P3.LEVEL]")
					winset(usr,"EQUIP.WEP","text='[P3.WEAPON_SLOT]")
					winset(usr,"EQUIP.HEAD","text='HEAD: [P3.HEAD_SLOT]")
					var/icon/I = getFlatIcon(P3, SOUTH, cache=0)
					I = fcopy_rsc(I)
					winset(usr,"EQUIP.P1_ICON","image='\ref[I]'")
					usr.EquipUpdate()
					Equipping=P3
					usr.Selected=3
					return
				else
					Slot=Party.Find(P3,4)
					if(Slot!=0&&Slot==4)
						winset(usr,"EQUIP.NAME","text='[P3.name]")
						winset(usr,"EQUIP.LEVEL","text='LVL [P3.LEVEL]")
						winset(usr,"EQUIP.WEP","text='[P3.WEAPON_SLOT]")
						winset(usr,"EQUIP.HEAD","text='HEAD: [P3.HEAD_SLOT]")
						var/icon/I = getFlatIcon(P3, SOUTH, cache=0)
						I = fcopy_rsc(I)
						winset(usr,"EQUIP.P1_ICON","image='\ref[I]'")
						usr.EquipUpdate()
						Equipping=P3
						usr.Selected=3
						return
					else
						Slot=Party.Find(P3,1)
						if(Slot!=0&&Slot==1)
							winset(usr,"EQUIP.NAME","text='[P3.name]")
							winset(usr,"EQUIP.LEVEL","text='LVL [P3.LEVEL]")
							winset(usr,"EQUIP.WEP","text='[P3.WEAPON_SLOT]")
							winset(usr,"EQUIP.HEAD","text='HEAD: [P3.HEAD_SLOT]")
							var/icon/I = getFlatIcon(P3, SOUTH, cache=0)
							I = fcopy_rsc(I)
							winset(usr,"EQUIP.P1_ICON","image='\ref[I]'")
							usr.EquipUpdate()
							Equipping=P3
							usr.Selected=3
							return
			*/





	proc

		EquipUpdate()
			for(var/Party_Members/P in usr.Party)
				if(P.Party_Position==1)
					var/icon/I2 = getFlatIcon(P, SOUTH, cache=0)
					I2 = fcopy_rsc(I2)
					winset(usr,"EQUIP.P1_BUTTON","is-visible=true;image='\ref[I2]'")
				if(P.Party_Position==2)
					var/icon/I2 = getFlatIcon(P, SOUTH, cache=0)
					I2 = fcopy_rsc(I2)
					winset(usr,"EQUIP.P2_BUTTON","is-visible=true;image='\ref[I2]'")
				if(P.Party_Position==3)
					var/icon/I2 = getFlatIcon(P, SOUTH, cache=0)
					I2 = fcopy_rsc(I2)
					winset(usr,"EQUIP.P3_BUTTON","is-visible=true;image='\ref[I2]'")
				if(P.Party_Position==4)
					var/icon/I2 = getFlatIcon(P, SOUTH, cache=0)
					I2 = fcopy_rsc(I2)
					winset(usr,"EQUIP.P4_BUTTON","is-visible=true;image='\ref[I2]'")
			for(var/Party_Members/P in Party)
				if(usr.Equipping==P)
					winset(usr,"EQUIP.NAME","text='[P.name]")
					winset(usr,"EQUIP.LEVEL","text='LEVEL: [P.LEVEL]")
					winset(usr,"EQUIP.WEP","text='[P.WEAPON_SLOT]")
					winset(usr,"EQUIP.HEAD","text='[P.HEAD_SLOT]")
					winset(usr,"EQUIP.MASK","text='[P.MASK_SLOT]")
					winset(usr,"EQUIP.OUTFIT","text='[P.OUTFIT_SLOT]")
					winset(usr,"EQUIP.STR","text='STR:[P.STRENGTH]([P.STRENGTH_ADDED])[P.STRENGTH+P.STRENGTH_ADDED]")
					winset(usr,"EQUIP.DEF","text='DEF:[P.DEFENSE]([P.DEFENSE_ADDED])[P.DEFENSE+P.DEFENSE_ADDED]")
					winset(usr,"EQUIP.ACC","text='ACC:[P.ACCURACY]([P.ACC_ADDED])[P.ACCURACY+P.ACC_ADDED]")
					winset(usr,"EQUIP.FIRE","text='FRE RST:[P.FIRE_RESIST]([P.FIRERESIST_ADDED])[P.FIRE_RESIST+P.FIRERESIST_ADDED]")
					winset(usr,"EQUIP.POI","text='PSN RST:[P.POISON_RESIST]([P.POIRESIST_ADDED])[P.POISON_RESIST+P.POIRESIST_ADDED]")
					winset(usr,"EQUIP.HP","text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"EQUIP.MP","text='MP:[P.MAGIC]/[P.MAX_MAGIC]")
					var/I = 0
					var/A = 0
					for(var/EQUIPMENT/WEAPONS/O in usr.Equipment)//Loop through all the items in the players contents
						if(O.CHARACTER_LOCK=="[P.name]" || O.CHARACTER_LOCK==null)
							winset(src, "EQUIP.WEAPONS", "current-cell=1,[++I]")	//Add multiple cells horizontally for each obj
							usr << output(O, "EQUIP.WEAPONS")//Send the obj's in src.contents to the Grid
					winset(src,"EQUIP.WEAPONS", "cells=[I]")//Set the amount of cells to the amount within I
					for(var/EQUIPMENT/ARMOR/R in usr.Equipment)//Loop through all the items in the players contents
						if(R.CHARACTER_LOCK=="[P.name]" || R.CHARACTER_LOCK==null)
							winset(usr, "EQUIP.ARMOR", "current-cell=1,[++A]")	//Add multiple cells horizontally for each obj
							usr << output(R, "EQUIP.ARMOR")//Send the obj's in src.contents to the Grid
					winset(src,"EQUIP.ARMOR", "cells=[A]")//Set the amount of cells to the amount within I
					return
		EquipSet()
			winset(usr,"EQUIP.P1_BUTTON","is-visible=false")
			winset(usr,"EQUIP.P2_BUTTON","is-visible=false")
			winset(usr,"EQUIP.P3_BUTTON","is-visible=false")
			winset(usr,"EQUIP.P4_BUTTON","is-visible=false")
			for(var/Party_Members/P in usr.Party)
				if(P.Party_Position==1)
					var/icon/I2 = getFlatIcon(P, SOUTH, cache=0)
					I2 = fcopy_rsc(I2)
					winset(usr,"EQUIP.P1_BUTTON","is-visible=true;image='\ref[I2]'")
				if(P.Party_Position==2)
					var/icon/I2 = getFlatIcon(P, SOUTH, cache=0)
					I2 = fcopy_rsc(I2)
					winset(usr,"EQUIP.P2_BUTTON","is-visible=true;image='\ref[I2]'")
				if(P.Party_Position==3)
					var/icon/I2 = getFlatIcon(P, SOUTH, cache=0)
					I2 = fcopy_rsc(I2)
					winset(usr,"EQUIP.P3_BUTTON","is-visible=true;image='\ref[I2]'")
				if(P.Party_Position==4)
					var/icon/I2 = getFlatIcon(P, SOUTH, cache=0)
					I2 = fcopy_rsc(I2)
					winset(usr,"EQUIP.P4_BUTTON","is-visible=true;image='\ref[I2]'")

			var/Party_Members/P1 = locate() in usr.Party
			if(!isnull(P1))
				Equipping=P1
				usr.Slot=usr.Party.Find(P1)
				usr.Selected=1
				winset(usr,"EQUIP.NAME","text='[P1.name]")
				winset(usr,"EQUIP.LEVEL","text='LVL [P1.LEVEL]")
				winset(usr,"EQUIP.WEP","text='[P1.WEAPON_SLOT]")
				winset(usr,"EQUIP.HEAD","text='HEAD: [P1.HEAD_SLOT]")
				var/I = 0
				var/A = 0
				for(var/EQUIPMENT/WEAPONS/O in usr.Equipment)//Loop through all the items in the players contents

					winset(src, "EQUIP.WEAPONS", "current-cell=1,[++I]")	//Add multiple cells horizontally for each obj
					src << output(O, "EQUIP.WEAPONS")//Send the obj's in src.contents to the Grid
				winset(src,"EQUIP.WEAPONS", "cells=[I]")//Set the amount of cells to the amount within I
				for(var/EQUIPMENT/ARMOR/R in usr.Equipment)//Loop through all the items in the players contents
					winset(src, "EQUIP.ARMOR", "current-cell=1,[++A]")	//Add multiple cells horizontally for each obj
					src << output(R, "EQUIP.ARMOR")//Send the obj's in src.contents to the Grid
				winset(src,"EQUIP.ARMOR", "cells=[A]")//Set the amount of cells to the amount within I
				usr.EquipUpdate()
				usr.OldSlot2=1
				return
		CraftingSetup()
			var/I = 0
			for(var/EQUIPMENT/ARMOR/R in usr.Equipment)//Loop through all the items in the players contents

				winset(src, "CRAFTING.grid2", "current-cell=1,[++I]")	//Add multiple cells horizontally for each obj
				usr << output(R, "CRAFTING.grid2")//Send the obj's in src.contents to the Grid
			winset(usr,"CRAFTING.grid2", "cells=[I]")//Set the amount of cells to the amount within I
		MaterialCheck()
			var/I = 1


			winset(src, "MATERIALS.MATERIALS",{"cells="2x[src.Materials.len]""})	//Add multiple cells horizontally for each obj
			for(var/MATERIALS/O in usr.Materials)//Loop through all the items in the players contents


				usr << output(O, "MATERIALS.MATERIALS:1,[I]")//Send the obj's in src.contents to the Grid
				usr << output(O.suffix,"MATERIALS.MATERIALS:2,[I]")
				I++
		ItemCheck()
			var/I = 1


			winset(src, "ITEMS.ITEMS",{"cells="2x[src.Items.len]""})	//Add multiple cells horizontally for each obj
			for(var/ITEMS/O in src.Items)//Loop through all the items in the players contents


				src << output(O, "ITEMS.ITEMS:1,[I]")//Send the obj's in src.contents to the Grid
				src << output(O.suffix,"ITEMS.ITEMS:2,[I]")
				I++
	//		ItemCheck()
		//	winset(src,"ITEMS.ITEMS", "cells=[I]")//Set the amount of cells to the amount within I
		PartyCheck2()
			winset(usr,"PARTY.MONEY","text='[usr.moneys]'")
			winset(usr,"PARTY.P1NAME","is-visible=false")
			winset(usr,"PARTY.P1_LEVEL","is-visible=false")
			winset(usr,"PARTY.P1HP","is-visible=false")
			winset(usr,"PARTY.P1MP","is-visible=false")
			winset(usr,"PARTY.P1XP","is-visible=false")
			winset(usr,"PARTY.P2_NAME","is-visible=false")
			winset(usr,"PARTY.P2LVL","is-visible=false")
			winset(usr,"PARTY.P2HP","is-visible=false")
			winset(usr,"PARTY.P2MP","is-visible=false")
			winset(usr,"PARTY.P2XP","is-visible=false")
			winset(usr,"PARTY.P3_NAME","is-visible=false")
			winset(usr,"PARTY.P3LVL","is-visible=false")
			winset(usr,"PARTY.P3HP","is-visible=false")
			winset(usr,"PARTY.P3MP","is-visible=false")
			winset(usr,"PARTY.P3XP","is-visible=false")
			winset(usr,"PARTY.P4_NAME","is-visible=false")
			winset(usr,"PARTY.P4LVL","is-visible=false")
			winset(usr,"PARTY.P4HP","is-visible=false")
			winset(usr,"PARTY.P4MP","is-visible=false")
			winset(usr,"PARTY.P4XP","is-visible=false")
			winset(usr,"PARTY.P4_ICON","is-visible=false")
			winset(usr,"PARTY.P2_ICON","is-visible=false")
			winset(usr,"PARTY.P3_ICON","is-visible=false")
			winset(usr,"PARTY.P1_ICON","is-visible=false")
			for(var/Party_Members/P in Party)
				if(P.Party_Position==1)
					winset(usr,"PARTY.P1NAME","is-visible=true;text='[P.name]")
					winset(usr,"PARTY.P1_LEVEL","is-visible=true;text='LEVEL [P.LEVEL]")
					winset(usr,"PARTY.P1HP","is-visible=true;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"PARTY.P1MP","is-visible=true;text='MP:[P.MAGIC]/[P.MAX_MAGIC]")
					winset(usr,"PARTY.P1XP","is-visible=true;text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")
					var/icon/I = getFlatIcon(P, SOUTH, cache=1)
					I = fcopy_rsc(I)
					winset(usr,"PARTY.P1_ICON","is-visible=true;image='\ref[I]'")
				if(P.Party_Position==2)
					winset(usr,"PARTY.P2_NAME","is-visible=true;text='[P.name]")
					winset(usr,"PARTY.P2LVL","is-visible=true;text='LEVEL [P.LEVEL]")
					winset(usr,"PARTY.P2HP","is-visible=true;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"PARTY.P2MP","is-visible=true;text='MP:[P.MAGIC]/[P.MAX_MAGIC]")
					winset(usr,"PARTY.P2XP","is-visible=true;text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")
					var/icon/I = getFlatIcon(P, SOUTH, cache=1)
					I = fcopy_rsc(I)
					winset(usr,"PARTY.P2_ICON","is-visible=true;image='\ref[I]'")
				if(P.Party_Position==3)
					winset(usr,"PARTY.P3_NAME","is-visible=true;text='[P.name]")
					winset(usr,"PARTY.P3LVL","is-visible=true;text='LEVEL [P.LEVEL]")
					winset(usr,"PARTY.P3HP","is-visible=true;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"PARTY.P3MP","is-visible=true;text='MP:[P.MAGIC]/[P.MAX_MAGIC]")
					winset(usr,"PARTY.P3XP","is-visible=true;text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")
					var/icon/I = getFlatIcon(P, SOUTH, cache=1)
					I = fcopy_rsc(I)
					winset(usr,"PARTY.P3_ICON","is-visible=true;image='\ref[I]'")
				if(P.Party_Position==4)
					winset(usr,"PARTY.P4_NAME","is-visible=true;text='[P.name]")
					winset(usr,"PARTY.P4LVL","is-visible=true;text='LEVEL [P.LEVEL]")
					winset(usr,"PARTY.P4HP","is-visible=true;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"PARTY.P4MP","is-visible=true;text='MP:[P.MAGIC]/[P.MAX_MAGIC]")
					winset(usr,"PARTY.P4XP","is-visible=true;text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")
					var/icon/I = getFlatIcon(P, SOUTH, cache=1)
					I = fcopy_rsc(I)
					winset(usr,"PARTY.P4_ICON","is-visible=true;image='\ref[I]'")
				if(P.Party_Position==2&&P==null)
					winset(usr,"PARTY.P2_NAME","is-visible=false;text='[P.name]")
					winset(usr,"PARTY.P2LVL","is-visible=false;text='LEVEL [P.LEVEL]")
					winset(usr,"PARTY.P2HP","is-visible=false;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"PARTY.P2MP","is-visible=false;text='MP:[P.MAGIC]/[P.MAX_MAGIC]")
					winset(usr,"PARTY.P2XP","is-visible=false;text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")
					winset(usr,"PARTY.P2_ICON","is-visible=false")
				if(P.Party_Position==3&&P==null)
					winset(usr,"PARTY.P3_NAME","is-visible=false;text='[P.name]")
					winset(usr,"PARTY.P3LVL","is-visible=false;text='LEVEL [P.LEVEL]")
					winset(usr,"PARTY.P3HP","is-visible=false;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"PARTY.P3MP","is-visible=false;text='MP:[P.MAGIC]/[P.MAX_MAGIC]")
					winset(usr,"PARTY.P3XP","is-visible=false;text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")

					winset(usr,"PARTY.P3_ICON","is-visible=false")
				if(P.Party_Position==4&&P==null)
					winset(usr,"PARTY.P4_NAME","is-visible=false;text='[P.name]")
					winset(usr,"PARTY.P4LVL","is-visible=false;text='LEVEL [P.LEVEL]")
					winset(usr,"PARTY.P4HP","is-visible=false;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"PARTY.P4MP","is-visible=false;text='MP:[P.MAGIC]/[P.MAX_MAGIC]")
					winset(usr,"PARTY.P4XP","is-visible=false;text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")

					winset(usr,"PARTY.P4_ICON","is-visible=false")

		PartyCheck()
			winset(usr,"PARTY.MONEY","text='[usr.moneys]'")
			for(var/Party_Members/P in Party)
				if(P.Party_Position==1)
					winset(usr,"PARTY.P1NAME","text='[P.name]")
					winset(usr,"PARTY.P1_LEVEL","text='LEVEL [P.LEVEL]")
					winset(usr,"PARTY.P1HP","text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"PARTY.P1MP","text='HP:[P.MAGIC]/[P.MAX_MAGIC]")
					winset(usr,"PARTY.P1XP","text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")
					var/icon/I = getFlatIcon(P, SOUTH, cache=1)
					I = fcopy_rsc(I)
					winset(usr,"PARTY.P1_ICON","image='\ref[I]'")
				if(usr.Party.len>=2)
					if(P.Party_Position==2)
						winset(usr,"PARTY.P2_NAME","is-visible=true;text='[P.name]")
						winset(usr,"PARTY.P2LVL","is-visible=true;text='LEVEL [P.LEVEL]")
						winset(usr,"PARTY.P2HP","is-visible=true;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
						winset(usr,"PARTY.P2MP","is-visible=true;text='HP:[P.MAGIC]/[P.MAX_MAGIC]")
						winset(usr,"PARTY.P2XP","is-visible=true;text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")
						var/icon/I = getFlatIcon(P, SOUTH, cache=1)
						I = fcopy_rsc(I)
						winset(usr,"PARTY.P2_ICON","is-visible=true;image='\ref[I]'")
				if(usr.Party.len>=3)
					if(P.Party_Position==3)
						winset(usr,"PARTY.P3_NAME","is-visible=true;text='[P.name]")
						winset(usr,"PARTY.P3LVL","is-visible=true;text='LEVEL [P.LEVEL]")
						winset(usr,"PARTY.P3HP","is-visible=true;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
						winset(usr,"PARTY.P3MP","is-visible=true;text='HP:[P.MAGIC]/[P.MAX_MAGIC]")
						winset(usr,"PARTY.P3XP","is-visible=true;text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")
						var/icon/I = getFlatIcon(P, SOUTH, cache=1)
						I = fcopy_rsc(I)
						winset(usr,"PARTY.P3_ICON","is-visible=true;image='\ref[I]'")
				if(usr.Party.len==4)
					if(P.Party_Position==4)
						winset(usr,"PARTY.P4_NAME","is-visible=true;text='[P.name]")
						winset(usr,"PARTY.P4LVL","is-visible=true;text='LEVEL [P.LEVEL]")
						winset(usr,"PARTY.P4HP","is-visible=true;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
						winset(usr,"PARTY.P4MP","is-visible=true;text='HP:[P.MAGIC]/[P.MAX_MAGIC]")
						winset(usr,"PARTY.P4XP","is-visible=true;text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")
						var/icon/I = getFlatIcon(P, SOUTH, cache=1)
						I = fcopy_rsc(I)
						winset(usr,"PARTY.P4_ICON","is-visible=true;image='\ref[I]'")
				if(usr.Party.len==1&&usr.Party.len<2)
					if(P.Party_Position==2)
						winset(usr,"PARTY.P2_NAME","is-visible=false;text='[P.name]")
						winset(usr,"PARTY.P2LVL","is-visible=false;text='LEVEL [P.LEVEL]")
						winset(usr,"PARTY.P2HP","is-visible=false;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
						winset(usr,"PARTY.P2MP","is-visible=false;text='HP:[P.MAGIC]/[P.MAX_MAGIC]")
						winset(usr,"PARTY.P2XP","is-visible=false;text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")
						winset(usr,"PARTY.P2_ICON","is-visible=false")
				if(usr.Party.len==2&&usr.Party.len<3)
					if(P.Party_Position==3)
						winset(usr,"PARTY.P3_NAME","is-visible=false;text='[P.name]")
						winset(usr,"PARTY.P3LVL","is-visible=false;text='LEVEL [P.LEVEL]")
						winset(usr,"PARTY.P3HP","is-visible=false;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
						winset(usr,"PARTY.P3MP","is-visible=false;text='HP:[P.MAGIC]/[P.MAX_MAGIC]")
						winset(usr,"PARTY.P3XP","is-visible=false;text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")
						winset(usr,"PARTY.P3_ICON","is-visible=false")
				if(usr.Party.len==3&&usr.Party.len<4)
					if(P.Party_Position==4)
						winset(usr,"PARTY.P4_NAME","is-visible=false;text='[P.name]")
						winset(usr,"PARTY.P4LVL","is-visible=false;text='LEVEL [P.LEVEL]")
						winset(usr,"PARTY.P4HP","is-visible=false;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
						winset(usr,"PARTY.P4MP","is-visible=false;text='HP:[P.MAGIC]/[P.MAX_MAGIC]")
						winset(usr,"PARTY.P4XP","is-visible=false;text='[P.MAX_EXP-P.EXP] TO NEXT LEVEL!")
						winset(usr,"PARTY.P4_ICON","is-visible=false")
		PartyCloseItem()
			winset(usr,"ITEMS.P1_NAME","is-visible=false")
			winset(usr,"ITEMS.P1HP","is-visible=false")
			winset(usr,"ITEMS.P1MP","is-visible=false")
			winset(usr,"ITEMS.P1_BUTTON","is-visible=false")
			winset(usr,"ITEMS.P2_NAME","is-visible=false")
			winset(usr,"ITEMS.P2HP","is-visible=false")
			winset(usr,"ITEMS.P2MP","is-visible=false")
			winset(usr,"ITEMS.P2_BUTTON","is-visible=false")
			winset(usr,"ITEMS.P3_NAME","is-visible=false")
			winset(usr,"ITEMS.P3HP","is-visible=false")
			winset(usr,"ITEMS.P3MP","is-visible=false")
			winset(usr,"ITEMS.P3_BUTTON","is-visible=false")
			winset(usr,"ITEMS.P4_NAME","is-visible=false")
			winset(usr,"ITEMS.P4HP","is-visible=false")
			winset(usr,"ITEMS.P4MP","is-visible=false")
			winset(usr,"ITEMS.P4_BUTTON","is-visible=false")
		PartyCheckItem()
			for(var/Party_Members/P in Party)
				if(P.Party_Position==1)
					winset(usr,"ITEMS.P1_NAME","is-visible=true;text='[P.name]")
					winset(usr,"ITEMS.P1HP","is-visible=true;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"ITEMS.P1MP","is-visible=true;text='MP:[P.MAGIC]/[P.MAX_MAGIC]")
					var/icon/I = getFlatIcon(P, SOUTH, cache=1)
					I = fcopy_rsc(I)
					winset(usr,"ITEMS.P1_BUTTON","is-visible=true;image='\ref[I]'")
				if(P.Party_Position==2)
					winset(usr,"ITEMS.P2_NAME","is-visible=true;text='[P.name]")
					winset(usr,"ITEMS.P2HP","is-visible=true;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"ITEMS.P2MP","is-visible=true;text='MP:[P.MAGIC]/[P.MAX_MAGIC]")
					var/icon/I = getFlatIcon(P, SOUTH, cache=1)
					I = fcopy_rsc(I)
					winset(usr,"ITEMS.P2_BUTTON","is-visible=true;image='\ref[I]'")
				if(P.Party_Position==3)
					winset(usr,"ITEMS.P3_NAME","is-visible=true;text='[P.name]")
					winset(usr,"ITEMS.P3HP","is-visible=true;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"ITEMS.P3MP","is-visible=true;text='MP:[P.MAGIC]/[P.MAX_MAGIC]")
					var/icon/I = getFlatIcon(P, SOUTH, cache=1)
					I = fcopy_rsc(I)
					winset(usr,"ITEMS.P3_BUTTON","is-visible=true;image='\ref[I]'")
				if(P.Party_Position==4)
					winset(usr,"ITEMS.P4_NAME","is-visible=true;text='[P.name]")
					winset(usr,"ITEMS.P4HP","is-visible=true;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"ITEMS.P4MP","is-visible=true;text='MP:[P.MAGIC]/[P.MAX_MAGIC]")
					var/icon/I = getFlatIcon(P, SOUTH, cache=1)
					I = fcopy_rsc(I)
					winset(usr,"ITEMS.P4_BUTTON","is-visible=true;image='\ref[I]'")
				if(P.Party_Position==2&&P==null)
					winset(usr,"ITEMS.P2_NAME","is-visible=false;text='[P.name]")
					winset(usr,"ITEMS.P2HP","is-visible=false;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"ITEMS.P2MP","is-visible=false;text='MP:[P.MAGIC]/[P.MAX_MAGIC]")
					winset(usr,"ITEMS.P2_BUTTON","is-visible=false")
				if(P.Party_Position==3&&P==null)
					winset(usr,"ITEMS.P3_NAME","is-visible=false;text='[P.name]")
					winset(usr,"ITEMS.P3HP","is-visible=false;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"ITEMS.P3MP","is-visible=false;text='HP:[P.MAGIC]/[P.MAX_MAGIC]")
					winset(usr,"ITEMS.P3_BUTTON","is-visible=false")
				if(P.Party_Position==4&&P==null)
					winset(usr,"ITEMS.P4_NAME","is-visible=false;text='[P.name]")
					winset(usr,"ITEMS.P4HP","is-visible=false;text='HP:[P.HEALTH]/[P.MAX_HEALTH]")
					winset(usr,"ITEMS.P4MP","is-visible=false;text='HP:[P.MAGIC]/[P.MAX_MAGIC]")
					winset(usr,"ITEMS.P4_BUTTON","is-visible=false")
		Manage()
			winset(usr,"Manage.P4_NAME","is-visible=false")
			winset(usr,"Manage.P4LVL","is-visible=false")
			winset(usr,"Manage.P4_BUTTON","is-visible=true;image='\ref['Characters/null.dmi']'")
			winset(usr,"Manage.P3_NAME","is-visible=false")
			winset(usr,"Manage.P3LVL","is-visible=false")
			winset(usr,"Manage.P3_BUTTON","is-visible=true;image='\ref['Characters/null.dmi']'")
			winset(usr,"Manage.P1_NAME","is-visible=false")
			winset(usr,"Manage.P1LVL","is-visible=false")
			winset(usr,"Manage.P1_BUTTON","is-visible=true;image='\ref['Characters/null.dmi']'")
			winset(usr,"Manage.P2_NAME","is-visible=false")
			winset(usr,"Manage.P2LVL","is-visible=false")
			winset(usr,"Manage.P2_BUTTON","is-visible=true;image='\ref['Characters/null.dmi']'")
			for(var/Party_Members/P in Party)
				if(P.Party_Position==1)
					winset(usr,"Manage.P1_NAME","is-visible=true;text='[P.name]")
					winset(usr,"Manage.P1LVL","is-visible=true;text='LEVEL [P.LEVEL]")
					var/icon/I = getFlatIcon(P, SOUTH, cache=1)
					I = fcopy_rsc(I)
					winset(usr,"Manage.P1_BUTTON","image='\ref[I]'")
				if(P.Party_Position==2)
					winset(usr,"Manage.P2_NAME","is-visible=true;text='[P.name]")
					winset(usr,"Manage.P2LVL","is-visible=true;text='LEVEL [P.LEVEL]")
					var/icon/I = getFlatIcon(P, SOUTH, cache=1)
					I = fcopy_rsc(I)
					winset(usr,"Manage.P2_BUTTON","image='\ref[I]'")
				if(P.Party_Position==3)
					winset(usr,"Manage.P3_NAME","is-visible=true;text='[P.name]")
					winset(usr,"Manage.P3LVL","is-visible=true;text='LEVEL [P.LEVEL]")
					var/icon/I = getFlatIcon(P, SOUTH, cache=1)
					I = fcopy_rsc(I)
					winset(usr,"Manage.P3_BUTTON","is-visible=true;image='\ref[I]'")
				if(P.Party_Position==4)
					winset(usr,"Manage.P4_NAME","is-visible=true;text='[P.name]")
					winset(usr,"Manage.P4LVL","is-visible=true;text='LEVEL [P.LEVEL]")
					var/icon/I = getFlatIcon(P, SOUTH, cache=1)
					I = fcopy_rsc(I)
					winset(usr,"Manage.P4_BUTTON","image='\ref[I]'")
				winset(usr,"Manage.P1_BORDER","is-visible=false")
				winset(usr,"Manage.P2_BORDER","is-visible=false")
				winset(usr,"Manage.P3_BORDER","is-visible=false")
				winset(usr,"Manage.P4_BORDER","is-visible=false")
				winset(usr,"Manage.ERROR","is-visible=false")


				usr.managing=0
				var/I = 0
				for(var/Party_Members/O in src.Reserves)//Loop through all the items in the players contents
					winset(src, "Manage.PartyMembers", "current-cell=1,[++I]")	//Add multiple cells horizontally for each obj
					src << output(O, "Manage.PartyMembers")//Send the obj's in src.contents to the Grid
				winset(src,"Manage.PartyMembers", "cells=[I]")

obj
	ICON
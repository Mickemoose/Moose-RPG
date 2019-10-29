mob
	proc
		AutoSave()
			spawn(10)
				if(!IN_BATTLE)
					Info("Auto Saving...")
					Save()
				//	WorldSave()
					spawn(18)
						for(var/obj/INFOBOX/C2 in client.screen)
							Maptext(C2, "", "white", add_outline = 0)
							animate(C2, transform = matrix()*-1, time = 4)
							spawn(1.4)
								del(C2)
				spawn(1000)
					AutoSave()
mob/proc
	WorldSave()
		var/savefile/F = new("Savefiles/WORLD.sav")
		for(var/DOOR/D in world)
			F["houseowner"] << D.houseowner
			F["locked"] << D.locked
			F["price"] << D.price
			F["npc"] << D.npc
			F["entryx"] << D.entryx
			F["entryy"] << D.entryy
			F["entryz"] << D.entryz
			F["status"] << D.status
		for(var/obj/Time/T in world)
			F["day"] << T.day
			F["daynum"] << T.dayNum
			F["minute"] << T.minute
			F["month"] << T.season
			F["hour"] << T.hour
			F["CurrentTimeOfDay"] << T.cTOD
		usr.client.Export(F)
	WorldLoad()
		if(fexists("Savefiles/WORLD.sav")) // if there is a file
			var/savefile/F = new("Savefiles/WORLD.sav")
			Read(F)
			for(var/DOOR/D in world)
				F["houseowner"] >> D.houseowner
				F["locked"] >> D.locked
				F["price"] >> D.price
				F["npc"] >> D.npc
				F["entryx"] >> D.entryx
				F["entryy"] >> D.entryy
				F["entryz"] >> D.entryz
				F["status"] >> D.status
			for(var/obj/Time/T in world)
				F["day"] >> T.day
				F["daynum"] >> T.dayNum
				F["minute"] >> T.minute
				F["month"] >> T.season
				F["hour"] >> T.hour
				F["CurrentTimeOfDay"] >> T.cTOD
				T.ForceDayCheck()
mob
	proc // tell it evry thing below is a proc
		Save() // name the proc
			WorldSave()
			var/savefile/F = new("Savefiles/[src.key].sav") // tell it to make a updated savefile
			F["first_login"] << src.first_login
			F["Party"] << src.Party
			F["lastx"] << src.lastx
			F["lasty"] << src.lasty
			F["lastz"] << src.lastz
			F["icon"] << src.icon
			F["Reserves"] << src.Reserves
			F["Recipes"] << src.Recipes
			F["Items"] << src.Items
			F["IN_SAFE"] << src.IN_SAFE
			F["moneys"] << src.moneys
			F["x"] << src.x
			F["y"] << src.y
			F["z"] << src.z
			F["Region"] << src.Region
			F["KeyItems"] << src.KeyItems
			F["Equipment"] << src.Equipment
			F["Materials"] << src.Materials
			F["REPEL"] << src.REPEL
			for(var/EQUIPMENT/E in src.Equipment)
				F<<E
			for(var/Party_Members/P in src.Reserves)
				F["LEVEL"] << P.LEVEL
				F["HEALTH"] << P.HEALTH
				F["MAX_HEALTH"] << P.MAX_HEALTH
				F["MAGIC"] << P.MAGIC
				F["MAX_MAGIC"] << P.MAX_MAGIC
				F["EXP"] << P.EXP
				F["MAX_EXP"] << P.MAX_EXP
				F["OVERLAYS"] << P.overlays
				F["SKILL1"] << P.SKILL1
				F["SKILL2"] << P.SKILL2
				F["SKILL3"] << P.SKILL3
				F["WEAPON_TYPE"] << P.WEAPON_TYPE
				F["WEAPON_SLOT"] << P.WEAPON_SLOT
				F["HEAD_SLOT"] << P.HEAD_SLOT
				F["head_overlay"] << P.head_overlay
				F["HAIR_SLOT"] << P.HAIR_SLOT
				F["hair_overlay"] << P.hair_overlay
				F["ATTACK_ELEMENT"] << P.ATTACK_ELEMENT
				F["MASK_SLOT"] << P.MASK_SLOT
				F["mask_overlay"] << P.mask_overlay
				F["OUTFIT_SLOT"] >> P.OUTFIT_SLOT
				F["outfit_overlay"] << P.outfit_overlay
				F["STRENGTH"] << P.STRENGTH
				F["DEFENSE"] << P.DEFENSE
				F["ACCURACY"] << P.ACCURACY
				F["FIRE_RESIST"] << P.FIRE_RESIST
				F["POISON_RESIST"] << P.POISON_RESIST
				F["STRENGTH_ADDED"] << P.STRENGTH_ADDED
				F["DEFENSE_ADDED"] << P.DEFENSE_ADDED
				F["ACC_ADDED"] << P.ACC_ADDED
				F["POIRESIST_ADDED"] << P.POIRESIST_ADDED
				F["FIRERESIST_ADDED"] << P.FIRERESIST_ADDED
				F["mask_overlay"] << P.mask_overlay
				F["eye_overlay"] << P.eye_overlay
				F["EYE_SLOT"] << P.EYE_SLOT
				F["weapon_overlay"] << P.weapon_overlay
				F["Party_Position"] << P.Party_Position
			for(var/Party_Members/P in src.Party)
				if(P.Party_Position==1)
					F["P1-LEVEL"] << P.LEVEL
					F["P1-HEALTH"] << P.HEALTH
					F["P1-MAX_HEALTH"] << P.MAX_HEALTH
					F["P1-MAGIC"] << P.MAGIC
					F["P1-MAX_MAGIC"] << P.MAX_MAGIC
					F["P1-EXP"] << P.EXP
					F["P1-MAX_EXP"] << P.MAX_EXP
					F["P1-OVERLAYS"] << P.overlays
					F["P1-SKILL1"] << P.SKILL1
					F["P1-SKILL2"] << P.SKILL2
					F["P1-SKILL3"] << P.SKILL3
					F["P1-WEAPON_SLOT"] << P.WEAPON_SLOT
					F["P1-WEAPON_TYPE"] << P.WEAPON_TYPE
					F["P1-weapon_overlay"] << P.weapon_overlay
					F["P1-HEAD_SLOT"] << P.HEAD_SLOT
					F["P1-head_overlay"] << P.head_overlay
					F["P1-HAIR_SLOT"] << P.HAIR_SLOT
					F["P1-hair_overlay"] << P.hair_overlay
					F["P1-Party_Position"] << P.Party_Position
					F["P1-MASK_SLOT"] << P.MASK_SLOT
					F["P1-mask_overlay"] << P.mask_overlay
					F["P1-OUTFIT_SLOT"] << P.OUTFIT_SLOT
					F["P1-outfit_overlay"] << P.outfit_overlay
					F["P1-STRENGTH"] << P.STRENGTH
					F["P1-DEFENSE"] << P.DEFENSE
					F["P1-ACCURACY"] << P.ACCURACY
					F["P1-FIRE_RESIST"] << P.FIRE_RESIST
					F["P1-POISON_RESIST"] << P.POISON_RESIST
					F["P1-STRENGTH_ADDED"] << P.STRENGTH_ADDED
					F["P1-DEFENSE_ADDED"] << P.DEFENSE_ADDED
					F["P1-ACC_ADDED"] << P.ACC_ADDED
					F["P1-POIRESIST_ADDED"] << P.POIRESIST_ADDED
					F["P1-FIRERESIST_ADDED"] << P.FIRERESIST_ADDED
					F["P1-ATTACK_ELEMENT"] << P.ATTACK_ELEMENT
					F["P1-mask_overlay"] << P.mask_overlay
					F["P1-eye_overlay"] << P.eye_overlay
					F["P1-EYE_SLOT"] << P.EYE_SLOT
				if(P.Party_Position==2)
					F["P2-LEVEL"] << P.LEVEL
					F["P2-HEALTH"] << P.HEALTH
					F["P2-MAX_HEALTH"] << P.MAX_HEALTH
					F["P2-MAGIC"] << P.MAGIC
					F["P2-MAX_MAGIC"] << P.MAX_MAGIC
					F["P2-EXP"] << P.EXP
					F["P2-MAX_EXP"] << P.MAX_EXP
					F["P2-OVERLAYS"] << P.overlays
					F["P2-SKILL1"] << P.SKILL1
					F["P2-SKILL2"] << P.SKILL2
					F["P2-SKILL3"] << P.SKILL3
					F["P2-WEAPON_TYPE"] << P.WEAPON_TYPE
					F["P2-WEAPON_SLOT"] << P.WEAPON_SLOT
					F["P2-HEAD_SLOT"] << P.HEAD_SLOT
					F["P2-head_overlay"] << P.head_overlay
					F["P2-HAIR_SLOT"] << P.HAIR_SLOT
					F["P2-hair_overlay"] << P.hair_overlay
					F["P2-weapon_overlay"] << P.weapon_overlay
					F["P2-Party_Position"] << P.Party_Position
					F["P2-MASK_SLOT"] << P.MASK_SLOT
					F["P2-mask_overlay"] << P.mask_overlay
					F["P2-OUTFIT_SLOT"] << P.OUTFIT_SLOT
					F["P2-ATTACK_ELEMENT"] << P.ATTACK_ELEMENT
					F["P2-outfit_overlay"] << P.outfit_overlay
					F["P2-STRENGTH"] << P.STRENGTH
					F["P2-DEFENSE"] << P.DEFENSE
					F["P2-ACCURACY"] << P.ACCURACY
					F["P2-FIRE_RESIST"] << P.FIRE_RESIST
					F["P2-POISON_RESIST"] << P.POISON_RESIST
					F["P2-STRENGTH_ADDED"] << P.STRENGTH_ADDED
					F["P2-DEFENSE_ADDED"] << P.DEFENSE_ADDED
					F["P2-ACC_ADDED"] << P.ACC_ADDED
					F["P2-POIRESIST_ADDED"] << P.POIRESIST_ADDED
					F["P2-FIRERESIST_ADDED"] << P.FIRERESIST_ADDED
					F["P2-mask_overlay"] << P.mask_overlay
					F["P2-eye_overlay"] << P.eye_overlay
					F["P2-EYE_SLOT"] << P.EYE_SLOT
				if(P.Party_Position==3)
					F["P3-LEVEL"] << P.LEVEL
					F["P3-HEALTH"] << P.HEALTH
					F["P3-MAX_HEALTH"] << P.MAX_HEALTH
					F["P3-MAGIC"] << P.MAGIC
					F["P3-MAX_MAGIC"] << P.MAX_MAGIC
					F["P3-EXP"] << P.EXP
					F["P3-MAX_EXP"] << P.MAX_EXP
					F["P3-OVERLAYS"] << P.overlays
					F["P3-SKILL1"] << P.SKILL1
					F["P3-SKILL2"] << P.SKILL2
					F["P3-WEAPON_TYPE"] << P.WEAPON_TYPE
					F["P3-SKILL3"] << P.SKILL3
					F["P3-HEAD_SLOT"] << P.HEAD_SLOT
					F["P3-head_overlay"] << P.head_overlay
					F["P3-HAIR_SLOT"] << P.HAIR_SLOT
					F["P3-hair_overlay"] << P.hair_overlay
					F["P3-WEAPON_SLOT"] << P.WEAPON_SLOT
					F["P3-weapon_overlay"] << P.weapon_overlay
					F["P3-Party_Position"] << P.Party_Position
					F["P3-MASK_SLOT"] << P.MASK_SLOT
					F["P3-ATTACK_ELEMENT"] << P.ATTACK_ELEMENT
					F["P3-mask_overlay"] << P.mask_overlay
					F["P3-OUTFIT_SLOT"] << P.OUTFIT_SLOT
					F["P3-outfit_overlay"] << P.outfit_overlay
					F["P3-STRENGTH"] << P.STRENGTH
					F["P3-DEFENSE"] << P.DEFENSE
					F["P3-ACCURACY"] << P.ACCURACY
					F["P3-FIRE_RESIST"] << P.FIRE_RESIST
					F["P3-POISON_RESIST"] << P.POISON_RESIST
					F["P3-STRENGTH_ADDED"] << P.STRENGTH_ADDED
					F["P3-DEFENSE_ADDED"] << P.DEFENSE_ADDED
					F["P3-ACC_ADDED"] << P.ACC_ADDED
					F["P3-POIRESIST_ADDED"] << P.POIRESIST_ADDED
					F["P3-FIRERESIST_ADDED"] << P.FIRERESIST_ADDED
					F["P3-mask_overlay"] << P.mask_overlay
					F["P3-eye_overlay"] << P.eye_overlay
					F["P3-EYE_SLOT"] << P.EYE_SLOT
				if(P.Party_Position==4)
					F["P4-LEVEL"] << P.LEVEL
					F["P4-HEALTH"] << P.HEALTH
					F["P4-MAX_HEALTH"] << P.MAX_HEALTH
					F["P4-MAGIC"] << P.MAGIC
					F["P4-MAX_MAGIC"] << P.MAX_MAGIC
					F["P4-EXP"] << P.EXP
					F["P4-MAX_EXP"] << P.MAX_EXP
					F["P4-OVERLAYS"] << P.overlays
					F["P4-SKILL1"] << P.SKILL1
					F["P4-SKILL2"] << P.SKILL2
					F["P4-SKILL3"] << P.SKILL3
					F["P4-ATTACK_ELEMENT"] << P.ATTACK_ELEMENT
					F["P4-HEAD_SLOT"] << P.HEAD_SLOT
					F["P4-WEAPON_TYPE"] << P.WEAPON_TYPE
					F["P4-head_overlay"] << P.head_overlay
					F["P4-HAIR_SLOT"] << P.HAIR_SLOT
					F["P4-hair_overlay"] << P.hair_overlay
					F["P4-WEAPON_SLOT"] << P.WEAPON_SLOT
					F["P4-weapon_overlay"] << P.weapon_overlay
					F["P4-Party_Position"] << P.Party_Position
					F["P4-MASK_SLOT"] << P.MASK_SLOT
					F["P4-mask_overlay"] << P.mask_overlay
					F["P4-OUTFIT_SLOT"] << P.OUTFIT_SLOT
					F["P4-outfit_overlay"] << P.outfit_overlay
					F["P4-STRENGTH"] << P.STRENGTH
					F["P4-DEFENSE"] << P.DEFENSE
					F["P4-ACCURACY"] << P.ACCURACY
					F["P4-FIRE_RESIST"] << P.FIRE_RESIST
					F["P4-POISON_RESIST"] << P.POISON_RESIST
					F["P4-STRENGTH_ADDED"] << P.STRENGTH_ADDED
					F["P4-DEFENSE_ADDED"] << P.DEFENSE_ADDED
					F["P4-ACC_ADDED"] << P.ACC_ADDED
					F["P4-POIRESIST_ADDED"] << P.POIRESIST_ADDED
					F["P4-FIRERESIST_ADDED"] << P.FIRERESIST_ADDED
					F["P4-mask_overlay"] << P.mask_overlay
					F["P4-eye_overlay"] << P.eye_overlay
					F["P4-EYE_SLOT"] << P.EYE_SLOT

			usr.client.Export(F) // export the updated file to its folder



		Load() // name the proc
			if(fexists("Savefiles/[src.key].sav")) // if there is a file
				var/savefile/F = new("Savefiles/[src.key].sav")
				Read(F)
				F["first_login"] >> src.first_login
				F["Party"] >> src.Party
				F["icon"] >> src.icon
				F["Reserves"] >> src.Reserves
				F["Recipes"] >> src.Recipes
				F["Items"] >> src.Items
				F["IN_SAFE"] >> src.IN_SAFE
				F["lastx"] >> src.lastx
				F["lasty"] >> src.lasty
				F["lastz"] >> src.lastz
				F["moneys"] >> src.moneys
				F["x"] >> src.x
				F["y"] >> src.y
				F["z"] >> src.z
				F["Region"] >> src.Region
				F["KeyItems"] >> src.KeyItems
				F["Equipment"] >> src.Equipment
				F["Materials"] >> src.Materials
				F["REPEL"] >> src.REPEL
				for(var/EQUIPMENT/E in src.Equipment)
					F>>E
				for(var/Party_Members/P in src.Reserves)
					F["LEVEL"] >> P.LEVEL
					F["HEALTH"] >> P.HEALTH
					F["MAX_HEALTH"] >> P.MAX_HEALTH
					F["MAGIC"] >> P.MAGIC
					F["MAX_MAGIC"] >> P.MAX_MAGIC
					F["EXP"] >> P.EXP
					F["MAX_EXP"] >> P.MAX_EXP
					F["OVERLAYS"] >> P.overlays
					F["SKILL1"] >> P.SKILL1
					F["SKILL2"] >> P.SKILL2
					F["SKILL3"] >> P.SKILL3
					F["WEAPON_TYPE"] >> P.WEAPON_TYPE
					F["WEAPON_SLOT"] >> P.WEAPON_SLOT
					F["HEAD_SLOT"] >> P.HEAD_SLOT
					F["head_overlay"] >> P.head_overlay
					F["HAIR_SLOT"] >> P.HAIR_SLOT
					F["hair_overlay"] >> P.hair_overlay
					F["ATTACK_ELEMENT"] >> P.ATTACK_ELEMENT
					F["MASK_SLOT"] >> P.MASK_SLOT
					F["mask_overlay"] >> P.mask_overlay
					F["OUTFIT_SLOT"] >> P.OUTFIT_SLOT
					F["outfit_overlay"] >> P.outfit_overlay
					F["STRENGTH"] >> P.STRENGTH
					F["DEFENSE"] >> P.DEFENSE
					F["ACCURACY"] >> P.ACCURACY
					F["FIRE_RESIST"] >> P.FIRE_RESIST
					F["POISON_RESIST"] >> P.POISON_RESIST
					F["STRENGTH_ADDED"] >> P.STRENGTH_ADDED
					F["DEFENSE_ADDED"] >> P.DEFENSE_ADDED
					F["ACC_ADDED"] >> P.ACC_ADDED
					F["POIRESIST_ADDED"] >> P.POIRESIST_ADDED
					F["FIRERESIST_ADDED"] >> P.FIRERESIST_ADDED
					F["mask_overlay"] >> P.mask_overlay
					F["eye_overlay"] >> P.eye_overlay
					F["EYE_SLOT"] >> P.EYE_SLOT
					F["weapon_overlay"] >> P.weapon_overlay
					F["Party_Position"] >> P.Party_Position
				for(var/Party_Members/P in src.Party)
					if(P.Party_Position==1)
						F["P1-LEVEL"] >> P.LEVEL
						F["P1-HEALTH"] >> P.HEALTH
						F["P1-MAX_HEALTH"] >> P.MAX_HEALTH
						F["P1-MAGIC"] >> P.MAGIC
						F["P1-MAX_MAGIC"] >> P.MAX_MAGIC
						F["P1-EXP"] >> P.EXP
						F["P1-MAX_EXP"] >> P.MAX_EXP
						F["P1-OVERLAYS"] >> P.overlays
						F["P1-SKILL1"] >> P.SKILL1
						F["P1-SKILL2"] >> P.SKILL2
						F["P1-SKILL3"] >> P.SKILL3
						F["P1-WEAPON_TYPE"] >> P.WEAPON_TYPE
						F["P1-WEAPON_SLOT"] >> P.WEAPON_SLOT
						F["P1-HEAD_SLOT"] >> P.HEAD_SLOT
						F["P1-head_overlay"] >> P.head_overlay
						F["P1-HAIR_SLOT"] >> P.HAIR_SLOT
						F["P1-hair_overlay"] >> P.hair_overlay
						F["P1-ATTACK_ELEMENT"] >> P.ATTACK_ELEMENT
						F["P1-MASK_SLOT"] >> P.MASK_SLOT
						F["P1-mask_overlay"] >> P.mask_overlay
						F["P1-OUTFIT_SLOT"] >> P.OUTFIT_SLOT
						F["P1-outfit_overlay"] >> P.outfit_overlay
						F["P1-STRENGTH"] >> P.STRENGTH
						F["P1-DEFENSE"] >> P.DEFENSE
						F["P1-ACCURACY"] >> P.ACCURACY
						F["P1-FIRE_RESIST"] >> P.FIRE_RESIST
						F["P1-POISON_RESIST"] >> P.POISON_RESIST
						F["P1-STRENGTH_ADDED"] >> P.STRENGTH_ADDED
						F["P1-DEFENSE_ADDED"] >> P.DEFENSE_ADDED
						F["P1-ACC_ADDED"] >> P.ACC_ADDED
						F["P1-POIRESIST_ADDED"] >> P.POIRESIST_ADDED
						F["P1-FIRERESIST_ADDED"] >> P.FIRERESIST_ADDED
						F["P1-mask_overlay"] >> P.mask_overlay
						F["P1-eye_overlay"] >> P.eye_overlay
						F["P1-EYE_SLOT"] >> P.EYE_SLOT
						F["P1-weapon_overlay"] >> P.weapon_overlay
						F["P1-Party_Position"] >> P.Party_Position
					if(P.Party_Position==2)
						F["P2-LEVEL"] >> P.LEVEL
						F["P2-HEALTH"] >> P.HEALTH
						F["P2-MAX_HEALTH"] >> P.MAX_HEALTH
						F["P2-MAGIC"] >> P.MAGIC
						F["P2-MAX_MAGIC"] >> P.MAX_MAGIC
						F["P2-EXP"] >> P.EXP
						F["P2-MAX_EXP"] >> P.MAX_EXP
						F["P2-OVERLAYS"] >> P.overlays
						F["P2-SKILL1"] >> P.SKILL1
						F["P2-SKILL2"] >> P.SKILL2
						F["P2-SKILL3"]>>P.SKILL3
						F["P2-HEAD_SLOT"] >> P.HEAD_SLOT
						F["P2-WEAPON_TYPE"] >> P.WEAPON_TYPE
						F["P2-head_overlay"] >> P.head_overlay
						F["P2-WEAPON_SLOT"] >> P.WEAPON_SLOT
						F["P2-HAIR_SLOT"] >> P.HAIR_SLOT
						F["P2-hair_overlay"] >> P.hair_overlay
						F["P2-weapon_overlay"] >>P.weapon_overlay
						F["P2-Party_Position"] >> P.Party_Position
						F["P2-MASK_SLOT"] >> P.MASK_SLOT
						F["P2-mask_overlay"] >> P.mask_overlay
						F["P2-OUTFIT_SLOT"] >> P.OUTFIT_SLOT
						F["P2-outfit_overlay"] >> P.outfit_overlay
						F["P2-STRENGTH"] >> P.STRENGTH
						F["P2-DEFENSE"] >> P.DEFENSE
						F["P2-ACCURACY"] >> P.ACCURACY
						F["P2-FIRE_RESIST"] >> P.FIRE_RESIST
						F["P2-ATTACK_ELEMENT"] >> P.ATTACK_ELEMENT
						F["P2-POISON_RESIST"] >> P.POISON_RESIST
						F["P2-STRENGTH_ADDED"] >> P.STRENGTH_ADDED
						F["P2-DEFENSE_ADDED"] >> P.DEFENSE_ADDED
						F["P2-ACC_ADDED"] >> P.ACC_ADDED
						F["P2-POIRESIST_ADDED"] >> P.POIRESIST_ADDED
						F["P2-FIRERESIST_ADDED"] >> P.FIRERESIST_ADDED
						F["P2-mask_overlay"] >> P.mask_overlay
						F["P2-eye_overlay"] >> P.eye_overlay
						F["P2-EYE_SLOT"] >> P.EYE_SLOT
					if(P.Party_Position==3)
						F["P3-LEVEL"] >> P.LEVEL
						F["P3-HEALTH"] >> P.HEALTH
						F["P3-MAX_HEALTH"] >> P.MAX_HEALTH
						F["P3-MAGIC"] >> P.MAGIC
						F["P3-MAX_MAGIC"]>> P.MAX_MAGIC
						F["P3-EXP"] >> P.EXP
						F["P3-MAX_EXP"] >> P.MAX_EXP
						F["P3-OVERLAYS"] >> P.overlays
						F["P3-SKILL1"] >> P.SKILL1
						F["P3-SKILL2"] >> P.SKILL2
						F["P3-SKILL3"] >> P.SKILL3
						F["P3-WEAPON_TYPE"] >> P.WEAPON_TYPE
						F["P3-HEAD_SLOT"] >> P.HEAD_SLOT
						F["P3-HAIR_SLOT"] >> P.HAIR_SLOT
						F["P3-hair_overlay"] >> P.hair_overlay
						F["P3-head_overlay"] >> P.head_overlay
						F["P3-WEAPON_SLOT"] >> P.WEAPON_SLOT
						F["P3-ATTACK_ELEMENT"] >> P.ATTACK_ELEMENT
						F["P3-weapon_overlay"] >> P.weapon_overlay
						F["P3-Party_Position"] >> P.Party_Position
						F["P3-MASK_SLOT"] >> P.MASK_SLOT
						F["P3-mask_overlay"] >> P.mask_overlay
						F["P3-OUTFIT_SLOT"] >> P.OUTFIT_SLOT
						F["P3-outfit_overlay"] >> P.outfit_overlay
						F["P3-STRENGTH"] >> P.STRENGTH
						F["P3-DEFENSE"] >> P.DEFENSE
						F["P3-ACCURACY"] >> P.ACCURACY
						F["P3-FIRE_RESIST"] >> P.FIRE_RESIST
						F["P3-POISON_RESIST"] >> P.POISON_RESIST
						F["P3-STRENGTH_ADDED"] >> P.STRENGTH_ADDED
						F["P3-DEFENSE_ADDED"] >> P.DEFENSE_ADDED
						F["P3-ACC_ADDED"] >> P.ACC_ADDED
						F["P3-POIRESIST_ADDED"] >> P.POIRESIST_ADDED
						F["P3-FIRERESIST_ADDED"] >> P.FIRERESIST_ADDED
						F["P3-mask_overlay"] >> P.mask_overlay
						F["P3-eye_overlay"] >> P.eye_overlay
						F["P3-EYE_SLOT"] >> P.EYE_SLOT
					if(P.Party_Position==4)
						F["P4-LEVEL"] >> P.LEVEL
						F["P4-HEALTH"] >> P.HEALTH
						F["P4-MAX_HEALTH"] >> P.MAX_HEALTH
						F["P4-MAGIC"] >> P.MAGIC
						F["P4-MAX_MAGIC"]>> P.MAX_MAGIC
						F["P4-EXP"] >> P.EXP
						F["P4-MAX_EXP"] >> P.MAX_EXP
						F["P4-OVERLAYS"] >> P.overlays
						F["P4-SKILL1"] >> P.SKILL1
						F["P4-SKILL2"] >> P.SKILL2
						F["P4-SKILL3"] >> P.SKILL3
						F["P4-HEAD_SLOT"] >> P.HEAD_SLOT
						F["P4-ATTACK_ELEMENT"] >> P.ATTACK_ELEMENT
						F["P4-HAIR_SLOT"] >> P.HAIR_SLOT
						F["P4-hair_overlay"] >> P.hair_overlay
						F["P4-head_overlay"] >> P.head_overlay
						F["P4-WEAPON_SLOT"] >> P.WEAPON_SLOT
						F["P4-WEAPON_TYPE"] >> P.WEAPON_TYPE
						F["P4-weapon_overlay"] >> P.weapon_overlay
						F["P4-Party_Position"] >> P.Party_Position
						F["P4-MASK_SLOT"] >> P.MASK_SLOT
						F["P4-mask_overlay"] >> P.mask_overlay
						F["P4-OUTFIT_SLOT"] >> P.OUTFIT_SLOT
						F["P4-outfit_overlay"] >> P.outfit_overlay
						F["P4-STRENGTH"] >> P.STRENGTH
						F["P4-DEFENSE"] >> P.DEFENSE
						F["P4-ACCURACY"] >> P.ACCURACY
						F["P4-FIRE_RESIST"] >> P.FIRE_RESIST
						F["P4-POISON_RESIST"] >> P.POISON_RESIST
						F["P4-STRENGTH_ADDED"] >> P.STRENGTH_ADDED
						F["P4-DEFENSE_ADDED"] >> P.DEFENSE_ADDED
						F["P4-ACC_ADDED"] >> P.ACC_ADDED
						F["P4-POIRESIST_ADDED"] >> P.POIRESIST_ADDED
						F["P4-FIRERESIST_ADDED"] >> P.FIRERESIST_ADDED
						F["P4-mask_overlay"] >> P.mask_overlay
						F["P4-eye_overlay"] >> P.eye_overlay
						F["P4-EYE_SLOT"] >> P.EYE_SLOT


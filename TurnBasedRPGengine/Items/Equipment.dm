EQUIPMENT
	parent_type= /obj
	var
		CHARACTER_LOCK = null
		STRENGTH = 0
		DEFENSE = 0
		EQUIPPED = 0
		ACCURACY = 0
		FIRE_RESIST = 0
		POISON_RESIST = 0
		ELEMENT = "NONE"
		TYPE = "NONE"
		TRUE_NAME=""
		SUFFIX = "{E}"
		HAIR_REMOVAL = 0

	WEAPONS
		layer=10
		TYPE = "SWORD"
		GUNS
			TYPE = "GUN"
			Gamma_Ray
				pixel_x=-8
				pixel_y=-6
				TRUE_NAME="Gamma Ray"
				STRENGTH= 8
				ACCURACY= 4
				icon='Equipment/Weapon/Gun/GammaBlaster.dmi'
		Gamma_Vector
			pixel_x=-8
			pixel_y=-6
			TRUE_NAME="Gamma Vector"
			STRENGTH= 14
			ELEMENT = "BOLT"
			icon='Equipment/Weapon/GammaShocker.dmi'
		Boo_Axe
			TRUE_NAME="Spooky Chopper"
			pixel_x=-8
			pixel_y=-6
			STRENGTH=14
			icon='Equipment/Sets/Boo/Axe.dmi'
		Iron
			Broadsword
				//pixel_x=-8
				//pixel_y=-6
				TRUE_NAME="Broadsword"
				STRENGTH= 6
				icon='Equipment/Weapon/Broadsword.dmi'

		DEREK
			CHARACTER_LOCK = "Derek"
			Tempestra_Blade
				TRUE_NAME="Tempestra Blade"
				pixel_x=-8
				pixel_y=-6
				STRENGTH=8
				icon='Equipment/Weapon/TempestraBlade.dmi'
		HUNTER
			CHARACTER_LOCK = "Hunter"
			Voidslayer
				TRUE_NAME="Voidslayer"
				pixel_x=-8
				pixel_y=-6
				STRENGTH=8
				icon='Equipment/Weapon/SpawnFakeSword.dmi'
		DblClick()
			for(var/Party_Members/P in usr.Party)
				if(usr.Equipping==P)
					if(P.WEAPON_SLOT=="NONE" && src.EQUIPPED==0)
						src.EQUIPPED=1
						usr<<equip
						P.WEAPON_SLOT="[src]"
						name="[name][SUFFIX]"
						P.STRENGTH_ADDED+=src.STRENGTH
						P.ACC_ADDED+=src.ACCURACY
						P.WEAPON_TYPE="[src.TYPE]"
						P.ATTACK_ELEMENT="[src.ELEMENT]"
						P.weapon_overlay=src.icon
						P.overlays+=P.weapon_overlay
						usr.EquipUpdate()
						return
					else if(P.WEAPON_SLOT=="[TRUE_NAME]")
						usr<<equip
						src.EQUIPPED=0
						name="[TRUE_NAME]"
						P.STRENGTH_ADDED-=src.STRENGTH
						P.ACC_ADDED-=src.ACCURACY
						P.ATTACK_ELEMENT="NONE"
						P.WEAPON_TYPE="SWORD"
						P.overlays-=P.weapon_overlay
						P.WEAPON_SLOT="NONE"
						usr.EquipUpdate()
						return


	ARMOR
		MASK
			layer=7
			Gamma_Visor
				icon='Equipment/Mask/GammaVisor.dmi'
				DEFENSE=4
				ACCURACY = 8
				TRUE_NAME="Gamma Visor"
			Glasses
				icon='Equipment/Mask/Glasses.dmi'
				DEFENSE=1
				ACCURACY = 5
				TRUE_NAME="Glasses"
			DblClick()
				for(var/Party_Members/P in usr.Party)
					if(usr.Equipping==P)
						if(P.MASK_SLOT=="NONE" && src.EQUIPPED==0)
							src.EQUIPPED=1
							usr<<equip
							P.MASK_SLOT="[src]"
							name="[name][SUFFIX]"
							P.DEFENSE_ADDED+=src.DEFENSE
							P.ACC_ADDED += src.ACCURACY
							P.FIRERESIST_ADDED+=src.FIRE_RESIST
							P.POIRESIST_ADDED+=src.POISON_RESIST
							P.mask_overlay=src.icon
							P.overlays+=P.mask_overlay
							usr.EquipUpdate()
							return
						else if(P.MASK_SLOT=="[TRUE_NAME]")
							usr<<equip
							src.EQUIPPED=0
							name="[TRUE_NAME]"
							P.DEFENSE_ADDED-=src.DEFENSE
							P.ACC_ADDED -= src.ACCURACY
							P.FIRERESIST_ADDED-=src.FIRE_RESIST
							P.POIRESIST_ADDED-=src.POISON_RESIST
							P.overlays-=P.mask_overlay
							P.MASK_SLOT="NONE"
							usr.EquipUpdate()
							return
		HEAD
			layer=9
			White_Beanie
				DEFENSE=1
				HAIR_REMOVAL=0
				TRUE_NAME="White Beanie"
				icon='Equipment/Head/Beanie.dmi'
			Dragoon_Helmet
				DEFENSE=6
				HAIR_REMOVAL=1
				TRUE_NAME="Dragoon Helmet"
				icon='Equipment/Head/DragoonHelmet.dmi'
				FIRE_RESIST=4
			Boo_Helmet
				DEFENSE=5
				HAIR_REMOVAL=0
				TRUE_NAME="Boo Helmet"
				icon='Equipment/Sets/Boo/Helm.dmi'
				POISON_RESIST=4
			Lugia_Helmet
				DEFENSE=25
				HAIR_REMOVAL=1
				TRUE_NAME="Lugia Helmet"
				icon='Equipment/Head/LugiaHelmet.dmi'
				FIRE_RESIST=10
			Sacred_Helmet
				DEFENSE=25
				HAIR_REMOVAL=0
				TRUE_NAME="Sacred Helmet"
				icon='Equipment/Sets/HoOh/Helmet.dmi'
				FIRE_RESIST=12
			Prazon_Helmet
				DEFENSE=4
				HAIR_REMOVAL=1
				TRUE_NAME="Prazon Helmet"
				icon='Equipment/Head/PrazonHelmet.dmi'
				POISON_RESIST=4
			Metool_Helmet
				DEFENSE=10
				HAIR_REMOVAL=1
				TRUE_NAME="Metool Hard-Hat"
				icon='Equipment/Head/MetoolHelm.dmi'
			Mario_Cap
				DEFENSE=6
				HAIR_REMOVAL=1
				TRUE_NAME="Mario's Cap"
				icon='Equipment/Head/MarioCap.dmi'
				FIRE_RESIST=5
			Luigi_Cap
				DEFENSE=6
				HAIR_REMOVAL=1
				TRUE_NAME="Luigi's Cap"
				icon='Equipment/Head/LuigiCap.dmi'
				FIRE_RESIST=5
			Wario_Cap
				DEFENSE=6
				HAIR_REMOVAL=1
				TRUE_NAME="Wario's Cap"
				icon='Equipment/Head/WarioCap.dmi'
				FIRE_RESIST=5
			Waluigi_Cap
				DEFENSE=6
				HAIR_REMOVAL=1
				TRUE_NAME="Waluigi's Cap"
				icon='Equipment/Head/WaluigiCap.dmi'
				FIRE_RESIST=5
			DblClick()
				for(var/Party_Members/P in usr.Party)
					if(usr.Equipping==P)
						if(P.HEAD_SLOT=="NONE" && src.EQUIPPED==0)
							if(HAIR_REMOVAL)
								P.overlays-=P.hair_overlay
							src.EQUIPPED=1
							usr<<equip
							P.HEAD_SLOT="[src]"
							name="[name][SUFFIX]"
							P.DEFENSE_ADDED+=src.DEFENSE
							P.FIRERESIST_ADDED+=src.FIRE_RESIST
							P.POIRESIST_ADDED+=src.POISON_RESIST
							P.head_overlay=src.icon
							P.overlays+=P.head_overlay
							usr.EquipUpdate()
							return
						else if(P.HEAD_SLOT=="[TRUE_NAME]")
							if(HAIR_REMOVAL)
								P.overlays+=P.hair_overlay
							usr<<equip
							src.EQUIPPED=0
							name="[TRUE_NAME]"
							P.DEFENSE_ADDED-=src.DEFENSE
							P.FIRERESIST_ADDED-=src.FIRE_RESIST
							P.POIRESIST_ADDED-=src.POISON_RESIST
							P.overlays-=P.head_overlay
							P.HEAD_SLOT="NONE"
							usr.EquipUpdate()
							return
		OUTFIT
			layer=6
			Tempestra_Garb
				DEFENSE=3
				FIRE_RESIST=4
				TRUE_NAME="Tempestra Garb"
				icon='Equipment/Outfit/TempestraGarb.dmi'
			SpawnFake_Garb
				DEFENSE=3
				POISON_RESIST=4
				TRUE_NAME="SpawnFake Garb"
				icon='Equipment/Outfit/SpawnfakeGarb.dmi'
			Laundry_Garb
				DEFENSE=4
				TRUE_NAME="Laundry Garb"
				icon='Equipment/Outfit/LaundryGarb.dmi'
			Becca_Garb
				DEFENSE=5
				TRUE_NAME="Becca Garb"
				icon='Equipment/Outfit/BeccaGarb.dmi'
			Boo_Armor
				DEFENSE=4
				POISON_RESIST=3
				TRUE_NAME="Boo Armor"
				icon='Equipment/Sets/Boo/Armor.dmi'
			Lugia_Armor
				DEFENSE=12
				FIRE_RESIST=6
				TRUE_NAME="Lugia Armor"
				icon='Equipment/Outfit/LugiaArmor.dmi'
			Sacred_Armor
				DEFENSE=18
				FIRE_RESIST=8
				TRUE_NAME="Sacred Armor"
				icon='Equipment/Sets/HoOh/Outfit.dmi'
			Gamma_Plating
				DEFENSE=8
				FIRE_RESIST=8
				TRUE_NAME="Gamma Plating"
				icon='Equipment/Outfit/GammaOutfit.dmi'
			SOLDIER_First_Class_Outfit
				DEFENSE=10
				TRUE_NAME="SOLDIER First Class Outfit"
				icon='Equipment/Outfit/ShinraFirstClass.dmi'
			SOLDIER_Second_Class_Outfit
				DEFENSE=8
				TRUE_NAME="SOLDIER Second Class Outfit"
				icon='Equipment/Outfit/ShinraSecondClass.dmi'
			SOLDIER_Third_Class_Outfit
				DEFENSE=3
				TRUE_NAME="SOLDIER Third Class Outfit"
				icon='Equipment/Outfit/ShinraThirdClass.dmi'
			Paladin_Armor
				DEFENSE=5
				POISON_RESIST=8
				TRUE_NAME="Paladin Armor"
				icon='Equipment/Outfit/PaladinUniform.dmi'
			Decorative_Armor_Green
				DEFENSE=4
				TRUE_NAME="Decorative Armor Green"
				icon='Equipment/Outfit/DecorativeUniform.dmi'
			Prazon_Armor
				DEFENSE=5
				POISON_RESIST=4
				TRUE_NAME="Prazon Armor"
				icon='Equipment/Outfit/PrazonUniform.dmi'
			DblClick()
				for(var/Party_Members/P in usr.Party)
					if(usr.Equipping==P)
						if(P.OUTFIT_SLOT=="NONE" && src.EQUIPPED==0)
							src.EQUIPPED=1
							usr<<equip
							P.OUTFIT_SLOT="[src]"
							name="[name][SUFFIX]"
							P.DEFENSE_ADDED+=src.DEFENSE
							P.FIRERESIST_ADDED+=src.FIRE_RESIST
							P.POIRESIST_ADDED+=src.POISON_RESIST
							P.outfit_overlay=src.icon
							P.overlays+=P.outfit_overlay
							usr.EquipUpdate()
							return
						else if(P.OUTFIT_SLOT=="[TRUE_NAME]")
							usr<<equip
							src.EQUIPPED=0
							name="[TRUE_NAME]"
							P.DEFENSE_ADDED-=src.DEFENSE
							P.FIRERESIST_ADDED-=src.FIRE_RESIST
							P.POIRESIST_ADDED-=src.POISON_RESIST
							P.overlays-=P.outfit_overlay
							P.OUTFIT_SLOT="NONE"
							usr.EquipUpdate()
							return
			//LAYERS = Outfit=6 Mask=7  Head=9 Hair=8
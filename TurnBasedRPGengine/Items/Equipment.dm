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
		EQUIPPED_BY = null
		ELEMENT = "NONE"
		TYPE = "NONE"
		TRUE_NAME=""
		SUFFIX = "{E}"
		HAIR_REMOVAL = 0
		WEIGHT = 0

	WEAPONS
		layer=10
		TYPE = "SWORD"
		GUNS
			TYPE = "GUN"
			Blaster
				pixel_x=-8
				pixel_y=-6
				TRUE_NAME="Blaster"
				STRENGTH= 6
				ACCURACY= 3
				icon='Equipment/Weapon/Gun/Blaster.dmi'
				WEIGHT=6
			Gamma_Ray
				pixel_x=-8
				pixel_y=-6
				TRUE_NAME="Gamma Ray"
				STRENGTH= 8
				ACCURACY= 4
				icon='Equipment/Weapon/Gun/GammaBlaster.dmi'
				WEIGHT=8
		Gamma_Vector
			pixel_x=-8
			pixel_y=-6
			TRUE_NAME="Gamma Vector"
			STRENGTH= 14
			ELEMENT = "BOLT"
			icon='Equipment/Weapon/GammaShocker.dmi'
			WEIGHT=7
		Slime_Slayer
			pixel_x=-8
			pixel_y=-6
			TRUE_NAME="Slime Slayer"
			STRENGTH= 16
			ELEMENT = "SLIME"
			icon='Equipment/Weapon/SlimeSword.dmi'
			WEIGHT=6
		Acid_Cutter
			pixel_x=-8
			pixel_y=-6
			TRUE_NAME="Acid Cutter"
			STRENGTH= 14
			ELEMENT = "POISON"
			icon='Equipment/Weapon/SaibaSword.dmi'
			WEIGHT=6
		Wrench_Tooler
			pixel_x=-8
			pixel_y=-6
			TRUE_NAME="Wrench Tooler"
			STRENGTH= 16
			ELEMENT = "FIRE"
			icon='Equipment/Weapon/WrenchTooler.dmi'
			WEIGHT=8
		Sacred_Blade
			pixel_x=-8
			pixel_y=-6
			TRUE_NAME="Sacred Blade"
			STRENGTH= 23
			ELEMENT = "FIRE"
			icon='Equipment/Weapon/HoOhSword.dmi'
			WEIGHT=6
		Ruby_Halberd
			pixel_x=-8
			pixel_y=-6
			TRUE_NAME="Ruby Halberd"
			STRENGTH= 25
			ELEMENT = "FIRE"
			icon='Equipment/Weapon/GroudonHalberd.dmi'
			WEIGHT=6
		Boo_Axe
			name="Spooky Chopper"
			TRUE_NAME="Spooky Chopper"
			pixel_x=-8
			pixel_y=-6
			STRENGTH=14
			icon='Equipment/Sets/Boo/Axe.dmi'
			WEIGHT=7
		Iron
			Broadsword
				//pixel_x=-8
				//pixel_y=-6
				TRUE_NAME="Broadsword"
				STRENGTH= 6
				icon='Equipment/Weapon/Broadsword.dmi'
				WEIGHT=5

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
			if(src in usr.Equipment)
				for(var/Party_Members/P in usr.Party)
					if(usr.Equipping==P)
						if(P.WEAPON_SLOT==null && src.EQUIPPED==0 && src.EQUIPPED_BY==null)
							src.EQUIPPED=1
							EQUIPPED_BY="[P]"
							usr<<equip
							name="[name] - {E}:[P]"
							P.WEAPON_SLOT="[src]"
							//name="[name][SUFFIX]"
							P.STRENGTH_ADDED+=src.STRENGTH
							P.ACC_ADDED+=src.ACCURACY
							P.WEAPON_WEIGHT += WEIGHT
							P.WEAPON_TYPE="[src.TYPE]"
							P.ATTACK_ELEMENT="[src.ELEMENT]"
							P.weapon_overlay=src.icon
							P.overlays+=P.weapon_overlay
							usr.EquipUpdate()
							usr.Save()
							return
						else
							if(P.WEAPON_SLOT=="[src]" && src.EQUIPPED==1 && src.EQUIPPED_BY=="[P]")
								usr<<equip
								src.EQUIPPED=0
								name="[TRUE_NAME]"
								src.EQUIPPED_BY=null
								P.STRENGTH_ADDED-=src.STRENGTH
								P.ACC_ADDED-=src.ACCURACY
								P.ATTACK_ELEMENT="NONE"
								P.WEAPON_WEIGHT-=src.WEIGHT
								P.WEAPON_TYPE="SWORD"
								P.overlays-=P.weapon_overlay
								P.WEAPON_SLOT=null
								usr.EquipUpdate()
								usr.Save()
								return


	ARMOR
		MASK
			layer=7
			Gamma_Visor
				icon='Equipment/Mask/GammaVisor.dmi'
				DEFENSE=4
				ACCURACY = 8
				TRUE_NAME="Gamma Visor"
				WEIGHT=1
			Sacred_Specs
				icon='Equipment/Mask/HoOhSpecs.dmi'
				DEFENSE=6
				ACCURACY = 12
				TRUE_NAME="Sacred Specs"
				WEIGHT=0
			Glasses
				icon='Equipment/Mask/Glasses.dmi'
				DEFENSE=1
				ACCURACY = 5
				TRUE_NAME="Glasses"
				WEIGHT=0
			DblClick()
				for(var/Party_Members/P in usr.Party)
					if(usr.Equipping==P)
						if(P.MASK_SLOT==null && src.EQUIPPED==0 && src.EQUIPPED_BY==null)
							src.EQUIPPED=1
							usr<<equip
							name="[name] - {E}:[P]"
							P.MASK_SLOT="[src]"
							EQUIPPED_BY="[P]"
							P.DEFENSE_ADDED+=src.DEFENSE
							P.ACC_ADDED += src.ACCURACY
							P.FIRERESIST_ADDED+=src.FIRE_RESIST
							P.POIRESIST_ADDED+=src.POISON_RESIST
							P.mask_overlay=src.icon
							P.overlays+=P.mask_overlay
							P.ARMOR_WEIGHT+=WEIGHT
							usr.EquipUpdate()
							usr.Save()
							return
						if(P.MASK_SLOT=="[src]" && src.EQUIPPED==1 && src.EQUIPPED_BY=="[P]")
							usr<<equip
							src.EQUIPPED=0
							name="[TRUE_NAME]"
							EQUIPPED_BY=null
							P.DEFENSE_ADDED-=src.DEFENSE
							P.ACC_ADDED -= src.ACCURACY
							P.ARMOR_WEIGHT-=WEIGHT
							P.FIRERESIST_ADDED-=src.FIRE_RESIST
							P.POIRESIST_ADDED-=src.POISON_RESIST
							P.overlays-=P.mask_overlay
							P.MASK_SLOT=null
							usr.EquipUpdate()
							usr.Save()
							return
		HEAD
			layer=9
			White_Beanie
				DEFENSE=1
				HAIR_REMOVAL=0
				TRUE_NAME="White Beanie"
				icon='Equipment/Head/Beanie.dmi'
				WEIGHT=2
			Matts_Bandana
				DEFENSE=4
				HAIR_REMOVAL=0
				TRUE_NAME="Matts Bandana"
				icon='Equipment/Head/MattBandana.dmi'
				WEIGHT=1
				CHARACTER_LOCK="Matt"
			Dragoon_Helmet
				DEFENSE=6
				HAIR_REMOVAL=1
				TRUE_NAME="Dragoon Helmet"
				icon='Equipment/Head/DragoonHelmet.dmi'
				FIRE_RESIST=4
				WEIGHT=4
			Boo_Helmet
				DEFENSE=5
				HAIR_REMOVAL=0
				TRUE_NAME="Boo Helmet"
				icon='Equipment/Sets/Boo/Helm.dmi'
				POISON_RESIST=4
				WEIGHT=2
			Lugia_Helmet
				DEFENSE=25
				HAIR_REMOVAL=1
				TRUE_NAME="Lugia Helmet"
				icon='Equipment/Head/LugiaHelmet.dmi'
				FIRE_RESIST=10
				WEIGHT=6
			Sacred_Helmet
				DEFENSE=25
				HAIR_REMOVAL=0
				TRUE_NAME="Sacred Helmet"
				icon='Equipment/Sets/HoOh/Helmet.dmi'
				FIRE_RESIST=12
				WEIGHT=6
			Prazon_Helmet
				DEFENSE=4
				HAIR_REMOVAL=1
				TRUE_NAME="Prazon Helmet"
				icon='Equipment/Head/PrazonHelmet.dmi'
				POISON_RESIST=4
				WEIGHT=4
			Saiba_Helmet
				DEFENSE=8
				HAIR_REMOVAL=1
				TRUE_NAME="Saiba Helmet"
				icon='Equipment/Sets/Saiba/Helm.dmi'
				POISON_RESIST=10
				WEIGHT=5
			Metool_Helmet
				DEFENSE=12
				HAIR_REMOVAL=1
				TRUE_NAME="Metool Hard-Hat"
				icon='Equipment/Head/MetoolHelm.dmi'
				WEIGHT=8
			Mario_Cap
				DEFENSE=6
				HAIR_REMOVAL=1
				TRUE_NAME="Mario's Cap"
				icon='Equipment/Head/MarioCap.dmi'
				FIRE_RESIST=5
				WEIGHT=2
			Luigi_Cap
				DEFENSE=6
				HAIR_REMOVAL=1
				TRUE_NAME="Luigi's Cap"
				icon='Equipment/Head/LuigiCap.dmi'
				FIRE_RESIST=5
				WEIGHT=2
			Wario_Cap
				DEFENSE=6
				HAIR_REMOVAL=1
				TRUE_NAME="Wario's Cap"
				icon='Equipment/Head/WarioCap.dmi'
				FIRE_RESIST=5
				WEIGHT=2
			Waluigi_Cap
				DEFENSE=6
				HAIR_REMOVAL=1
				TRUE_NAME="Waluigi's Cap"
				icon='Equipment/Head/WaluigiCap.dmi'
				FIRE_RESIST=5
				WEIGHT=2
			DblClick()
				for(var/Party_Members/P in usr.Party)
					if(usr.Equipping==P)
						if(P.HEAD_SLOT==null && src.EQUIPPED==0 && src.EQUIPPED_BY==null)
							if(HAIR_REMOVAL)
								P.overlays-=P.hair_overlay
							src.EQUIPPED=1
							usr<<equip
							name="[name] - {E}:[P]"
							P.HEAD_SLOT="[src]"
							//name="[name] - {E}:[P]"
							EQUIPPED_BY="[P]"
							P.DEFENSE_ADDED+=src.DEFENSE
							P.FIRERESIST_ADDED+=src.FIRE_RESIST
							P.POIRESIST_ADDED+=src.POISON_RESIST
							P.head_overlay=src.icon
							P.ARMOR_WEIGHT+=WEIGHT
							P.overlays+=P.head_overlay
							usr.EquipUpdate()
							usr.Save()
							return
						if(P.HEAD_SLOT=="[src]" && src.EQUIPPED==1 && src.EQUIPPED_BY=="[P]")
							if(HAIR_REMOVAL)
								P.overlays+=P.hair_overlay
							usr<<equip
							src.EQUIPPED=0
							name="[TRUE_NAME]"
							EQUIPPED_BY=null
							P.DEFENSE_ADDED-=src.DEFENSE
							P.FIRERESIST_ADDED-=src.FIRE_RESIST
							P.ARMOR_WEIGHT-=WEIGHT
							P.POIRESIST_ADDED-=src.POISON_RESIST
							P.overlays-=P.head_overlay
							P.HEAD_SLOT=null
							usr.EquipUpdate()
							usr.Save()
							return
		OUTFIT
			layer=6
			Tempestra_Garb
				DEFENSE=3
				FIRE_RESIST=4
				TRUE_NAME="Tempestra Garb"
				CHARACTER_LOCK = "Derek"
				icon='Equipment/Outfit/TempestraGarb.dmi'
				WEIGHT=5
			SpawnFake_Garb
				DEFENSE=3
				POISON_RESIST=4
				TRUE_NAME="SpawnFake Garb"
				CHARACTER_LOCK = "Hunter"
				icon='Equipment/Outfit/SpawnfakeGarb.dmi'
				WEIGHT=4
			Laundry_Garb
				DEFENSE=4
				TRUE_NAME="Laundry Garb"
				CHARACTER_LOCK = "Laundry"
				icon='Equipment/Outfit/LaundryGarb.dmi'
				WEIGHT=4
			Becca_Garb
				DEFENSE=5
				TRUE_NAME="Becca Garb"
				CHARACTER_LOCK = "Becca"
				icon='Equipment/Outfit/BeccaGarb.dmi'
				WEIGHT=3
			Prazon_Garb
				DEFENSE=5
				TRUE_NAME="Prazon Garb"
				CHARACTER_LOCK = "Brendan"
				icon='Equipment/Outfit/BrendanGarb.dmi'
				WEIGHT=6
			Matt_Garb
				DEFENSE=4
				TRUE_NAME="Matt Garb"
				CHARACTER_LOCK = "Matt"
				icon='Equipment/Outfit/MattGarb.dmi'
				WEIGHT=4
			Boo_Armor
				DEFENSE=4
				POISON_RESIST=3
				TRUE_NAME="Boo Armor"
				icon='Equipment/Sets/Boo/Armor.dmi'
				WEIGHT=3
			Lugia_Armor
				DEFENSE=12
				FIRE_RESIST=6
				TRUE_NAME="Lugia Armor"
				icon='Equipment/Outfit/LugiaArmor.dmi'
				WEIGHT=8
			Sacred_Armor
				DEFENSE=18
				FIRE_RESIST=8
				TRUE_NAME="Sacred Armor"
				icon='Equipment/Sets/HoOh/Outfit.dmi'
				WEIGHT=7
			Gamma_Plating
				DEFENSE=12
				FIRE_RESIST=8
				TRUE_NAME="Gamma Plating"
				icon='Equipment/Outfit/GammaOutfit.dmi'
				WEIGHT=10
			Metool_Armor
				DEFENSE=20
				TRUE_NAME="Metool Armor"
				icon='Equipment/Outfit/MetoolArmor.dmi'
				WEIGHT=16
			SOLDIER_First_Class_Outfit
				DEFENSE=10
				TRUE_NAME="SOLDIER First Class Outfit"
				icon='Equipment/Outfit/ShinraFirstClass.dmi'
				WEIGHT=5
			SOLDIER_Second_Class_Outfit
				DEFENSE=8
				TRUE_NAME="SOLDIER Second Class Outfit"
				icon='Equipment/Outfit/ShinraSecondClass.dmi'
				WEIGHT=5
			SOLDIER_Third_Class_Outfit
				DEFENSE=3
				TRUE_NAME="SOLDIER Third Class Outfit"
				icon='Equipment/Outfit/ShinraThirdClass.dmi'
				WEIGHT=5
			Paladin_Armor
				DEFENSE=5
				POISON_RESIST=8
				TRUE_NAME="Paladin Armor"
				icon='Equipment/Outfit/PaladinUniform.dmi'
				WEIGHT=5
			Decorative_Armor_Green
				DEFENSE=4
				TRUE_NAME="Decorative Armor Green"
				icon='Equipment/Outfit/DecorativeUniform.dmi'
				WEIGHT=5
			Prazon_Armor
				DEFENSE=5
				POISON_RESIST=4
				TRUE_NAME="Prazon Armor"
				icon='Equipment/Outfit/PrazonUniform.dmi'
				WEIGHT=7
			DblClick()
				for(var/Party_Members/P in usr.Party)
					if(usr.Equipping==P)
						if(P.OUTFIT_SLOT==null && src.EQUIPPED==0 && src.EQUIPPED_BY==null)
							src.EQUIPPED=1
							usr<<equip
							name="[name] - {E}:[P]"
							P.OUTFIT_SLOT="[src]"
							EQUIPPED_BY="[P]"
							//name="[name][SUFFIX]"
							P.DEFENSE_ADDED+=src.DEFENSE
							P.FIRERESIST_ADDED+=src.FIRE_RESIST
							P.ARMOR_WEIGHT+=WEIGHT
							P.POIRESIST_ADDED+=src.POISON_RESIST
							P.outfit_overlay=src.icon
							P.overlays+=P.outfit_overlay
							usr.EquipUpdate()
							usr.Save()
							return
						if(P.OUTFIT_SLOT=="[src]" && src.EQUIPPED==1 && src.EQUIPPED_BY=="[P]")
							usr<<equip
							EQUIPPED=0
							name="[TRUE_NAME]"
							EQUIPPED_BY=null
							P.DEFENSE_ADDED-=src.DEFENSE
							P.FIRERESIST_ADDED-=src.FIRE_RESIST
							P.POIRESIST_ADDED-=src.POISON_RESIST
							P.ARMOR_WEIGHT-=WEIGHT
							P.overlays-=P.outfit_overlay
							P.OUTFIT_SLOT=null
							usr.EquipUpdate()
							usr.Save()
							return
			//LAYERS = Outfit=6 Mask=7  Head=9 Hair=8
MATERIALS
	parent_type = /obj
	icon='Items/teenies.dmi'
	var
		canStack =1
		DESC = "empty"
	Click()
		if(usr.IN_MENU)
			winset(usr,"MATERIALS.Name","text='[src.name]'")
			winset(usr,"MATERIALS.Desc","text='[src.DESC]'")
			usr << output("<BIG>\icon [src]</BIG>", "MATERIALS.grid")

	BOO
		FANG
			name="Boo Fang"
			icon_state="fang"
			DESC = "A sharp fang from the timid ghosts of Mushroom Kingdom."
		SKIN
			name="Boo Skin"
			icon_state="skin"
			DESC = "The white soft skin of a Boo."
		ECTOPLASM
			name="Boo Ectoplasm"
			icon_state="liquid"
			DESC = "This liquid has a transparent look to it."
		TONGUE
			name="Boo's Tongue"
			icon_state="scale"
			DESC = "An iconic tongue that came from a spooky creature."
	GAMMA
		CPU
			name="E-100 Series CPU"
			icon_state="parts"
			DESC = "CPUs running in Eggman's E-100 series."
			New()
				icon+=rgb(200,0,0)
		GEAR
			name="Gamma Series Gear"
			icon_state="gear"
			DESC = "Deprecated gears found in the Gamma robots."
			New()
				icon+=rgb(200,0,0)
		FUEL
			name="Robotnik Robo Fuel"
			icon_state="liquid"
			DESC = "A combustable fuel found in most of Eggman's minions."
			New()
				icon+=rgb(200,0,0)
		ARMOR
			name="Gamma Armor Plate"
			icon_state="scale"
			DESC = "Once thought impenetrable armor plating on Gammas."
			New()
				icon+=rgb(200,0,0)
	HOOH
		FEATHER
			name="Rainbow Feather"
			icon_state="feather"
			New()
				icon+=rgb(255,174,201)
		FLAME
			name="Sacred Flame"
			icon_state="liquid"
			New()
				icon+=rgb(255,174,201)
		PELT
			name="Rainbow Pelt"
			icon_state="skin"
			New()
				icon+=rgb(255,174,201)
		EYE
			name="Ho-Oh's Fierce Eye"
			icon_state="eye"
			New()
				icon+=rgb(255,174,201)
	METOOL
	SAIBAMEN
		BOOM
			name="Volatile Mixture"
			icon_state="liquid"
			DESC = "Explosive substance found inside Saibamen."
			New()
				icon+=rgb(181,230,29)
		ACID
			name="Highly Toxic Acid"
			icon_state="liquid"
			DESC = "Saibamen are able to spit this acid at prey."
			New()
				icon+=rgb(181,230,29)
		LEATHER
			name="Saibamen Leather"
			icon_state="skin"
			DESC = "The tough, leathery skin of a Saibamen."
			New()
				icon+=rgb(181,230,29)
		SEED
			name="Saiba Seed"
			icon_state="scale"
			DESC = "Be careful where you plant this seed!"
			New()
				icon+=rgb(181,230,29)
	SQUID
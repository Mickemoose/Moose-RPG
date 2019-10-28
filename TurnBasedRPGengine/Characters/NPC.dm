NPC
	parent_type = /mob
	density=1
	icon='Characters/NPC.dmi'

	Rotht
		icon_state="rotht"
		New()
			MERCH.Add(new /BUYABLE/POTION, new /BUYABLE/ETHER, new /BUYABLE/PHOENIXFEATHER, new /BUYABLE/HIPOTION)
		verb
			Interact()
				set src in oview(1)
				usr.Message(" Sup? You need some help out there?",npc="rotht")
				usr<<menubutton
				usr.IN_MENU=1
				usr.IN_STORE=1
				spawn(15)
					fade.Map(usr, 150, 16, 6)
					winset(usr,"default.STORE","is-visible=true")
					winset(usr,"default.storeoutline","is-visible=true")
					usr.currentMerchant=src
					usr.MERCH.Remove(usr.MERCH)
					usr.MERCH.Add(new /BUYABLE/POTION, new /BUYABLE/ETHER, new /BUYABLE/PHOENIXFEATHER, new /BUYABLE/HIPOTION)
					usr.StoreUpdate(src)

	Devon
		icon_state="devon"
		verb
			Interact()
				set src in oview(1)
				usr.Message(" YO",npc="devon")
				usr.IN_MENU=1
				usr<<menubutton
				spawn(15)
					usr.IN_MENU=0
	Darcy
		icon_state="darcy"
		verb
			Interact()
				set src in oview(1)
				usr.Message(" Boyo I'm here to <b>BEAT</b> ass and <b>EAT</b> ass.",npc="darcy")
				usr.IN_MENU=1
				usr<<menubutton
				spawn(15)
					usr.IN_MENU=0
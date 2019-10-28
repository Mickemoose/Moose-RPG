
BUYABLE
	parent_type=/obj/
	icon='Items/teenies.dmi'
	var
		price=0
		itempath=null
	POTION
		itempath=/ITEMS/Potion
		icon_state="potion"
		price=25

	ETHER
		itempath=/ITEMS/Ether
		icon_state="ether"
		price=25
	HIPOTION
		itempath=/ITEMS/Hi_Potion
		icon_state="hipotion"
		price=150
	ELIXIR
		itempath=/ITEMS/Elixir
		icon_state="elixir"
		price=250
	MAXPOTION
		itempath=/ITEMS/Max_Potion
		icon_state="maxpotion"
		price=500
	MAXETHER
		itempath=/ITEMS/Max_Ether
		icon_state="maxether"
		price=300
	MAXELIXIR
		itempath=/ITEMS/Max_Elixir
		icon_state="maxelixir"
		price=1000
	PHOENIXFEATHER
		itempath=/ITEMS/Phoenix_Feather
		icon_state="phoenix"
		price=300
	New()
		name="[src] - $[price]"
	DblClick()
		if(usr.moneys>=price)
			usr.itemAdd(new itempath)
			usr.moneys-=price
			usr.StoreUpdate()
			usr<<shop
			winset(usr,"STORE.MSG","is-visible=true")
			winset(usr,"STORE.MSG","text=Thanks!")
			spawn(10)
				winset(usr,"STORE.MSG","is-visible=false")
		else
			usr<<error
			winset(usr,"STORE.MSG","is-visible=true")
			winset(usr,"STORE.MSG","text=Nah bro not enough.")
			spawn(10)
				winset(usr,"STORE.MSG","is-visible=false")

mob
	verb
		CloseStore()
			set hidden=1
			winset(usr,"default.STORE","is-visible=false")
			winset(usr,"default.storeoutline","is-visible=false")
			usr.IN_MENU=0
			usr.currentMerchant=null
			usr.IN_STORE=0
			fade.Map(usr, 0, 16, 5)
	proc
		StoreUpdate(NPC/merchant)
			winset(usr,"STORE.MONEY","text='[usr.moneys]")
			var/icon/I2 = file("Chat/NPCs/[merchant].dmi")
			I2 = fcopy_rsc(I2)
			winset(usr,"STORE.MERCH","image='\ref[I2]'")
			var/I = 1
			var/I3 = 1
			winset(src, "STORE.storeINV",{"cells="2x[usr.MERCH.len]""})	//Add multiple cells horizontally for each obj
			for(var/BUYABLE/O in usr.MERCH)//Loop through all the items in the players contents
				src << output(O, "STORE.storeINV:1,[I3]")//Send the obj's in src.contents to the Grid
				src << output(O.suffix,"STORE.storeINV:2,[I3]")
				I3++
			winset(src, "STORE.playerINV",{"cells="2x[usr.Items.len]""})	//Add multiple cells horizontally for each obj
			for(var/ITEMS/O in usr.Items)//Loop through usr the items in the players contents
				usr << output(O, "STORE.playerINV:1,[I]")//Send the obj's in src.contents to the Grid
				usr << output(O.suffix,"STORE.playerINV:2,[I]")
				I++


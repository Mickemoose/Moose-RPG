mob
	var
		USING_ITEM = null
		ITEM_USER = null
		TARGETING=0



	proc
		Target(ITEMS/item,Party_Members/USER)
			usr.USING_ITEM=item
			usr.ITEM_USER=USER

			usr.TARGETING=1
Party_Members
	Click()
		if(usr.TARGETING)
			var/ITEMS/I1
			I1=usr.USING_ITEM
			I1.Use(src,usr.ITEM_USER)

		..()
ENEMY
	Click()
		if(usr.TARGETING)
			var/ITEMS/I1
			I1=usr.USING_ITEM
			I1.Use(src,usr.ITEM_USER)

		..()
ITEMS
	parent_type= /obj
	density=0
	var
		CHARACTER_LOCK = null
		FRAME = null
		canStack =1
	DblClick()
		if(usr.IN_MENU)
			usr.ITEM_INMENU=src
			usr.PartyCheckItem()
			return
	proc
		ItemMenuUse(Party_Members/target)
			..()
		Use(target,Party_Members/user)

			if(usr.TARGETING)

				usr.TARGETING = 0

				..()
	PokeBall
		name="Poké Ball"
		icon='Items/teenies.dmi'
		icon_state="pokeball"
		Use(ENEMY/target,Party_Members/user)
			new/obj/FX/PokeBallFX/poke(target,user)
		//	usr.Info("Target:[target]")
	Master_Ball
		icon='Items/teenies.dmi'
		icon_state="masterball"
		Use(ENEMY/target,Party_Members/user)


	Potion
		icon='Items/teenies.dmi'
		icon_state="potion"
		ItemMenuUse(Party_Members/target)
			if(!target.dead)
				if(target.HEALTH<target.MAX_HEALTH)
					for(var/mob/M in world)
						if(M.client&&target in M.Party)
							M<<item
					var/calc=0.15*target.MAX_HEALTH
					target.HEALTH+=calc
					if(target.HEALTH>target.MAX_HEALTH)
						target.HEALTH=target.MAX_HEALTH
					if(src.canStack && src.contents.len)
						var/ITEMS/theItem=pick(src.contents)
						if(src.contents.len)
							src.suffix="x[src.contents.len+1]"
						else
							src.suffix="x1"
						del theItem
					else
						for(var/mob/M in world)
							if(M.client&&target in M.Party)
								M.ITEM_INMENU=null
								M.PartyCloseItem()
						del src
		Use(Party_Members/target,Party_Members/user)
			usr.Info("[user] used [src]!")
			spawn(12)
				for(var/obj/INFOBOX/C4 in usr.client.screen)
					del(C4)
			new/obj/FX/ITEM_POPUP(user,src)
			user.attacking=1
			var/calc=0.15*target.MAX_HEALTH
			target.HEALTH+=calc
			if(target.HEALTH>=target.MAX_HEALTH)
				target.HEALTH=target.MAX_HEALTH
			new/effect/damage(target.loc,"<font color=#00ff00><b>[calc]</b></font>")
			usr.HPUpdate()
			usr.StatUpdate()
			target.iteming=0
			for(var/BATTLE_BUTTONS/Items/I in usr.client.screen)
				I.amount=0
				I.offset=0
				I.amount_needed=0
			for(var/BATTLE_BUTTONS/Item_Frame/IF in usr.client.screen)
				del IF
			usr.USING_ITEM=0
			usr.TARGETING=0
			usr.Turn_End(user)
			spawn(2)
				if(src.canStack && src.contents.len)
					var/ITEMS/theItem=pick(src.contents)
					if(src.contents.len)
						src.suffix="x[src.contents.len+1]"
					else
						src.suffix="x1"
					user.attacking=0
					del theItem
				else
					user.attacking=0
					del src
	Hi_Potion
		icon='Items/teenies.dmi'
		icon_state="hipotion"
		ItemMenuUse(Party_Members/target)
			if(!target.dead)
				if(target.HEALTH<target.MAX_HEALTH)
					for(var/mob/M in world)
						if(M.client&&target in M.Party)
							M<<item
					var/calc=0.25*target.MAX_HEALTH
					target.HEALTH+=calc
					if(target.HEALTH>target.MAX_HEALTH)
						target.HEALTH=target.MAX_HEALTH
					if(src.canStack && src.contents.len)
						var/ITEMS/theItem=pick(src.contents)
						if(src.contents.len)
							src.suffix="x[src.contents.len+1]"
						else
							src.suffix="x1"
						del theItem
					else
						for(var/mob/M in world)
							if(M.client&&target in M.Party)
								M.ITEM_INMENU=null
								M.PartyCloseItem()
						del src
		Use(Party_Members/target,Party_Members/user)
			usr.Info("[user] used [src]!")
			spawn(12)
				for(var/obj/INFOBOX/C4 in usr.client.screen)
					del(C4)
			new/obj/FX/ITEM_POPUP(user,src)
			user.attacking=1
			var/calc=0.25*target.MAX_HEALTH
			target.HEALTH+=calc
			if(target.HEALTH>=target.MAX_HEALTH)
				target.HEALTH=target.MAX_HEALTH
			new/effect/damage(target.loc,"<font color=#00ff00><b>[calc]</b></font>")
			usr.HPUpdate()
			usr.StatUpdate()
			target.iteming=0
			for(var/BATTLE_BUTTONS/Items/I in usr.client.screen)
				I.amount=0
				I.offset=0
				I.amount_needed=0
			for(var/BATTLE_BUTTONS/Item_Frame/IF in usr.client.screen)
				del IF
			usr.USING_ITEM=0
			usr.TARGETING=0
			usr.Turn_End(user)
			spawn(2)
				if(src.canStack && src.contents.len)
					var/ITEMS/theItem=pick(src.contents)
					if(src.contents.len)
						src.suffix="x[src.contents.len+1]"
					else
						src.suffix="x1"
					user.attacking=0
					del theItem
				else
					user.attacking=0
					del src
	Max_Potion
		icon='Items/teenies.dmi'
		icon_state="maxpotion"
		ItemMenuUse(Party_Members/target)
			if(!target.dead)
				if(target.HEALTH<target.MAX_HEALTH)
					for(var/mob/M in world)
						if(M.client&&target in M.Party)
							M<<item
					target.HEALTH=target.MAX_HEALTH
					if(target.HEALTH>target.MAX_HEALTH)
						target.HEALTH=target.MAX_HEALTH
					if(src.canStack && src.contents.len)
						var/ITEMS/theItem=pick(src.contents)
						if(src.contents.len)
							src.suffix="x[src.contents.len+1]"
						else
							src.suffix="x1"
						del theItem
					else
						for(var/mob/M in world)
							if(M.client&&target in M.Party)
								M.ITEM_INMENU=null
								M.PartyCloseItem()
						del src
		Use(Party_Members/target,Party_Members/user)
			usr.Info("[user] used [src]!")
			spawn(12)
				for(var/obj/INFOBOX/C4 in usr.client.screen)
					del(C4)
			new/obj/FX/ITEM_POPUP(user,src)
			user.attacking=1
			var/calc=target.MAX_HEALTH-target.HEALTH
			target.HEALTH=target.MAX_HEALTH
			if(target.HEALTH>=target.MAX_HEALTH)
				target.HEALTH=target.MAX_HEALTH
			new/effect/damage(target.loc,"<font color=#00ff00><b>[calc]</b></font>")
			usr.HPUpdate()
			usr.StatUpdate()
			target.iteming=0
			for(var/BATTLE_BUTTONS/Items/I in usr.client.screen)
				I.amount=0
				I.offset=0
				I.amount_needed=0
			for(var/BATTLE_BUTTONS/Item_Frame/IF in usr.client.screen)
				del IF
			usr.USING_ITEM=0
			usr.TARGETING=0
			usr.Turn_End(user)
			spawn(2)
				if(src.canStack && src.contents.len)
					var/ITEMS/theItem=pick(src.contents)
					if(src.contents.len)
						src.suffix="x[src.contents.len+1]"
					else
						src.suffix="x1"
					user.attacking=0
					del theItem
				else
					user.attacking=0
					del src
	Max_Ether
		icon='Items/teenies.dmi'
		icon_state="maxether"
		ItemMenuUse(Party_Members/target)
			if(!target.dead)
				if(target.MAGIC<target.MAX_MAGIC)
					for(var/mob/M in world)
						if(M.client&&target in M.Party)
							M<<item
					target.MAGIC+=target.MAX_MAGIC
					if(target.MAGIC>target.MAX_MAGIC)
						target.MAGIC=target.MAX_MAGIC
					if(src.canStack && src.contents.len)
						var/ITEMS/theItem=pick(src.contents)
						if(src.contents.len)
							src.suffix="x[src.contents.len+1]"
						else
							src.suffix="x1"
						del theItem
					else
						for(var/mob/M in world)
							if(M.client&&target in M.Party)
								M.ITEM_INMENU=null
								M.PartyCloseItem()
						del src
		Use(Party_Members/target,Party_Members/user)
			usr.Info("[user] used [src]!")
			spawn(12)
				for(var/obj/INFOBOX/C4 in usr.client.screen)
					del(C4)
			new/obj/FX/ITEM_POPUP(user,src)
			user.attacking=1
			var/calc=target.MAX_MAGIC-target.MAGIC
			target.MAGIC=target.MAX_MAGIC
			if(target.MAGIC>=target.MAX_MAGIC)
				target.MAGIC=target.MAX_MAGIC
			new/effect/damage(target.loc,"<font color=#00ff00><b>[calc]</b></font>")
			usr.MAGICUpdate()
			usr.StatUpdate()
			target.iteming=0
			for(var/BATTLE_BUTTONS/Items/I in usr.client.screen)
				I.amount=0
				I.offset=0
				I.amount_needed=0
			for(var/BATTLE_BUTTONS/Item_Frame/IF in usr.client.screen)
				del IF
			usr.USING_ITEM=0
			usr.TARGETING=0
			usr.Turn_End(user)
			spawn(2)
				if(src.canStack && src.contents.len)
					var/ITEMS/theItem=pick(src.contents)
					if(src.contents.len)
						src.suffix="x[src.contents.len+1]"
					else
						src.suffix="x1"
					user.attacking=0
					del theItem
				else
					user.attacking=0
					del src
	Max_Elixir
		icon='Items/teenies.dmi'
		icon_state="maxelixir"
		ItemMenuUse(Party_Members/target)
			if(!target.dead)
				if(target.MAGIC<target.MAX_MAGIC||target.HEALTH<target.MAX_HEALTH)
					for(var/mob/M in world)
						if(M.client&&target in M.Party)
							M<<item
					target.MAGIC+=target.MAX_MAGIC
					target.HEALTH+=target.MAX_HEALTH
					if(target.HEALTH>target.MAX_HEALTH)
						target.HEALTH=target.MAX_HEALTH
					if(target.MAGIC>target.MAX_MAGIC)
						target.MAGIC=target.MAX_MAGIC
					if(src.canStack && src.contents.len)
						var/ITEMS/theItem=pick(src.contents)
						if(src.contents.len)
							src.suffix="x[src.contents.len+1]"
						else
							src.suffix="x1"
						del theItem
					else
						for(var/mob/M in world)
							if(M.client&&target in M.Party)
								M.ITEM_INMENU=null
								M.PartyCloseItem()
						del src
		Use(Party_Members/target,Party_Members/user)
			usr.Info("[user] used [src]!")
			spawn(12)
				for(var/obj/INFOBOX/C4 in usr.client.screen)
					del(C4)
			new/obj/FX/ITEM_POPUP(user,src)
			user.attacking=1
			target.MAGIC=target.MAX_MAGIC
			if(target.MAGIC>=target.MAX_MAGIC)
				target.MAGIC=target.MAX_MAGIC
			target.HEALTH=target.MAX_HEALTH
			if(target.HEALTH>=target.MAX_HEALTH)
				target.HEALTH=target.MAX_HEALTH
			new/effect/damage(target.loc,"<font color=#00ff00><b>RESTORE</b></font>")
			usr.HPUpdate()
			usr.MAGICUpdate()
			usr.StatUpdate()
			target.iteming=0
			for(var/BATTLE_BUTTONS/Items/I in usr.client.screen)
				I.amount=0
				I.offset=0
				I.amount_needed=0
			for(var/BATTLE_BUTTONS/Item_Frame/IF in usr.client.screen)
				del IF
			usr.USING_ITEM=0
			usr.TARGETING=0
			usr.Turn_End(user)
			spawn(2)
				if(src.canStack && src.contents.len)
					var/ITEMS/theItem=pick(src.contents)
					if(src.contents.len)
						src.suffix="x[src.contents.len+1]"
					else
						src.suffix="x1"
					user.attacking=0
					del theItem
				else
					user.attacking=0
					del src
	Ether
		icon='Items/teenies.dmi'
		icon_state="ether"
		ItemMenuUse(Party_Members/target)
			if(!target.dead)
				if(target.MAGIC<target.MAX_MAGIC)
					for(var/mob/M in world)
						if(M.client&&target in M.Party)
							M<<item
					var/calc=0.15*target.MAX_MAGIC
					target.MAGIC+=calc
					if(target.MAGIC>target.MAX_MAGIC)
						target.MAGIC=target.MAX_MAGIC
					if(src.canStack && src.contents.len)
						var/ITEMS/theItem=pick(src.contents)
						if(src.contents.len)
							src.suffix="x[src.contents.len+1]"
						else
							src.suffix="x1"
						del theItem
					else
						for(var/mob/M in world)
							if(M.client&&target in M.Party)
								M.ITEM_INMENU=null
								M.PartyCloseItem()
						del src
		Use(Party_Members/target,Party_Members/user)
			usr.Info("[user] used [src]!")
			spawn(12)
				for(var/obj/INFOBOX/C4 in usr.client.screen)
					del(C4)
			new/obj/FX/ITEM_POPUP(user,src)
			user.attacking=1
			var/calc=0.15*target.MAX_MAGIC
			target.MAGIC+=calc
			if(target.MAGIC>=target.MAX_MAGIC)
				target.MAGIC=target.MAX_MAGIC
			new/effect/damage(target.loc,"<font color=#00ff00><b>[calc]</b></font>")
			usr.MAGICUpdate()
			usr.StatUpdate()
			target.iteming=0
			for(var/BATTLE_BUTTONS/Items/I in usr.client.screen)
				I.amount=0
				I.offset=0
				I.amount_needed=0
			for(var/BATTLE_BUTTONS/Item_Frame/IF in usr.client.screen)
				del IF
			usr.USING_ITEM=0
			usr.TARGETING=0
			usr.Turn_End(user)
			spawn(2)
				if(src.canStack && src.contents.len)
					var/ITEMS/theItem=pick(src.contents)
					if(src.contents.len)
						src.suffix="x[src.contents.len+1]"
					else
						src.suffix="x1"
					user.attacking=0
					del theItem
				else
					user.attacking=0
					del src
	Elixir
		icon='Items/teenies.dmi'
		icon_state="elixir"
		ItemMenuUse(Party_Members/target)
			if(!target.dead)
				if(target.HEALTH<target.MAX_HEALTH||target.MAGIC<target.MAX_MAGIC)
					for(var/mob/M in world)
						if(M.client&&target in M.Party)
							M<<item
					var/calc=0.25*target.MAX_HEALTH
					target.HEALTH+=calc
					var/calc2=0.25*target.MAX_MAGIC
					target.MAGIC+=calc2
					if(target.HEALTH>target.MAX_HEALTH)
						target.HEALTH=target.MAX_HEALTH
					if(target.MAGIC>target.MAX_MAGIC)
						target.MAGIC=target.MAX_MAGIC
					if(src.canStack && src.contents.len)
						var/ITEMS/theItem=pick(src.contents)
						if(src.contents.len)
							src.suffix="x[src.contents.len+1]"
						else
							src.suffix="x1"
						del theItem
					else
						for(var/mob/M in world)
							if(M.client&&target in M.Party)
								M.ITEM_INMENU=null
								M.PartyCloseItem()
						del src
		Use(Party_Members/target,Party_Members/user)
			usr.Info("[user] used [src]!")
			spawn(12)
				for(var/obj/INFOBOX/C4 in usr.client.screen)
					del(C4)
			new/obj/FX/ITEM_POPUP(user,src)
			user.attacking=1
			var/calc=0.25*target.MAX_HEALTH
			target.HEALTH+=calc
			var/calc2=0.25*target.MAX_MAGIC
			target.MAGIC+=calc2
			if(target.MAGIC>=target.MAX_MAGIC)
				target.MAGIC=target.MAX_MAGIC
			new/effect/damage(target.loc,"<font color=#00ff00><b>[calc]</b></font>")
			usr.MAGICUpdate()
			usr.StatUpdate()
			if(target.HEALTH>=target.MAX_HEALTH)
				target.HEALTH=target.MAX_HEALTH
			new/effect/damage(target.loc,"<font color=#00ff00><b>[calc2]</b></font>")
			usr.HPUpdate()
			usr.StatUpdate()
			target.iteming=0
			for(var/BATTLE_BUTTONS/Items/I in usr.client.screen)
				I.amount=0
				I.offset=0
				I.amount_needed=0
			for(var/BATTLE_BUTTONS/Item_Frame/IF in usr.client.screen)
				del IF
			usr.USING_ITEM=0
			usr.TARGETING=0
			usr.Turn_End(user)
			spawn(2)
				if(src.canStack && src.contents.len)
					var/ITEMS/theItem=pick(src.contents)
					if(src.contents.len)
						src.suffix="x[src.contents.len+1]"
					else
						src.suffix="x1"
					user.attacking=0
					del theItem
				else
					user.attacking=0
					del src
	Phoenix_Feather
		icon='Items/teenies.dmi'
		icon_state="phoenix"
		ItemMenuUse(Party_Members/target)
			if(target.dead)
				target.dead=0
				target.icon_state="Stance"
				for(var/mob/M in world)
					if(M.client&&target in M.Party)
						M<<item
				var/calc=0.20*target.MAX_HEALTH
				target.HEALTH+=calc
				if(target.HEALTH>target.MAX_HEALTH)
					target.HEALTH=target.MAX_HEALTH
				if(src.canStack && src.contents.len)
					var/ITEMS/theItem=pick(src.contents)
					if(src.contents.len)
						src.suffix="x[src.contents.len+1]"
					else
						src.suffix="x1"
					del theItem
				else
					for(var/mob/M in world)
						if(M.client&&target in M.Party)
							M.ITEM_INMENU=null
							M.PartyCloseItem()
					del src
		Use(Party_Members/target,Party_Members/user)
			usr.Info("[user] used [src]!")
			spawn(12)
				for(var/obj/INFOBOX/C4 in usr.client.screen)
					del(C4)
			new/obj/FX/ITEM_POPUP(user,src)
			user.attacking=1
			if(target.dead)
				var/calc=0.20*target.MAX_HEALTH
				target.dead=0
				target.HEALTH+=calc
				target.icon_state="Stance"
				usr.Alives.Add(target)
				new/effect/damage(target.loc,"<font color=#00ff00><b>[calc]</b></font>")
				usr.HPUpdate()
				usr.StatUpdate()
			target.iteming=0
			for(var/BATTLE_BUTTONS/Items/I in usr.client.screen)
				I.amount=0
				I.offset=0
				I.amount_needed=0
			for(var/BATTLE_BUTTONS/Item_Frame/IF in usr.client.screen)
				del IF
			usr.USING_ITEM=0
			usr.TARGETING=0
			usr.Turn_End(user)
			spawn(2)
				if(src.canStack && src.contents.len)
					var/ITEMS/theItem=pick(src.contents)
					if(src.contents.len)
						src.suffix="x[src.contents.len+1]"
					else
						src.suffix="x1"
					user.attacking=0
					del theItem
				else
					user.attacking=0
					del src


KEY_ITEMS
	parent_type= /obj
	icon='Items/KeyItems/KeyItems.dmi'
	Silver_Feather
		icon_state="silverfeather"

TOWNS
	parent_type = /obj
	icon='Destinations.dmi'
	Bridgecrest
		icon_state="bridgecrest"


DESTINATIONS
	parent_type = /area
	density=0
	Bridgecrest
		Entered(mob/m)
			if(m.client)
				m.IN_SAFE=1
				m<<sound(null)
				fade.Map(m, 255, 16, 8)
				spawn(7)
					m.loc=locate(95,94,5)
					m.IN_SAFE=1
					m<<rockbott
					fade.Map(m, 0, 16, 8)
					m.Save()
					m.Info(msg="Rockbott: The town where legends begin.")
					spawn(18)
						for(var/obj/INFOBOX/C2 in m.client.screen)
							Maptext(C2, "", "white", add_outline = 0)
							animate(C2, transform = matrix()*-1, time = 4)
							spawn(1.4)
								del(C2)

	Bridgecrest_overworld
		Entered(mob/m)
			if(m.client)
				m<<sound(null)
				fade.Map(m, 255, 16, 8)
				spawn(7)
					m.loc=locate(40,106,1)
					m.Save()
					m<<realm
					fade.Map(m, 0, 16, 8)
					m.Info(msg="Realm of Woofpakia")
					spawn(12)
						m.IN_SAFE=0
					spawn(18)
						for(var/obj/INFOBOX/C2 in m.client.screen)
							Maptext(C2, "", "white", add_outline = 0)
							animate(C2, transform = matrix()*-1, time = 4)
							spawn(1.4)
								del(C2)

	Dereks_House
		Entered(mob/m)
			if(m.client)
				m.loc=locate(40,98,4)
				m.Save()
				m.IN_SAFE=1
	Dereks_House_overworld
		Entered(mob/m)
			if(m.client)
				m.loc=locate(27,114,3)
				m.Save()
				m.IN_SAFE=1
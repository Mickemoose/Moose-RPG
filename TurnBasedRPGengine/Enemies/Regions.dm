mob
	var
		Region=00
	Move()
		if(IN_BATTLE||IN_MENU)
			return
		if(IN_SAFE)
			..()
		else
			..()
			if(Region==1)
				if(prob(2))
					src.Battle_Start(enemy=Region,enemy_count=pick(
						1,
					prob(50)
						2,
					prob(100)
						3))
			else
				return
REGIONS
	icon='Enemies/Regions.dmi'
	parent_type = /area
	var
		number = 0
	Entered(mob/M)
		M.Region=number
	RegionDEBUG
		icon_state="01"
		number = 69
		New()
			..()
			for(var/ENEMY/E in Region01)
				if(E.HEALTH==-3)
					Region01.Remove(E)
	Region01
		icon_state="01"
		number = 1
		New()
			..()
			Region01.Remove(Region01)
			Region01.Add("BOO","MANKEY","GAMMA","SLIME","METOOL","SAIBAMEN","SQUID")

var
	list/
		Region01 = list(null)
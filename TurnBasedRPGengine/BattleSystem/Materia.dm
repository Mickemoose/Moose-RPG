MATERIA
	parent_type=/obj/
	icon='BattleSystem/Materia.dmi'
	var
		MANA_COST
		NAME
		LEVEL = 1
		EXP = 0
		MAX_EXP = 100
		ELEMENT

	MAGIC
		icon_state="magic"
		BOLT
			NAME="Thunder"
			MANA_COST = 5
			ELEMENT="BOLT"
			Action(Party_Members/owner,ENEMY/target)
				for(var/mob/M in world)
					if(M.client&&M.IN_BATTLE)
						if(owner in M.Party && M.TURN==owner)
							spawn(10)
								M<<shock
							spawn(12)
								animate(target,color=rgb(255,0,0),time=3)
								if(target.name=="Boo"||target.name=="Saibamen")
									flick("HIT",target)
								new/obj/FX/Shock(target.loc)

								animate(target,color=rgb(255,255,255),time=3)
							spawn(6)
								var/damage=pick(6,8,10,12,14)
								if(target.WEAK_TO == "BOLT")
									damage=damage*2
								target.HEALTH-=damage
								new/effect/damage(target.loc,"<font color=red><b>[round(damage)]</b></font>")
								if(target.HEALTH<=0)
									spawn(2.5)
										target.Death(target,owner)
								if(target.HEALTH<-100)
									spawn(1)
									new/effect/damage(target.loc,"<font color=yellow><b>OVERKILL</b></font>")
									M.OVERKILLED=1

								owner.attacking=0
								owner.clicked=0
								target.attacking=0
								M.Turn_End(owner)

		FIRE
			NAME="Fire"
			MANA_COST = 5
			ELEMENT="FIRE"
		ICE
			NAME="Blizzard"
			MANA_COST = 5
			ELEMENT="ICE"

	SUMMON
		icon_state="summon"

	MODIFIER
		icon_state="modifier"
		ALL
			NAME="All Modifier"
			MANA_COST=3
			ELEMENT="NONE"

	SKILL
		icon_state="skill"
	proc
		Action(Party_Members/owner, ENEMY/target)
			..()



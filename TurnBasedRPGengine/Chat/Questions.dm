mob
	proc
		QuestionCheck(Answer)
			if(usr.ASKING=="TO DUEL")
				if(Answer=="YES")
					usr.Duel_Start(usr.ASKER,usr)
					usr.ANSWER="NO"
					usr.ASKER=null
					return
				if(Answer=="NO")
					usr.ANSWER="NO"
					return
			if(usr.ASKING=="BOSS: HO-OH")
				if(Answer=="YES")
					view()<<hooh
					spawn(10)
						usr.Battle_Start("Ho-Oh",0)
						usr.ASKER=null
						return
				if(Answer=="NO")
					usr.ANSWER="NO"
					return
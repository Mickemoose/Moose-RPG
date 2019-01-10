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
/*
Weather System 2.0
A few months ago I created a day and night/ weather system that inspired tons of other
games to include them into their games as well. I'd like to share a revamp on my original
work to help you also apply the same effect to your projects as well.

This is an lightweight alternative to my first
attempt at day/night weather system. This could be more complex, such as keeping
track of numerous variables like the date, how many days have passed and so on-
but I chose to keep it fairly simple so that anyone can understand and implement.

This demo shows you how to use one singular /obj/Time atom to handle weather and day/night
uniformly for players across the entire server.

How To Use:
1)Copy all the code in this file into your project.
2)Copy the icon files 'Weather.dmi' and 'DayNNite.dmi' (or create your own) into your project and run.
3)Check the .dm file ,compile then run.
Alternatively you could just import this demo into your project in it's entirety.
*/


var/global
	list/holder=list("Time"=new/obj/Time)
	list/OnlinePlayers=list()

proc
	GrabHolder(wh as text)//grabs something out of the holder associated list by name.
		if(holder.Find(wh))
			return holder[wh]
		else
			return null



mob//the default mob, whatever you may call it.
	Login()//applied on login. can be changed for elsewhere.
		..()
		OnlinePlayers+=src
		var/obj/Time/T=GrabHolder("Time")
		if(!isnull(T))
			T.Apply(src)
	Logout()//removed on logout.
		var/obj/Time/T=GrabHolder("Time")
		if(!isnull(T))
			src.client.screen-=T
			src.client.screen-=T.Weather
		..()//continue deletion

obj/Time//this is the time object
	New()//upon creation initialize the weather object and set it's properties.
		if(isnull(Weather))//should be null at start
			Weather=new
			Weather.screen_loc="SOUTHWEST to NORTHEAST"
			Weather.icon='weatherntime/Art/Weather/Weather.dmi'
			Weather.icon_state="calm"
			Weather.layer=MOB_LAYER+6//configures the weather properly.
		spawn(25)DayCycle()
		..()
	layer=MOB_LAYER+5
	icon_state="still"
	mouse_opacity=0
	alpha=50
	icon='weatherntime/Art/Weather/DayNNite.dmi'
	screen_loc="SOUTHWEST to NORTHEAST"
	var
		rev=0
		cTOD="morning"//time of the day
		cWEA="calm"//the current weather
		season="Summer"//the current season
		weather_counter=1//weather counter, responsible for changing weather.
		list/TOD=list("morning","midmorning","noon",
		"afternoon","dusk","sunset","nightfall","night")//time of day goes here, should match the name of your icon states.
		chg_wait=3000//5 mins per change. default 3000
		obj/Weather//this is the object that holds the visual elements for weather.
	proc
		Apply(mob/m)//this applies the weather and day to the client's screen. call this once
			if(!isnull(m.client))
				m.client.screen+=src
				m.client.screen+=src.Weather
		InWea()//this is a weather proc that increases the chance of weather change.
			switch(cWEA)
				if("calm")//calm lasts longest with the least amount of weather change
					weather_counter++
				if("snow")
					weather_counter+=5
				if("rain")
					weather_counter+=5
				if("storm")
					weather_counter+=10
				if("severestorm")
					weather_counter+=25//storms are severe, so they have a chance at passing quickly.
				if("blizzard")
					weather_counter+=25
				if("windy")
					weather_counter+=3
			if(prob(weather_counter))//if the weather has changed by chance..
				switch(season)
					if("Spring")//then pick the appropriate weather as per the icon file
						cWEA=pick("calm","rain","storm","severestorm")
					if("Summer")
						cWEA=pick("calm")
					if("Fall")
						cWEA=pick("calm","windy")
					if("Winter")
						cWEA=pick("calm","snow","blizzard")
				Weather.icon_state=cWEA
				weather_counter=1

		DayColor(wh)//simply changes the color of the day based on the time of the day.
			switch(wh)
				if("midmorning")
					return rgb(255,255,204,46)
				if("morning")
					return rgb(255,255,204,46)
				if("noon")
					return rgb(255,255,204,0)
				if("afternoon")
					return rgb(255,255,204,0)
				if("sunset")
					return rgb(255,153,0,60)
				if("nightfall")
					return rgb(0,0,102,102)
				if("night")
					return rgb(0,0,102,160)
				if("dusk")
					return rgb(0,153,153,46)//you can play with these for various effects.

		DayCycle()//this is the day cycle proc. It runs and controls daytime changes and
			if(!rev)//weather changes.
				rev=1//recursive looped so that this runs smoothly in the background at all times
				var/r=TOD.Find(cTOD)//with little to no CPU cost on the host server.
				if(r==TOD.len)r=1
				else
					r=min(TOD.len,r+1)
				animate(src,color=DayColor(TOD[r]),time=round(chg_wait/3))
				cTOD=TOD[r]
				InWea()//call weather changes.
				spawn(chg_wait)
					rev=0
					.()
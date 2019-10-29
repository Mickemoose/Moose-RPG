/* An update loop specific to players that calls PlayerUpdate every tick for players that are logged in.
*/

mob/player
	var
		global/update_loop/PlayerLoop = new(null, "PlayerUpdate")

	Login()
		..()
		PlayerLoop += src

	Logout()
		PlayerLoop -= src
		..()

	proc
		PlayerUpdate()
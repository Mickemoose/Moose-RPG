AIRSHIP
	parent_type=/mob/player
	WhaleClass
		LunarWhale
			icon='BasicAirship.dmi'
			density=1

	New()
		Shrink()

	var
		bFlying=0
		owner=null
		pilot=null
		locked=0
		list/Passengers=list()

	verb
		Interact()
			set src in oview(1)
			if(bFlying==0)//make sure its not flying
				if(locked==0)//make sure the owner hasn't locked it
					if(usr in Passengers)
						Passengers-=usr
						usr.IN_AIRSHIP=0
						usr.loc=locate(src.x,src.y,src.z)
						usr.client.eye=usr
					else
						Passengers+=usr
						usr.IN_AIRSHIP=1
						src.contents+=usr
						usr.client.eye=src
					//	usr.client.mob=src








	proc
		Grow()
			// expand (scale by 2x2) over 1/2s
			animate(src, transform = matrix()*2, time = 5)
			bFlying=1

	proc
		Shrink()
			// decrease (scale by 2x2) over 1/2s
			animate(src, transform = matrix()/2, time = 5)
			bFlying=0

/* Airship controls.
	You can turn left and right with D/A.
	You can accelerate forward and backwards with W/S.
	You will slow to a stop if not accelerating.
*/




	transform = matrix(24/32, 0, 0, 0, 32/32, 0)
	bound_width = 32
	bound_height = 32
	bound_x = 12
	bound_y = 8

	var
		tmp
			turning = 0
			accelerating = 0

	proc
		// Degrees per decisecond of turning.
		TurnRate()
			return 10

		// How fast speed increases when accelerating.
		Acceleration()
			return 5

		// How fast speed decreases when not accelerating.
		Deceleration()
			return 0.25

	UpdateMoveInput(button_tracker/buttons, button)
		..()
		turning = move_input.x // Turn with horizontal move input.
		accelerating = move_input.y // Accelerate with vertical move input.

	PlayerUpdate()
		..()

		// Turn when turning.
		Turn(turning * TurnRate() * PlayerLoop.tick_lag)

		// Reproject velocity onto the forward axis.
		SetVelocity(Forward() * Velocity().Dot(Forward()))

		// This will be how much our velocity changes during this tick.
		var vector2/acceleration = Vector2.Zero

		// Accelerate when accelerating.
		if(accelerating)
			acceleration += Forward() * (accelerating * Acceleration())

		// Decelerate constantly.
		acceleration -= Velocity() * Deceleration()

		// Apply acceleration.
		if(acceleration ~! Vector2.Zero)
			SetVelocity(Velocity() + acceleration * PlayerLoop.tick_lag)


/* Gives players a move speed variable.
	This is used by most (but not all) control schemes.
*/

mob/player
	var
		// How many pixels to move per decisecond
		move_speed = 16


/* Sets up the player for custom movement controls.
*/



//client
//	Move()

mob/player
	var
		// Should diagonal moves be the same speed as non-diagonal moves?
		normalize_movement = FALSE

		tmp
			vector2/move_input

	Login()
		..()
		move_input = Vector2.Zero
		EVENT_ADD(client.macros.OnPressed, src, .proc/UpdateMoveInput)
		EVENT_ADD(client.macros.OnReleased, src, .proc/UpdateMoveInput)

	proc
		UpdateMoveInput()
			var vector2/new_move_input = new/vector2(
				client.macros["D"] - client.macros["A"],
				client.macros["W"] - client.macros["S"])

			if(normalize_movement && new_move_input ~! Vector2.Zero)
				new_move_input = new_move_input.Normalized()

			if(new_move_input ~! move_input)
				move_input = new_move_input
				MoveInputChanged()

		MoveInputChanged()

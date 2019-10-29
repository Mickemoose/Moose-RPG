/* Adds a forward direction to atoms.
	Changing this will rotate the transform to the forward direction (from up).
*/
atom
	var
		tmp
			vector2/forward

	New()
		..()
		if(forward)
			var f = forward
			forward = null
			SetForward(f)

	proc
		/* Forward vector, which way you're facing.
		*/
		Forward()
			return forward || Vector2.North

		/* Set the forward vector.
			This rotates the transform to point in the direction of the vector.
			Assumes your icon points north originally.
		*/
		SetForward(vector2/new_forward)
			new_forward = new_forward.Normalized()
			if(forward ~! new_forward)
				var vector2/old_forward = Forward()
				forward = new_forward
				animate(src,
					time = world.tick_lag,
					flags = ANIMATION_END_NOW | ANIMATION_LINEAR_TRANSFORM | ANIMATION_RELATIVE,
					transform = new_forward.Rotation() / old_forward.Rotation()
				)

		/* Turn forward by an angle in clockwise degrees.
		*/
		Turn(angle)
			SetForward(Forward().Turn(angle))

/* Makes the camera turn with the player.
	Try this with AirshipControls
*/

mob/player
	SetForward(vector2/new_forward)
		var matrix
			old_rotation = Forward().Rotation()
			new_rotation = new_forward.Rotation()
		..()
		animate(client.world_plane_master,
			time = 1,
			flags = ANIMATION_END_NOW | ANIMATION_PARALLEL | ANIMATION_RELATIVE,
			transform = old_rotation / new_rotation)


/*
	Adds a plane master for the world plane.
*/

obj/plane_master
	screen_loc = "1,1"
	appearance_flags = PLANE_MASTER// | PIXEL_SCALE

client
	var
		obj/plane_master/world_plane_master

	New()
		screen += world_plane_master = new
		. = ..()

mouse_position
	WorldPosition(matrix/world_plane_transform, map_format)
		return ..(world_plane_transform || client.world_plane_master.transform)

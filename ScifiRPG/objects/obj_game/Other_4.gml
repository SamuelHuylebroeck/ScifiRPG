if room == room_sandbox
{
	layer_set_visible("Collision", false)
	global.pathing_grid = mp_grid_create(0,0, floor(room_height/global.pathing_grid_cell_height), floor(room_width*global.pathing_grid_cell_width), global.pathing_grid_cell_width, global.pathing_grid_cell_height);
	global.free_pathing_grid = mp_grid_create(0,0, floor(room_height/global.pathing_grid_cell_height), floor(room_width*global.pathing_grid_cell_width), global.pathing_grid_cell_width, global.pathing_grid_cell_height);
	scr_enemy_pathing_register_collision_tiles()

	scr_init_listener();
}
if room == room_parent
{
	global.game_paused = false
	camera_start_pos_x =0
	camera_start_pos_y = 0
	room_goto(ROOM_START)
}

camera_set_view_pos(view_camera[0], camera_start_pos_x, camera_start_pos_y)
/// @description Player god mode
if(!player_debug_mode)
{
	show_debug_message("Player Debug Mode activated")
	grace_frames += 1000
	available_reactor_points +=100
	walk_speed_pps += 64
	max_speed_walk=walk_speed_pps/game_get_speed(gamespeed_fps)
	
}
 
if (player_debug_mode)
{
	show_debug_message("Player Debug Mode de-activated")
	grace_frames -= 1000
	available_reactor_points -=100
	walk_speed_pps -= 64
	max_speed_walk=walk_speed_pps/game_get_speed(gamespeed_fps)
}
player_debug_mode = !player_debug_mode
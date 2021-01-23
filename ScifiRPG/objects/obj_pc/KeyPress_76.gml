/// @description Insert description here
// You can write your code in this editor



if(!player_debug_mode)
{
	show_debug_message("Player Debug Mode activated")
	max_speed_walk *= 2
	grace_frames += 1000
	available_reactor_points +=100
}
 
if (player_debug_mode)
{
	show_debug_message("Player Debug Mode de-activated")
	max_speed_walk /= 2
	grace_frames -= 1000
	available_reactor_points -=100
}
player_debug_mode = !player_debug_mode
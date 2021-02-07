/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(global.debug_boss) scr_enemy_draw_boss_frigate_relative_position_arrows()
if(global.debug_enemy_draw_paths and current_patrol_path != noone)
{
	draw_set_alpha(0.3);
	var old_color = draw_get_color()
	draw_set_color(c_blue)
	draw_path(current_patrol_path,x,y,true);
	if(current_patrol_path != noone) draw_path(current_patrol_path,x,y,true);
	draw_set_alpha(1);
	draw_set_color(old_color)
	
	var current_index = floor(path_position * path_get_number(current_patrol_path))
	var next_point_index = (floor(path_position * path_get_number(current_patrol_path)) + 1 )% path_get_number(current_patrol_path)
	var next_path_point_x = path_get_point_x(current_patrol_path,next_point_index)
	var next_path_point_y = path_get_point_y(current_patrol_path,next_point_index)
	draw_arrow(x,y, path_get_point_x(current_patrol_path,current_index),path_get_point_y(current_patrol_path,current_index),2 )
	draw_arrow(x,y,next_path_point_x,next_path_point_y,2)
}

		
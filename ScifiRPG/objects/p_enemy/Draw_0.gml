/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(global.debug_enemy_draw_aggro) scr_enemy_draw_aggro_radius(); 
if(global.debug_enemy_draw_current_direction) scr_enemy_draw_direction();
if(global.debug_enemy_draw_target_direction) scr_enemy_draw_target_direction();
if(global.debug_enemy_draw_paths)
{
	draw_set_alpha(0.3);
	draw_path(goto_path,x,y,true);
	if(patrol_path != noone) draw_path(patrol_path,x,y,true);
	draw_set_alpha(1);
}

/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(global.debug_enemy_draw_aggro) scr_enemy_draw_aggro_radius(); 
if(global.debug_enemy_draw_current_direction) scr_enemy_draw_direction();
if(global.debug_enemy_draw_target_direction) scr_enemy_draw_target_direction();
if(global.debug_enemy_draw_paths)
{
	var old_alpha = draw_get_alpha()
	var old_color = draw_get_color()
	draw_set_alpha(0.3);
	draw_path(goto_path,x,y,true);
	if(patrol_path != noone){
		draw_set_color(c_lime)
		draw_path(patrol_path,x,y,true);
	} 
	draw_set_alpha(old_alpha);
	draw_set_color(old_color)
}
if(global.debug_enemy_states){
	show_internal_state()
}

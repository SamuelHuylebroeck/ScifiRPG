// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_toggle_debug_visuals(){
	global.debug_enemy_draw_aggro = !global.debug_enemy_draw_aggro;
	global.debug_enemy_draw_current_direction = !global.debug_enemy_draw_current_direction;
	global.debug_enemy_draw_target_direction = !global.debug_enemy_draw_target_direction;
	global.debug_enemy_draw_paths = !global.debug_enemy_draw_paths;
	global.debug_boss =  !global.debug_boss;
	global.debug_draw_audio_listeners = !global.debug_draw_audio_listeners;
	global.debug_draw_debug_commands = !global.debug_draw_debug_commands;
	global.debug_enemy_states = !global.debug_enemy_states;
}
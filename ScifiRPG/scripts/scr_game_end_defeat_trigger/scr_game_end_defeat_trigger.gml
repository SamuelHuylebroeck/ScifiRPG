// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_game_end_defeat_trigger(){
	audio_sound_gain(so_sfx_defeat,global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
	audio_play_sound(so_sfx_defeat,global.sfx_priority,false)
	var sl= audio_sound_length(so_sfx_defeat)
	with(obj_game){
		alarm[0] = sl*game_get_speed(gamespeed_fps)
	}

}
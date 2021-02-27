// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_levelup(){
	
	current_level++
	available_reactor_points++;
	audio_sound_gain(so_sfx_level,global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
	audio_play_sound(so_sfx_level,global.sfx_priority,false)
	current_xp -= xp_to_next_level;
	xp_to_next_level = (current_level+1) * global.levelling_xp_scale
	current_hp = max_hp
	if(current_level == max_level){
		current_xp = xp_to_next_level
	}
}
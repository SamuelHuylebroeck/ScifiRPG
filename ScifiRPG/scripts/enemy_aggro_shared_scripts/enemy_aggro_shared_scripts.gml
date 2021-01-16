// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_check_aggro(){
	//Check for aggro
	if (++aggro_check > aggro_check_interval)
	{
		
		aggro_check = 0;
		if(instance_exists(obj_pc) && (point_distance(x,y, obj_pc.x, obj_pc.y) <= enemy_aggro_radius))
		{
			return true;
		} else {
			return false;
		}
	} else {
		return false;
	}
	
}

function scr_enemy_aggro_play_acquired_sfx(){
	if(enemy_sfx_aggro != -1)
	{
		audio_sound_gain(enemy_sfx_aggro,global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
		audio_play_sound_on(entity_emit,enemy_sfx_aggro,false,global.sfx_priority)
	}
}

function scr_enemy_aggro_setup_chase(){
	state = ENEMY_STATE.CHASE;
	target = obj_pc;
}
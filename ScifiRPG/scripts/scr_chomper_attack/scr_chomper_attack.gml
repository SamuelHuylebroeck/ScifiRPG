// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_chomper_attack(){
	if (not state_initialized){
		scr_chomper_attack_init()
	}
	scr_enemy_animate_attack()
	//Pause on the pre-strike frame for a short bit for effect
	if( floor(image_index) == 2)
	{
		if(++anticipation_pause<anticipation_pause_duration)
		{
			image_speed = 0
		}else{
			image_speed = 1
		
		}
	
	}
	//Calculate hits, the hit frames are 5,6,7
	if(5 <= floor(image_index) and floor(image_index) <=8)
	{
		scr_enemy_calculate_attack_hits(noone,chomper_damage,chomper_knockback)
	}
	
	//End the attack
	if ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number )
	{
		anticipation_pause = 0;
		state_initialized = false;
		state_target = ENEMY_STATE.CHASE;
		state_wait_duration = 0.2 * room_speed;
		state = ENEMY_STATE.WAIT;
		sprite_index = sprite_idle;
		entity_collision = true;
	}
}

function scr_chomper_attack_init(){
		scr_enemy_animate_attack();
		image_index=0;
		if(enemy_sfx_attack != -1)
		{
			audio_sound_gain(enemy_sfx_attack,global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
			audio_play_sound_on(entity_emit,enemy_sfx_attack,false,global.sfx_priority)
		}
		//Clear hit list
		if (!ds_exists(entities_hit_by_attack, ds_type_list))
		{
			entities_hit_by_attack = ds_list_create();
		}
		ds_list_clear(entities_hit_by_attack);
		state_initialized = true;
		entity_collision = false;
}
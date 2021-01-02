// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_chomper_attack(){
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
		state_target = ENEMY_STATE.CHASE;
		state_wait_duration = 0.2 * room_speed;
		state = ENEMY_STATE.WAIT;
		sprite_index = sprite_idle;
		entity_collision = true;
	}
}
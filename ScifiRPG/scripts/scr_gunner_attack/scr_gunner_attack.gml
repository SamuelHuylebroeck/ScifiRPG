// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gunner_attack(){
	if(not state_initialized)
	{
		scr_gunner_attack_init()
	}
	var dir = point_direction(x,y,target.x, target.y);
	scr_enemy_execute_turning(dir, gunner_shooting_turn_rate_gs)
	scr_enemy_animate_attack()
	//Pause on the pre-strike frame for a short bit for effect
	if( floor(image_index) == 3)
	{
		if(++anticipation_pause<anticipation_pause_duration)
		{
			image_speed = 0
		}else{
			image_speed = 1
		
		}
	
	}
	
	//Create Shot
	if(floor(image_index) == 5 and  shots_fired < shots_to_fire){
		//Calculate the correct coordinates to create the shot at by rotating the base vector along the current direction
		fire_single_shot(obj_enemy_gunner_energy_bolt, direction,shot_origin_base_correction_x, shot_origin_base_correction_y,enemy_sfx_attack, entity_emit)
		shots_fired++
	}
	//End the attack
	if ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number )
	{
		anticipation_pause = 0;
		shots_fired = 0;
		current_shot_cooldown = gunner_shot_cooldown_gs
		state_target = ENEMY_STATE.CHASE;
		state_wait_duration = 0.2 * room_speed;
		state = ENEMY_STATE.WAIT;
		sprite_index = sprite_idle;
		entity_collision = true;
		state_initialized = false;
	}
}

function scr_gunner_attack_init(){
		entity_collision = true;
		scr_enemy_animate_attack();
		image_index=0;
		state_initialized = true;
		shots_fired = 0;
}

function fire_single_shot(shot_type, angle, origin_correction_x, origin_correction_y, shot_sfx, sfx_emitter){
		//Calculate the correct coordinates to create the shot at by rotating the base vector along the current direction
		var c = dcos(angle)
		var s = dsin(angle)
		var shot_origin_correction_x = origin_correction_x * c + origin_correction_y *s;
		var shot_origin_correction_y = origin_correction_x * (-1*s) + origin_correction_y * c
		
		var shot_fired = instance_create_layer(x+shot_origin_correction_x,y+shot_origin_correction_y,"Instances",shot_type);
		if(shot_sfx != -1)
		{
			var sfx = audio_play_sound_on(sfx_emitter,shot_sfx,false,global.sfx_priority)
			audio_sound_gain(sfx, global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
			
		}
		with(shot_fired)
		{
			direction = angle
			image_angle = angle
		}	
}
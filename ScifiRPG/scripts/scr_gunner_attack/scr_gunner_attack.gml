// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gunner_attack(){
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
		var c = dcos(direction)
		var s = dsin(direction)
		var shot_origin_correction_x = shot_origin_base_correction_x * c + shot_origin_base_correction_y *s;
		var shot_origin_correction_y = shot_origin_base_correction_x * (-1*s) + shot_origin_base_correction_y * c
		
		
		
		shot_fired = instance_create_layer(x+shot_origin_correction_x,y+shot_origin_correction_y,"Instances",obj_enemy_gunner_energy_bolt);
		with(shot_fired)
		{
			direction = other.direction
			image_angle = other.direction
		}
		shots_fired++
	}
	//End the attack
	if ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number )
	{
		anticipation_pause = 0;
		shots_fired = 0;
		current_shot_cooldown = gunner_shot_cooldown_gs
		show_debug_message(string(current_shot_cooldown))
		state_target = ENEMY_STATE.CHASE;
		state_wait_duration = 0.2 * room_speed;
		state = ENEMY_STATE.WAIT;
		sprite_index = sprite_idle;
		entity_collision = true;
	}
}
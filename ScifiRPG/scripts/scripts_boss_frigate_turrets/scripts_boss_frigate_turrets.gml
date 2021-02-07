function scr_boss_frigate_init_setup_turrets(){
	if(turret_left == noone){
		turret_left = instance_create_layer(x,y, "Instances", en_boss_frigate_turret);
		with(turret_left){
			depth= - 25
			is_left_turret = true;
			controlling_boss=other;
			if(other.target != noone){
				target = other.target
				
			}
		}
	}

	
	if(turret_right == noone){
		turret_right = instance_create_layer(x,y, "Instances", en_boss_frigate_turret);
		with(turret_right){
			depth = -25
			is_left_turret = false;
			controlling_boss=other;
			if(other.target != noone){
				target = other.target
			}
		}
	}
}

#region helper_functions
function position_turrets(){
	//right
	position_single_turret(turret_right, 7, -22)
	//left
	position_single_turret(turret_left, 7, 22)

}

function position_single_turret(turret, base_offset_x, base_offset_y){
	//Calculate the correct coordinates to create the shot at by rotating the base vector along the current direction
	var c = dcos(image_angle)
	var s = dsin(image_angle)
	var origin_correction_x = base_offset_x * c + base_offset_y *s;
	var origin_correction_y = base_offset_x * (-1*s) + base_offset_y * c
	with(turret){
		x = other.x + origin_correction_x
		y = other.y + origin_correction_y
	}
}
#endregion
	
#region behaviours
function scr_boss_frigate_turret_idle(){
	//Turn to face the target
	sprite_index = spr_boss_frigate_turret_spawn
	if(target != noone){
		x_to = target.x;
		y_to = target.y;
		
		var dir = point_direction(x,y,x_to, y_to);

		scr_enemy_execute_turning(dir, enemy_turn_rate_rs)
		image_angle = direction
	}
	if ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number ){
		state = ENEMY_STATE.CHASE;
		state_initialized = false;
		image_speed = 0;
		image_index = 0;
		sprite_index =  spr_boss_frigate_turret;
	}
	
	
}


function scr_boss_frigate_turret_chase(){
	//Turn to face the target
	if(target != noone){
		x_to = target.x;
		y_to = target.y;
		
		var dir = point_direction(x,y,x_to, y_to);

		scr_enemy_execute_turning(dir, enemy_turn_rate_rs)
		image_angle = direction
	}
	//Check if close enough to launch an attack
	if (instance_exists(target) and (point_distance(x,y, target.x, target.y) <= enemy_attack_radius) and abs(angle_difference(direction, dir)) <= enemy_move_angle_tolerance and current_shot_cooldown <= 0)
	{
		state = ENEMY_STATE.ATTACK;
		state_initialized = false;
	}
}

function scr_boss_frigate_turret_attack(){
	if(not state_initialized)
	{
		scr_turret_attack_init()
	}
	var dir = point_direction(x,y,target.x, target.y);
	scr_enemy_execute_turning(dir, enemy_turn_rate_rs);
	image_angle = direction
	//Pause on the pre-strike frame for a short bit for effect
	if( floor(image_index) == 1)
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
		current_shot_cooldown = turret_shot_cooldown * game_get_speed(gamespeed_fps) + random_range(0,turret_shot_cooldown_jitter*game_get_speed(gamespeed_fps));
		state = ENEMY_STATE.CHASE;
		image_speed = 0;
		image_index = 0;
		state_initialized = false;
	}
}
	
function scr_turret_attack_init(){
		state_initialized = true;
		shots_fired = 0;
		image_speed = 1;
		image_index = 0;
		anticipation_pause = 0;
}
#endregion
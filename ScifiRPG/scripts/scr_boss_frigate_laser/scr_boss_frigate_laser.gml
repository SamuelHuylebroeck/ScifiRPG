// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_boss_frigate_laser_hunt(){

	if(not state_initialized){
		initialize_boss_laser_hunt()
	}
	
	boss_chase_movement();
	image_angle = direction;

	var laser_origin_base_correction_x = 31
	var laser_origin_base_correction_y = 0
	var c = dcos(direction)
	var s = dsin(direction)
	var laser_origin_correction_x = laser_origin_base_correction_x * c + laser_origin_base_correction_y *s;
	var laser_origin_correction_y = laser_origin_base_correction_x * (-1*s) + laser_origin_base_correction_y * c
	if(not spinup_complete)
	{
		if ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number ){
			sprite_index = boss_sprites[state]
			image_index = 0
			spinup_complete = true;
			current_laser_duration = 0;
			laser_obj = instance_create_layer(x+ laser_origin_correction_x,y+laser_origin_correction_y,"Instances", obj_boss_frigate_laser)
			with(laser_obj){
				laser_length=96;
				direction = other.direction;
				image_angle = direction;
			}
		
		}
	}else{
	
		//position laser
		laser_obj.direction = direction
		laser_obj.x = x + laser_origin_correction_x;
		laser_obj.y = y + laser_origin_correction_y;
	
		current_laser_duration = min(++current_laser_duration, boss_max_laser_duration)
	
		if(current_laser_duration >= boss_max_laser_duration){
			end_boss_laser_hunt();
	
		}
	}
	
}
	

function initialize_boss_laser_hunt(){
	state_initialized = true
	spinup_complete = false;
	sprite_index = spr_boss_frigate_laser_spinup
	image_index = 0;
	enemy_turn_rate_rs *=0.5
	enemy_speed *= 3/4

}

function end_boss_laser_hunt(){
	state = BOSS_STATE.CHASE
	state_initialized = false
	enemy_turn_rate_rs *=2
	enemy_speed *= 4/3
	instance_destroy(laser_obj)
}

function scr_boss_frigate_laser_sweep(){
	if(not state_initialized){
		initialize_boss_laser_sweep()
	}
	
	scr_enemy_execute_turning(sweep_current_target, enemy_turn_rate_rs);
	image_angle = direction;
	
	if(angle_difference(direction, sweep_current_target) == 0 and not sweep_started ){
		sprite_index = spr_boss_frigate_laser_spinup
		image_index = 0;
		sweep_started = true;
		sweep_current_target = 315;
		enemy_turn_rate_rs *=0.25
	}
	if(sweep_started){
		
		var laser_origin_base_correction_x = 31
		var laser_origin_base_correction_y = 0
		var c = dcos(direction)
		var s = dsin(direction)
		var laser_origin_correction_x = laser_origin_base_correction_x * c + laser_origin_base_correction_y *s;
		var laser_origin_correction_y = laser_origin_base_correction_x * (-1*s) + laser_origin_base_correction_y * c
		if(not spinup_complete)
		{
			if ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number ){
				sprite_index = boss_sprites[state]
				image_index = 0
				spinup_complete = true;
				current_laser_duration = 0;
				laser_obj = instance_create_layer(x+ laser_origin_correction_x,y+laser_origin_correction_y,"Instances", obj_boss_frigate_laser)
				with(laser_obj){
					laser_length=192*4;
					direction = other.direction;
					image_angle = direction;
					laser_damage = 5;
					laser_hit_interval = 0.7;
					laser_knockback = 5;
				}
		
			}
		}else{
	
			//position laser
			laser_obj.direction = direction
			laser_obj.x = x + laser_origin_correction_x;
			laser_obj.y = y + laser_origin_correction_y;
	
			if(angle_difference(direction, sweep_current_target) == 0){
				end_boss_laser_sweep();
	
			}
		}
	}
	

}

function initialize_boss_laser_sweep(){
	sweep_current_target = 190;
	state_initialized = true;
	spinup_complete = false;
	sweep_started = false;
	
	sprite_index = spr_boss_frigate_idle;
	

}

function end_boss_laser_sweep(){
	state = BOSS_STATE.CHASE
	state_initialized = false
	enemy_turn_rate_rs *=4
	instance_destroy(laser_obj)
}

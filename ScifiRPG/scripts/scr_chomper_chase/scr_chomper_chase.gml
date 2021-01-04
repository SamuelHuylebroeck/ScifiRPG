// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_chomper_chase(){
	if (instance_exists(target) )
	{
		x_to = target.x;
		y_to = target.y;
		
		var distance_to_go = point_distance(x,y, x_to, y_to);
		var speed_this_frame = enemy_speed;
		if( distance_to_go < enemy_speed) speed_this_frame = distance_to_go;
		var dir = point_direction(x,y,x_to, y_to);
		h_speed = lengthdir_x(speed_this_frame, dir);
		v_speed = lengthdir_y(speed_this_frame, dir);
		
		if( not (abs(dir  - direction) <= enemy_move_angle_tolerance)){
			h_speed = 0;
			v_speed = 0;
		}
		
		scr_enemy_execute_turning(dir, enemy_turn_rate_rs)
		scr_enemy_execute_movement_and_collision();
		scr_enemy_animate_move();
	}
	
	
	//Check if close enough to launch an attack
	if (instance_exists(target) && (point_distance(x,y, target.x, target.y) <= enemy_attack_radius))
	{
		//Clear hit list
		if (!ds_exists(entities_hit_by_attack, ds_type_list))
		{
			entities_hit_by_attack = ds_list_create();
		}
		ds_list_clear(entities_hit_by_attack);
		state = ENEMY_STATE.ATTACK;
		entity_collision = false;
		if(enemy_sfx_attack != -1)
		{
			audio_sound_gain(enemy_sfx_attack,global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
			audio_play_sound_on(entity_emit,enemy_sfx_attack,false,global.sfx_priority)
		}
		scr_enemy_animate_attack();
		image_index=0;
	}
}
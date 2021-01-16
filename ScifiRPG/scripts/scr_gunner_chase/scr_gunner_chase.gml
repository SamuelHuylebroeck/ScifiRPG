// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gunner_chase(){
	if (instance_exists(target) )
	{
		x_to = target.x;
		y_to = target.y;	
		var distance_to_target = point_distance(x,y, x_to, y_to);
		var distance_to_go = point_distance(x,y, x_to, y_to);
		var speed_this_frame = enemy_speed;
		if( distance_to_go < enemy_speed) speed_this_frame = distance_to_go;
		if (distance_to_target <= gunner_hold_range and  distance_to_target >= gunner_retreat_range)
		{
			speed_this_frame = 0
		}
		dir = point_direction(x,y,x_to, y_to);
		h_speed = lengthdir_x(speed_this_frame, dir);
		v_speed = lengthdir_y(speed_this_frame, dir);
		if (distance_to_target <= gunner_retreat_range)
		{
			h_speed *= -1;
			v_speed *= -1;
		}
		
		if( not (abs(angle_difference(direction, dir)) <= enemy_move_angle_tolerance)){
			h_speed = 0;
			v_speed = 0;
		}
		
		scr_enemy_execute_turning(dir, enemy_turn_rate_rs)
		scr_enemy_execute_movement_and_collision();
		scr_enemy_animate_move();
	}
	
	
	//Check if close enough to launch an attack
	if (instance_exists(target) and (point_distance(x,y, target.x, target.y) <= enemy_attack_radius) and abs(angle_difference(direction, dir)) <= enemy_move_angle_tolerance and current_shot_cooldown <= 0)
	{
		state = ENEMY_STATE.ATTACK;
		state_initialized = false;
	}
}
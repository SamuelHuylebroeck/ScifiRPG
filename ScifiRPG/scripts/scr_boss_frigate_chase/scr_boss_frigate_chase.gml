// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_boss_frigate_chase(){
	//Movement
	boss_chase_movement()
	scr_boss_frigate_animate_move();
	//Check for next state evaluation
	if(current_state_change_interval == 0){
		boss_transition_from_chase_state()
	}
}

function boss_chase_movement(){
	if (instance_exists(target) )
	{
		x_to = target.x;
		y_to = target.y;	
		var distance_to_target = point_distance(x,y, x_to, y_to);
		var distance_to_go = point_distance(x,y, x_to, y_to);
		var speed_this_frame = enemy_speed;
		if( distance_to_go < enemy_speed) speed_this_frame = distance_to_go;
		var dir_to_point = point_direction(x,y,x_to, y_to);
		var dir_to_move = dir_to_point;
		//Circle around enemy if within hold range
		if (distance_to_target <= boss_hold_range and  distance_to_target >= boss_retreat_range)
		{
			dir_to_move +=90 * circle_direction;
		}
		
		h_speed = lengthdir_x(speed_this_frame, dir_to_move);
		v_speed = lengthdir_y(speed_this_frame, dir_to_move);
		if (distance_to_target <= boss_retreat_range)
		{
			h_speed *= -1;
			v_speed *= -1;
		}
		
		if( not (abs(angle_difference(direction, dir_to_point)) <= enemy_move_angle_tolerance)){
			h_speed = 0;
			v_speed = 0;
		}
		
		scr_enemy_execute_turning(dir_to_point, enemy_turn_rate_rs)
		scr_enemy_execute_movement_and_collision();
	}
}

function boss_transition_from_chase_state(){
	show_debug_message("Transitioning from chase state");
	boss_transition_chase_update_weights();
	
	ds_map_clear(ds_state_change_map)
	//Build decision stack and ordered list
	var chase_value = sc_repeat_chance[BOSS_STATE.CHASE];
	var chase_starting_point = chase_value*100;
	
	var total_mass_not_chase = 100-chase_starting_point
	var total_weight = chase_sc_weights[BOSS_STATE.GOTO_PATROL_1] + chase_sc_weights[BOSS_STATE.GOTO_PATROL_2] +chase_sc_weights[BOSS_STATE.LASER_HUNT] +chase_sc_weights[BOSS_STATE.MISSILES_HUNT];
	var current_border = chase_starting_point;
	//Chase 
	ds_map_add(ds_state_change_map, 0,BOSS_STATE.CHASE)
	//patrol 1
	current_border = add_transition_state_to_ds(ds_state_change_map, BOSS_STATE.GOTO_PATROL_1,current_border,chase_sc_weights, total_mass_not_chase, total_weight)
	//patrol 2
	current_border = add_transition_state_to_ds(ds_state_change_map, BOSS_STATE.GOTO_PATROL_2,current_border,chase_sc_weights, total_mass_not_chase, total_weight)
	//laser hunt
	current_border = add_transition_state_to_ds(ds_state_change_map, BOSS_STATE.LASER_HUNT,current_border,chase_sc_weights, total_mass_not_chase, total_weight)
	//missiles hunt
	current_border = add_transition_state_to_ds(ds_state_change_map, BOSS_STATE.MISSILES_HUNT,current_border,chase_sc_weights, total_mass_not_chase, total_weight)
	
	var next_state = scr_boss_state_weighted_random_select(ds_state_change_map, ds_state_change_stack, BOSS_STATE.CHASE)
	if(should_retreat()){
		next_state = BOSS_STATE.RETREAT;
	}

	switch next_state {
		case BOSS_STATE.CHASE:
			show_debug_message("Chase");
			sc_repeat_chance[BOSS_STATE.CHASE] *= sc_repeat_chance[BOSS_STATE.CHASE]
			circle_direction *= -1;
			break;
		case BOSS_STATE.GOTO_PATROL_1:
			show_debug_message("Goto patrol 1");
			current_patrol_path = patrol_path_one;
			x_to = path_get_x(current_patrol_path, 0);
			y_to = path_get_y(current_patrol_path, 0);
			state_target = BOSS_STATE.PATROL_1;
			boss_transition_reset_chase_weights();
			break;
		case BOSS_STATE.GOTO_PATROL_2:
			show_debug_message("Goto patrol 2");
			current_patrol_path = patrol_path_two;
			x_to = path_get_x(current_patrol_path, 0);
			y_to = path_get_y(current_patrol_path, 0);
			state_target = BOSS_STATE.PATROL_2;
			boss_transition_reset_chase_weights();
			break;
		case BOSS_STATE.MISSILES_HUNT:
			show_debug_message("Missiles Hunt");
			boss_transition_reset_chase_weights();
			break;
		case BOSS_STATE.LASER_HUNT:
			show_debug_message("Laser Hunt");
			boss_transition_reset_chase_weights();
			break;
		case BOSS_STATE.RETREAT:
			show_debug_message("Retreat")
			set_up_retreat()
			boss_transition_reset_chase_weights();
			
		
		default:
			show_debug_message("Default");
			break;
	}
	
	current_state_change_interval = boss_state_change_interval * game_get_speed(gamespeed_fps);
	state = next_state;
}

function add_transition_state_to_ds(map, state, current_border, weight_map, mass, total_weight){
	var updated_border = current_border;
	if(weight_map[state] > 0)
	{
		ds_map_add(map, current_border,state)
		updated_border += weight_map[state] * ( mass/total_weight)
	}
	return updated_border
}

function boss_transition_chase_update_weights(){
	var laser_hunt_weight = calculate_laser_hunt_weight(target,boss_laser_falloff_range, boss_laser_max_range, chase_sc_default_weights[BOSS_STATE.LASER_HUNT] )
	chase_sc_weights[BOSS_STATE.LASER_HUNT] = laser_hunt_weight;
	var missile_hunt_weight = calculate_missile_hunt_weight(target, boss_missile_min_range, boss_missile_max_range, chase_sc_default_weights[BOSS_STATE.MISSILES_HUNT]  )
	chase_sc_weights[BOSS_STATE.MISSILES_HUNT] = missile_hunt_weight;

}

function boss_transition_reset_chase_weights(){
	sc_repeat_chance[BOSS_STATE.CHASE] = sc_repeat_chance_default[BOSS_STATE.CHASE]
	chase_sc_weights[BOSS_STATE.GOTO_PATROL_1] = chase_sc_default_weights[BOSS_STATE.GOTO_PATROL_1];
	chase_sc_weights[BOSS_STATE.GOTO_PATROL_2] = chase_sc_default_weights[BOSS_STATE.GOTO_PATROL_2];
	chase_sc_weights[BOSS_STATE.LASER_HUNT] = chase_sc_default_weights[BOSS_STATE.LASER_HUNT];
	chase_sc_weights[BOSS_STATE.MISSILES_HUNT] = chase_sc_default_weights[BOSS_STATE.MISSILES_HUNT];
}
	
	
function calculate_laser_hunt_weight(target, fall_off_range, max_range, max_weight){
	var distance_to_target = point_distance(x,y,target.x,target.y)
	var unbound_scale = (-1/(max_range - fall_off_range)) * (distance_to_target-fall_off_range) +1;
	var scale = clamp(unbound_scale, 0,1)
	//show_debug_message("Distance to target : " +string(distance_to_target) +", scale: " + string(scale));
	return scale*max_weight;
}

function calculate_missile_hunt_weight(target, min_range, max_range, max_weight){
	var scale = 0;
	var distance_to_target = point_distance(x,y,target.x,target.y)
	if (distance_to_target >= min_range and distance_to_target <= max_range)
	{
		scale = 1
	
	}
	var remaining_relative_cooldown = current_missile_cooldown / (boss_missile_cooldown*game_get_speed(gamespeed_fps))
	var scale_cooldown = clamp(power(remaining_relative_cooldown-1,2),0,1)
	scale *= scale_cooldown;
	show_debug_message("Distance to target : " +string(distance_to_target) + ", cd: "+string(remaining_relative_cooldown) +", scale: " + string(scale));
	return scale * max_weight;

}
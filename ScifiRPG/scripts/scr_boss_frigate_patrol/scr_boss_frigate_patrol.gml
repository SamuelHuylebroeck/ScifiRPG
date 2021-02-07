// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_boss_frigate_patrol(){
	if(not state_initialized and current_patrol_path != noone){
		show_debug_message("Boss patrol started")
		state_initialized = true;
		path_started = false;
	}
	
	//Turn to face the first direction first
	if(not path_started){
		var dir = point_direction(x,y,path_get_point_x(current_patrol_path,1), path_get_point_y(current_patrol_path,1))
		scr_enemy_execute_turning(dir, enemy_turn_rate_rs)
		image_angle = direction
		if((abs(dir  - direction) <= enemy_move_angle_tolerance)){
			path_started = true;
			path_start(current_patrol_path, enemy_speed, path_action_continue,true);
		}
	}
	scr_boss_frigate_animate_patrol_move();
	//Check for next state evaluation
	if(current_state_change_interval == 0){
		scr_boss_transition_from_patrol_state()
	}
}

function scr_boss_transition_from_patrol_state()
{
	show_debug_message("Transitioning from patrol state");
	boss_transition_patrol_update_weights();
	ds_map_clear(ds_state_change_map)
	//Build decision stack and ordered list
	var patrol_value = sc_repeat_chance[state];
	var patrol_starting_point = patrol_value*100;
	
	var total_mass_not_patrol = 100-patrol_starting_point
	var total_weight = patrol_sc_weights[BOSS_STATE.CHASE] + patrol_sc_weights[BOSS_STATE.MISSILES_PATROL];
	var current_border = patrol_starting_point;
	//Return to this state 
	ds_map_add(ds_state_change_map, 0,state)
	//Chase
	current_border = add_transition_state_to_ds(ds_state_change_map, BOSS_STATE.CHASE,current_border, patrol_sc_weights, total_mass_not_patrol, total_weight)
	//Chase
	current_border = add_transition_state_to_ds(ds_state_change_map, BOSS_STATE.MISSILES_PATROL,current_border, patrol_sc_weights, total_mass_not_patrol, total_weight)
	var next_state = scr_boss_state_weighted_random_select(ds_state_change_map, ds_state_change_stack, BOSS_STATE.CHASE)
	
	if(should_retreat()){
		next_state = BOSS_STATE.RETREAT;
	}
	
	switch next_state {
		case BOSS_STATE.CHASE:
			show_debug_message("Chase");
			path_end()
			break;
		case BOSS_STATE.MISSILES_PATROL:
			show_debug_message("Missiles Patrol");
			state_previous = state;
			boss_transition_reset_patrol_weights();
			break;
		case BOSS_STATE.PATROL_1:	
		case BOSS_STATE.PATROL_2:
			sc_repeat_chance[state] -= 0.05
			break;
		case BOSS_STATE.RETREAT:
			show_debug_message("Retreat");
			set_up_retreat();
			path_end();
			boss_transition_reset_patrol_weights();
			
		default:
			show_debug_message("Default");
			break;
	}
	
	current_state_change_interval = boss_state_change_interval * game_get_speed(gamespeed_fps);
	if(state != next_state){
		//Reset weights
		boss_transition_reset_patrol_weights()
		state_initialized = false;
		state = next_state;
	}
}

function boss_transition_patrol_update_weights(){
	var missile_hunt_weight = calculate_missile_hunt_weight(target, boss_missile_min_range, boss_missile_max_range, patrol_sc_default_weights[BOSS_STATE.MISSILES_PATROL]  )
	patrol_sc_weights[BOSS_STATE.MISSILES_PATROL] = missile_hunt_weight;
}



function boss_transition_reset_patrol_weights()
{
	sc_repeat_chance[state] = sc_repeat_chance_default[state]
	patrol_sc_weights[BOSS_STATE.CHASE] = patrol_sc_default_weights[BOSS_STATE.CHASE];
	patrol_sc_weights[BOSS_STATE.MISSILES_PATROL] = patrol_sc_default_weights[BOSS_STATE.MISSILES_PATROL];

}



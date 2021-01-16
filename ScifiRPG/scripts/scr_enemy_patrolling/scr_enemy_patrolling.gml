// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_patrolling(){
	
	if(not state_initialized and patrol_path != noone){
		state_initialized = true;
		path_start(patrol_path,enemy_speed, path_action_continue, true);
	}
	scr_enemy_animate_move();
	check_for_aggro_patrol();
}

function check_for_aggro_patrol()
{
	//Check for aggro
	if(scr_enemy_check_aggro()){
		show_debug_message("Target Found!");
		scr_enemy_aggro_play_acquired_sfx();
		scr_enemy_aggro_setup_chase();
		//Patrol specific cleanup
		state_previous = state;
		state_initialized = false;
		path_end();

	}
}
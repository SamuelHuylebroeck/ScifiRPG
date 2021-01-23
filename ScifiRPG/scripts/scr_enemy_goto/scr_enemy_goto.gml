// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_goto(){
	if(not state_initialized)
	{
		scr_initialize_goto();
	}
	
	scr_enemy_animate_move();
	//End path at destination
	if((x >= x_to-global.pathing_grid_cell_width/8  and  x <= x_to+global.pathing_grid_cell_width/8) 
		and y >= y_to - global.pathing_grid_cell_height/8 and y <= y_to + global.pathing_grid_cell_height/8)
	{
		state_initialized = false;
		state = state_target;
		path_end()
	}
	//Allow for aggroing
	check_for_aggro_goto();
}

function scr_initialize_goto()
{

	state_initialized = true;
	//Create path
	
	path_found = mp_grid_path(global.pathing_grid,goto_path,x,y,x_to,y_to,true);
	
	//Start on path
	if (path_found)
	{
		path_start(goto_path, enemy_speed, path_action_stop,true);
	}
}

function check_for_aggro_goto()
{
	if(scr_enemy_check_aggro()){
		show_debug_message("Target Found!");
		scr_enemy_aggro_play_acquired_sfx();
		scr_enemy_aggro_setup_chase();
		//goto specific cleanup
		state_initialized = false;
		path_end();
	}
}
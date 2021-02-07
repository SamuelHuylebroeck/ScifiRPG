// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_boss_frigate_goto(){
	if(not state_initialized)
	{
		scr_boss_initialize_goto();
	}
	if(should_retreat()){
		if (path_started) path_end()
		set_up_retreat()
		state = BOSS_STATE.RETREAT;
		state_initialized = false;
	
	}
	
	if(not path_started and path_found)
	{
		//Turn to face the first direction first
		var dir = point_direction(x,y,path_get_point_x(goto_path,1), path_get_point_y(goto_path,1))
		scr_enemy_execute_turning(dir, enemy_turn_rate_rs)
		image_angle = direction;
		if((abs(dir  - direction) <= enemy_move_angle_tolerance)){
			path_started = true;
			path_start(goto_path, enemy_speed, path_action_stop,true);
		}
	}
	
	
	scr_boss_frigate_animate_goto_move();
	//End path at destination
	if((x >= x_to-global.pathing_grid_cell_width/8  and  x <= x_to+global.pathing_grid_cell_width/8) 
		and y >= y_to - global.pathing_grid_cell_height/8 and y <= y_to + global.pathing_grid_cell_height/8)
	{
		state_initialized = false;
		state = state_target;
		path_end()
	}
}


function scr_boss_initialize_goto()
{

	state_initialized = true;
	//Create path
	path_found = mp_grid_path(global.free_pathing_grid,goto_path,x,y,x_to,y_to,true);
	path_started = false;
	//Start on path
	if ( not path_found)
	{
		state = BOSS_STATE.CHASE
	}
}
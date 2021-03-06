// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_wander(){

	//At destination or given up
	if( (x == x_to && y == y_to) || (time_passed > enemy_wander_distance / enemy_speed) )
	{
		h_speed = 0;
		v_speed = 0;
		
		//End current animation
		if(image_index <1){
			sprite_index = sprite_idle
		}
		
		//Set new target for destination
		if( ++wait >= wait_duration_current ) 
		{
			wait =  0;
			wait_duration_current = (wait_duration_base + irandom(enemy_wander_wait_time_variance)) * room_speed
			time_passed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45,45)
			x_to = x + lengthdir_x(enemy_wander_distance , dir)
			y_to = y + lengthdir_y(enemy_wander_distance, dir)

		}
	}else
	{ //Move towards destination
		time_passed++;
		var distance_to_go = point_distance(x,y, x_to, y_to)
		var speed_this_frame = enemy_speed
		if( distance_to_go < enemy_speed) speed_this_frame = distance_to_go;
		dir = point_direction(x,y,x_to, y_to)
		h_speed = lengthdir_x(speed_this_frame, dir)
		v_speed = lengthdir_y(speed_this_frame, dir)
		
		if( not (abs(dir  - direction) <= enemy_move_angle_tolerance)){
			h_speed = 0;
			v_speed = 0;
		}
		
		
		//Collide & move
		scr_enemy_execute_turning(dir, enemy_turn_rate_rs)
		scr_enemy_execute_movement_and_collision();
		scr_enemy_animate_move();
		
		check_for_aggro_wander();

	
	}

	
}

function check_for_aggro_wander()
{
	//Check for aggro
	if(scr_enemy_check_aggro()){
		//show_debug_message("Target Found!");
		scr_enemy_aggro_play_acquired_sfx();
		scr_enemy_aggro_setup_chase();
		//Wander specific cleanup
		state_initialized = false;
	}
}

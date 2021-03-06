// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_chomper_hurt(){
	sprite_index = sprite_hurt
	
	//The third frame is the hold frame during knockback animation
	if( floor(image_index) == 2){
		image_speed=0.0
	}
	
	var distance_to_go = point_distance(x,y,x_to, y_to)
	if(distance_to_go > enemy_speed) {
		dir = point_direction(x,y, x_to, y_to)
		h_speed = lengthdir_x(enemy_speed, dir)
		v_speed = lengthdir_y(enemy_speed, dir)
		if(scr_enemy_execute_movement_and_collision())
		{
			x_to = x;
			y_to = y;
		}
	}
	else
	{
		x = x_to
		y = y_to
		image_speed=1.0
		if(image_index >= 3.8){
			switch(state_previous){
				case ENEMY_STATE.ATTACK:
					state = ENEMY_STATE.CHASE
					break;
				case ENEMY_STATE.PATROL:
					//Go back to the start of the patrol path
					scr_enemy_order_to_patrol_start()
					break;
				case ENEMY_STATE.IDLE:
				default:
					state = state_previous
					state_previous = -1
					state_initialized = false;
					break;
				
			}
			
		}
		
	}

}
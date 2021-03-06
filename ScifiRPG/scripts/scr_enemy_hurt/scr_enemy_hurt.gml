function scr_enemy_hurt(){
	sprite_index = sprite_hurt
	var distance_to_go = point_distance(x,y,x_to, y_to)
	if(distance_to_go > enemy_speed) {
		image_speed = 1.0
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
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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
		if(state_previous != ENEMY_STATE.ATTACK) state = state_previous; else state = ENEMY_STATE.CHASE
	}
}
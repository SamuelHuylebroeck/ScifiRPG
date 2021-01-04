// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_state_hurt(){
	sprite_index = anim_hurt
	
	var distance_to_go = point_distance(x,y,x_to, y_to)
	if(distance_to_go > max_speed_walk) {
		image_speed = 1.0
		dir = point_direction(x,y, x_to, y_to)
		h_speed = lengthdir_x(max_speed_walk, dir)
		v_speed = lengthdir_y(max_speed_walk, dir)
		if(scr_player_collision())
		{
			x_to = x;
			y_to = y;
		}
	}
	else
	{
		x = x_to;
		y = y_to;
		x_to = -1;
		y_to = -1;
		state = PLAYER_STATE.FREE;
		//Reset attacks
		current_attack_script = scr_player_attack_slash_1;
		attack_done = true;
	}
}
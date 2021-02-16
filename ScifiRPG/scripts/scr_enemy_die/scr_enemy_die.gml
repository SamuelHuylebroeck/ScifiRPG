// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_die(){
	if(not state_initialized){
		initialize_die()
	
	}
	if(enemy_can_be_staggered)
	{
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
		} else
		{
			x = x_to
			y = y_to
		}
	}
	if( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number)
	{
		instance_destroy()
	}
}

function initialize_die(){
	sprite_index = sprite_die
	image_index = 0;
	image_speed = 1;
	state_initialized = true;

}

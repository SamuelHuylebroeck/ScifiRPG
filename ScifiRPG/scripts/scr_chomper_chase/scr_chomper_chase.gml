// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_chomper_chase(){
	if (instance_exists(target) )
	{
		x_to = target.x;
		y_to = target.y;
		
		var distance_to_go = point_distance(x,y, x_to, y_to);
		var speed_this_frame = enemy_speed;
		if( distance_to_go < enemy_speed) speed_this_frame = distance_to_go;
		dir = point_direction(x,y,x_to, y_to);
		h_speed = lengthdir_x(speed_this_frame, dir);
		v_speed = lengthdir_y(speed_this_frame, dir);
		
		if( not (abs(dir  - direction) <= enemy_move_angle_tolerance)){
			h_speed = 0;
			v_speed = 0;
		}
		
		scr_enemy_execute_turning(dir)
		scr_enemy_execute_movement_and_collision();
		scr_enemy_animate_move();
	}
	
	
	//Check if close enough to launch an attack
	if (instance_exists(target) && (point_distance(x,y, target.x, target.y) <= enemy_attack_radius))
	{
		state = ENEMY_STATE.ATTACK;
		entity_collision = false;
		scr_enemy_animate_attack();
		image_index=0;
	}
}
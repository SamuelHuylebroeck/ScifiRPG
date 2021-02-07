// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_boss_frigate_animate_move(){
	sprite_index = boss_sprites[state]
	image_angle = self.direction
}

function scr_boss_frigate_animate_goto_move(){
	sprite_index = boss_sprites[state]
	if(goto_path != noone){
		scr_boss_frigate_patrol_image_rotation(goto_path, enemy_turn_rate_rs)
	}
}

function scr_boss_frigate_animate_patrol_move(){
	sprite_index = boss_sprites[state]
	//Determine rotation by rotating towards the next point in the path
	if(current_patrol_path != noone){
		scr_boss_frigate_patrol_image_rotation(current_patrol_path, enemy_turn_rate_rs)
	}
}

function scr_boss_frigate_patrol_image_rotation(path, turn_rate){
	var current_direction = image_angle;
	var next_point_index = (floor(path_position * path_get_number(path)) + 1 )% path_get_number(path)
	var next_path_point_x = path_get_point_x(path,next_point_index)
	var next_path_point_y = path_get_point_y(path,next_point_index)
	
	var target_direction = point_direction(x,y,next_path_point_x, next_path_point_y)
	
	var turn_commit = sign(angle_difference(current_direction,target_direction))*turn_rate
	if(abs(angle_difference(current_direction,target_direction)) <= turn_rate) turn_commit = angle_difference(current_direction,target_direction)
	 //Commit turning
	 //show_debug_message("(" + string(image_angle) + "-" + string(turn_commit) + ")/" +string(target_direction))
	 image_angle = (image_angle - turn_commit)%360
}
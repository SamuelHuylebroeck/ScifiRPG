// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_execute_turning(target_direction, turn_rate){
	var current_direction = direction
	var turn_commit = sign(angle_difference(current_direction,target_direction))*turn_rate
	if(abs(angle_difference(current_direction,target_direction)) <= turn_rate) turn_commit = angle_difference(current_direction,target_direction)
	 //Commit turning
	 direction -= turn_commit
}
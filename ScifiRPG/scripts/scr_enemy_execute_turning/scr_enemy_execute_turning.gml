// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_execute_turning(target_direction){
	var current_direction = direction
	var turn_commit = sign(target_direction - current_direction)*enemy_turn_rate_rs
	if(abs(target_direction-current_direction) <= enemy_turn_rate_rs) turn_commit = target_direction - current_direction
	 //Commit turning
	 direction += turn_commit
}
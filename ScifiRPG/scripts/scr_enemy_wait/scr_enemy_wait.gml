// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_wait(){
	if (++state_wait >= state_wait_duration)
	{
		state_wait = 0; 
		state = state_target
	}
}
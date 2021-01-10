// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spawner_idle(){
	if(spawn_current_cooldown_gs == 0){
		state=SPAWNER_STATE.SPAWNING
	
	}
	spawn_current_cooldown_gs= max( --spawn_current_cooldown_gs,0)
}
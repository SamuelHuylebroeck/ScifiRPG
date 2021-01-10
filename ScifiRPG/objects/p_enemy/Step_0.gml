//Execute statemachine
event_inherited();

if(!global.game_paused){
	if(enemy_script[state] != -1){
		script_execute(enemy_script[state])
	}
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_state_combo_attack(){
	if(current_attack_script != -1 and current_attack_script != noone) script_execute(current_attack_script)
}
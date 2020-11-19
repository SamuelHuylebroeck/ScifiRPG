// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_attack_slash_2(){
	// Config, sprite specific data
	var frame_start = 5
	var frame_end = 8
	var default_state = scr_player_state_free
	var next_chain = scr_player_attack_spin
	scr_player_combo_attack(default_state, next_chain, frame_start, frame_end, noone)
}
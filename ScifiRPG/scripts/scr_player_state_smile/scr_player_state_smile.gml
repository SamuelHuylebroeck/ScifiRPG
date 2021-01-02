// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_state_smile(){
	if (image_index == sprite_get_number(sprite_index)-1){
		state = PLAYER_STATE.FREE
	}
}
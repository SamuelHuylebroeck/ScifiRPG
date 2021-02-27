// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_game_end_victory_resolution(){
	with(obj_game){
		camera_start_pos_x=0
		camera_start_pos_y=0
	}
	room_goto(room_game_end)

}
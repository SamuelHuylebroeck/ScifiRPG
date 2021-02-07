// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_init_listener(){
	
	var info = audio_get_listener_info(0)
	audio_listener_set_orientation(info[? "index"], 0, 0, -1, 0,1, 0);
	ds_map_destroy(info)
}
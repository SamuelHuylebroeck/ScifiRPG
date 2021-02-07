/// @description Insert description here
// You can write your code in this editor
if(global.debug_draw_grid)
{
	draw_set_alpha(0.3);
	mp_grid_draw(global.pathing_grid);
	draw_set_alpha(1);
}

if(global.debug_draw_audio_listeners){
	var listener = audio_get_listener_info(0)
	var listener_index = listener[? "index"]
	var data = audio_listener_get_data(listener_index);
	var old_color = draw_get_color();
	
	//Listener position
	draw_set_color(c_blue);
	draw_circle(data[? "x"], data[? "y"], 5, true);
	
	ds_map_destroy(listener);
	ds_map_destroy(data);
	draw_set_color(old_color);
}
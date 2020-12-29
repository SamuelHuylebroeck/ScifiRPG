// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_draw_direction(){
	var old_colour = draw_get_color()
	var length = enemy_aggro_radius/3
	var x_2 = x+lengthdir_x(length, direction);
	var y_2 = y+lengthdir_y(length, direction);
	draw_set_color(c_green);
	draw_arrow(x,y,x_2,y_2,2);
	draw_set_color(old_colour);
}
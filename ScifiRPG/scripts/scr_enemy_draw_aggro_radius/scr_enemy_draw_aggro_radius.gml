// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_draw_aggro_radius(){
	var old_colour = draw_get_color()
	draw_set_color(c_red)
	draw_circle(x,y,enemy_aggro_radius,true)
	draw_set_color(old_colour)
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_draw_target_direction(){
	var x_2=0, y_2=0
	var old_colour = draw_get_color()
	if(target != noone){
		x_2 = target.x;
		y_2 = target.y;
		draw_set_color(c_red);
	}else {
		x_2 = x_to;
		y_2 = y_to;
		draw_set_color(c_yellow);
	}
	
	var length = enemy_aggro_radius/3
	draw_arrow(x,y,x_2,y_2,2);
	draw_set_color(old_colour);
}
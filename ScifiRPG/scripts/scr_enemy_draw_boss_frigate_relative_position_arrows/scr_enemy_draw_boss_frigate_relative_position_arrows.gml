// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_draw_boss_frigate_relative_position_arrows(){
	var old_color = draw_get_color()
	draw_set_color(c_blue)

	var shot_origin_base_correction_x = -10
	var shot_origin_base_correction_y = 20


	var c = dcos(direction)
	var s = dsin(direction)
	var shot_origin_correction_x = shot_origin_base_correction_x * c + shot_origin_base_correction_y *s;
	var shot_origin_correction_y = shot_origin_base_correction_x * (-1*s) + shot_origin_base_correction_y * c
	draw_arrow(x,y,x+shot_origin_correction_x, y+shot_origin_correction_y, 2)


	shot_origin_base_correction_x = -17
	shot_origin_base_correction_y = 20

	shot_origin_correction_x = shot_origin_base_correction_x * c + shot_origin_base_correction_y *s;
	shot_origin_correction_y = shot_origin_base_correction_x * (-1*s) + shot_origin_base_correction_y * c
	draw_arrow(x,y,x+shot_origin_correction_x, y+shot_origin_correction_y, 1)

	draw_set_color(old_color)
}
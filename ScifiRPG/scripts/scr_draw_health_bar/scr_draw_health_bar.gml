// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_health_bar(x_pos,y_pos, health_fraction, scale){
	draw_sprite_ext(
		spr_ui_pc_health_icon,
		floor(health_fraction*4),
		x_pos,
		y_pos,
		image_xscale*scale,
		image_yscale*scale,
		image_angle,
		image_blend,
		image_alpha
	)
}
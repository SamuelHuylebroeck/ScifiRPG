/// @description Insert description here
// You can write your code in this editor
if(global.debug_draw_grid)
{
	draw_set_alpha(0.3);
	mp_grid_draw(global.pathing_grid);
	draw_set_alpha(1);
}
/// @description Insert description here
// You can write your code in this editor

//Draw the frame
draw_sprite_ext(
	frame_sprite,
	floor(current_frame_index),
	frame_x_offset,
	frame_y_offset,
	image_xscale*frame_scale,
	image_yscale*frame_scale,
	image_angle,
	image_blend,
	image_alpha
)

//Draw health
nr_of_full_bars = floor(player_character.current_hp / health_block_capacity)

var x_pos = health_bar_initial_offset_x;
var y_pos = health_bar_initial_offset_y;
for (i = 0; i<nr_of_full_bars; i++)
{
	scr_draw_health_bar(x_pos, y_pos, 0.9, frame_scale )
	x_pos += sprite_get_width(health_bar_sprite)*frame_scale-4*frame_scale
}
//Draw the last health bar
if(player_character.current_hp > 0 )
{
	var bar_fraction = (player_character.current_hp % health_block_capacity)/health_block_capacity
	scr_draw_health_bar(x_pos, y_pos, bar_fraction, frame_scale )
}



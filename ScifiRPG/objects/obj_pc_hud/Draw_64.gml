/// @description Insert description here
// You can write your code in this editor
var x_pos = 46*frame_scale;
var y_pos = 44*frame_scale;
//Draw the shot energy
for(var i = 0; i< floor(player_character.current_energy); i++)
{
	draw_sprite_ext(
		spr_ui_pc_shot_energy,
		floor(current_frame_index)%4,
		x_pos,
		y_pos,
		image_xscale*frame_scale,
		image_yscale*frame_scale,
		image_angle,
		image_blend,
		image_alpha
	)
	x_pos += 14*frame_scale
}

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
var x_pos = health_bar_initial_offset_x;
var y_pos = health_bar_initial_offset_y;
var total_nr_bars = ceil(player_character.max_hp / health_block_capacity)
for (var i = 0; i<total_nr_bars; i++)
{
	scr_draw_empty_health_bar(x_pos, y_pos, frame_scale )
	x_pos += sprite_get_width(health_bar_sprite)*frame_scale-4*frame_scale
}

//Draw current_hp
var nr_of_full_bars = floor(player_character.current_hp / health_block_capacity)

var x_pos = health_bar_initial_offset_x;
var y_pos = health_bar_initial_offset_y;
for (var i = 0; i<nr_of_full_bars; i++)
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

//Draw reactor point allocation
x_pos = 90*frame_scale
y_pos = 38*frame_scale
draw_text(x_pos, y_pos, string(player_character.allocated_reactor_points) +"/" + string(player_character.available_reactor_points));

//Draw leveling progress
x_pos = 68*frame_scale
y_pos = 21*frame_scale
var xp_bar_width = 200;
var xp_bar_height = 5*frame_scale;
var old_color = draw_get_color()
draw_set_color(GUI_ORANGE_DARK)
draw_rectangle(x_pos, y_pos,x_pos+xp_bar_width, y_pos+xp_bar_height, false)
var xp_relative_progress = player_character.current_xp / player_character.xp_to_next_level
draw_set_color(GUI_ORANGE_BRIGHT)
draw_rectangle(x_pos, y_pos,x_pos+xp_relative_progress*xp_bar_width, y_pos+xp_bar_height, false)

draw_set_color(old_color)

//Draw instructions
if(global.debug_show_controls){
	scr_draw_instructions(850,25)
}

/// @description Insert description here
// You can write your code in this editor
//Configuration variables
frame_image_number = 12;
frame_image_speed = 7;
frame_sprite = spr_ui_pc_health_frame;
frame_scale = 3;
frame_x_offset = 0;
frame_y_offset = 0;

health_bar_sprite = spr_ui_pc_health_icon;
health_bar_initial_offset_x = 42*frame_scale;
health_bar_initial_offset_y = 32*frame_scale;

health_block_capacity = 12;
//Instrinsic variables
current_frame_index = 0;


//Register player object
with(obj_pc){
	other.player_character = self;
}
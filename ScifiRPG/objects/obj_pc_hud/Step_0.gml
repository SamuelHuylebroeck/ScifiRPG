/// @description Insert description here
// You can write your code in this editor
current_frame_index += frame_image_speed/game_get_speed(gamespeed_fps);
if (current_frame_index > frame_image_number + 1 ) 
{
	current_frame_index = 0;
}
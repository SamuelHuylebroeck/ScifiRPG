/// @description Insert description here
// You can write your code in this editor
image_angle=direction

if (has_impacted and projectile_nr_impacts <= 0 and ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number ))
{
	instance_destroy()
}

audio_emitter_position(projectile_emit,x,y,0)
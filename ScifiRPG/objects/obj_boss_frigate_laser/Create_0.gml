/// @description Insert description here
// You can write your code in this editor
laser_length = 4*sprite_get_width(sprite_index);
depth = -10;
alarm[0]  = 5;

hit_list = ds_list_create();
current_laser_hit_interval = 0;

laser_emit = audio_emitter_create()
audio_emitter_falloff(laser_emit,laser_audio_fallout_start,laser_audio_fallout_distance,1)

if(laser_sfx != -1)
{
	audio_sound_gain(laser_sfx,0.5*global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
	laser_sound = audio_play_sound_on(laser_emit,laser_sfx,true,global.sfx_priority)
}
/// @description Insert description here
// You can write your code in this editor
ds_list_destroy(hit_list)
audio_emitter_free(laser_emit)
if(laser_sfx != -1){
	audio_stop_sound(laser_sound)
}
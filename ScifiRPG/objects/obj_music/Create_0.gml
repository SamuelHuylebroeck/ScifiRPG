/// @description Insert description here
// You can write your code in this editor
track_list = ds_list_create();
ds_list_add(track_list, music_shadowlands_machine);
ds_list_add(track_list, music_screen_saver);
ds_list_add(track_list, music_eternal_terminal);

show_debug_message(string(music_shadowlands_machine));

current_track = irandom(ds_list_size(track_list));
next_track = (current_track+1)%ds_list_size(track_list)
music_priority = 1000;

music_duration_gs = music_duration * game_get_speed(gamespeed_fps);
crossfade_duration_gs = crossfade_duration * game_get_speed(gamespeed_fps);

current_music_duration = music_duration_gs
show_debug_message(track_list[|0])
//setup initial playing
for(var i = 0; i< ds_list_size(track_list); i++)
{
	var track = track_list[|i]
	var gain = (i==current_track)?1000*global.sound_music_scale*global.sound_master_scale:0;
	audio_play_sound(track, music_priority, true);
	show_debug_message("Track ID: "+string(track) +", gain: "+string(gain))
	audio_sound_gain(track,gain,20)	
}
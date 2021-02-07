/// @description Insert description here
// You can write your code in this editor
if(current_music_duration < crossfade_duration_gs)
{
	fade_track = track_list[| current_track];
	if(fade_track != noone) audio_sound_gain(fade_track, 0 ,crossfade_duration * 1000)
	gain_track = track_list[| next_track];
	if(gain_track != noone) audio_sound_gain(gain_track, 1000*global.sound_music_scale*global.sound_master_scale ,crossfade_duration * 1000)
}

if(current_music_duration <=0)
{
	current_track = (current_track+1)%ds_list_size(track_list)
	next_track = (current_track+1)%ds_list_size(track_list)
	show_debug_message("Switching tracks")
	current_music_duration = music_duration_gs;
	for(var i = 0; i< ds_list_size(track_list); i++)
	{
		var track = track_list[|i]
		show_debug_message("Track ID: "+string(track) +", gain: "+string(audio_sound_get_gain(track)))
	}
	
}
current_music_duration--;
/// @description Insert description here
// You can write your code in this editor

//Intrinsic variables
alarm[0] = projectile_lifetime * game_get_speed(gamespeed_fps)
speed = projectile_speed
has_impacted = false


projectile_emit = audio_emitter_create()
audio_emitter_position(projectile_emit, x,y,0);
audio_emitter_falloff(projectile_emit, projectile_audio_falloff_start, projectile_audio_max_distance_to_be_heard,1)

depth = -25;
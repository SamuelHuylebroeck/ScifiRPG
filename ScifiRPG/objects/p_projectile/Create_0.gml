/// @description Insert description here
// You can write your code in this editor

//Intrinsic variables
alarm[0] = projectile_lifetime * game_get_speed(gamespeed_fps)
speed = projectile_speed
has_impacted = false

projectile_emit = audio_emitter_create()
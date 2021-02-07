// Inherit the parent event
event_inherited();
// Instrinsic variables
turn_rate_inert_gs = missile_inert_turn_rate / game_get_speed(gamespeed_fps)
turn_rate_firing_gs = missile_firing_turn_rate / game_get_speed(gamespeed_fps)

//State information
state = MISSILE_STATES.INERT
target = noone
current_missile_inert_time = missile_inert_time * game_get_speed(gamespeed_fps)

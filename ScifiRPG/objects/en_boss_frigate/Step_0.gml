/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
position_turrets();
current_missile_cooldown = max(0,--current_missile_cooldown)
current_state_change_interval = max(0, --current_state_change_interval);

//Check for defeat trigger
if enemy_current_hp <= 0 and not defeated
{
	scr_game_end_victory_trigger(self)
	defeated = true
}

if defeated and 
( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number )
	{
		image_speed = 0;
	}
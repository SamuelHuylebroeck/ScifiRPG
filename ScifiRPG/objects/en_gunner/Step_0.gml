/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(!global.game_paused){
	current_shot_cooldown = max(0, --current_shot_cooldown)
}
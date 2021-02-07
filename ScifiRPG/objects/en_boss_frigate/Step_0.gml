/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
position_turrets();
current_missile_cooldown = max(0,--current_missile_cooldown)
current_state_change_interval = max(0, --current_state_change_interval);


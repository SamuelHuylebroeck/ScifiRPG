/// @description Insert description here
// Get Player movement
key_left_held = keyboard_check(vk_left) or keyboard_check(ord(global.left_key));
key_right_held = keyboard_check(vk_right) or keyboard_check(ord(global.right_key));
key_up_held = keyboard_check(vk_up) or keyboard_check(ord(global.up_key));
key_down_held =  keyboard_check(vk_down) or keyboard_check(ord(global.down_key));

key_activate = keyboard_check_pressed(ord(global.activate_key))
key_attack_main = keyboard_check_pressed(global.attack_key)
key_attack_secondary = keyboard_check_pressed(global.shoot_key)


input_direction = point_direction(0,0,key_right_held-key_left_held, key_down_held-key_up_held);
input_magnitude = (key_right_held-key_left_held != 0) or (key_down_held-key_up_held != 0)

//Set audio listener
if (input_magnitude != 0)
{
	audio_listener_position(x,y,0)
}

if(!global.game_paused)
{
	flash = max(0, flash -0.04)
}

if(!global.game_paused)
{
	if(state_map[state] != -1) script_execute(state_map[state])
}

remaining_grace_frames = max(0, --remaining_grace_frames)

//Regenate health
current_hp = min(current_hp + regenate_hp_sec / game_get_speed(gamespeed_fps), max_hp);
//Regenerate energy
current_energy = min(current_energy + energy_regen_gs, max_energy);

//Check for levelup
if(current_xp >= xp_to_next_level && current_level < max_level)
{
	
	scr_levelup()
}

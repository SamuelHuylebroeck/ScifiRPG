/// @description Insert description here
// Get Player movement
key_left_held = keyboard_check(vk_left) or keyboard_check(ord(global.left_key));
key_right_held = keyboard_check(vk_right) or keyboard_check(ord(global.right_key));
key_up_held = keyboard_check(vk_up) or keyboard_check(ord(global.up_key));
key_down_held =  keyboard_check(vk_down) or keyboard_check(ord(global.down_key));

key_activate = keyboard_check_pressed(ord("F"))
key_attack_main = keyboard_check_pressed(vk_enter)
key_attack_secondary = keyboard_check_pressed(vk_shift)


input_direction = point_direction(0,0,key_right_held-key_left_held, key_down_held-key_up_held);
input_magnitude = (key_right_held-key_left_held != 0) or (key_down_held-key_up_held != 0)

//Set audio listener
audio_listener_position(x,y,0)

if(!global.game_paused)
{
	depth = -bbox_bottom
	flash = max(0, flash -0.04)
}

if(!global.game_paused)
{
	if(state_map[state] != -1) script_execute(state_map[state])
}

remaining_grace_frames = max(0, --remaining_grace_frames)

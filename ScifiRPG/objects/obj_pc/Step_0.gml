/// @description Insert description here
// Get Player movement
var key_left_held = keyboard_check(vk_left) or keyboard_check(ord(global.left_key));
var key_right_held = keyboard_check(vk_right) or keyboard_check(ord(global.right_key));
var key_up_held = keyboard_check(vk_up) or keyboard_check(ord(global.up_key));
var key_down_held =  keyboard_check(vk_down) or keyboard_check(ord(global.down_key));

input_direction = point_direction(0,0,key_right_held-key_left_held, key_down_held-key_up_held);
input_magnitude = (key_right_held-key_left_held != 0) or (key_down_held-key_up_held != 0)

//Movement
h_speed = lengthdir_x(input_magnitude * max_speed_walk, input_direction)
v_speed = lengthdir_y(input_magnitude * max_speed_walk, input_direction)

x += h_speed
y += v_speed

//Sprite animation
var old_sprite = sprite_index
if(input_magnitude != 0){
	scr_player_animate_sprite(input_direction)
}else{
	sprite_index = anim_idle
}
/// @description Insert description here
// You can write your code in this editor
if(highlighted){
	shader_set(sha_white_highlight)
	shader_set_uniform_f(us_highlight, 0.2)
}

draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)

if(shader_current() != -1) shader_reset();
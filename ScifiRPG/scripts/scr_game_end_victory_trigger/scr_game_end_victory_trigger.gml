// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_game_end_victory_trigger(boss){
	audio_sound_gain(so_sfx_victory,global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
	audio_play_sound(so_sfx_victory,global.sfx_priority,false)
	with(boss){
		sprite_index = spr_boss_frigate_die
		image_index = 0
		camera_set_view_target(view_camera[0], self)
		camera_set_view_pos(view_camera[0],x,y)
		image_speed=1
		
		if turret_left != noone
		{
			instance_destroy(turret_left)
		}
		
		if turret_right != noone
		{
			instance_destroy(turret_right)
		}
	}
	with(obj_game){
		alarm[1] = 3*game_get_speed(gamespeed_fps)
	}
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ep_activate_level_1(){
	with(player_character)
	{
		energy_regen *=2
		energy_regen_gs = energy_regen / game_get_speed(gamespeed_fps)
	}
}

function scr_ep_deactivate_level_1(){
	with(player_character)
	{
		energy_regen /=2
		energy_regen_gs = energy_regen / game_get_speed(gamespeed_fps)
	}
}

function scr_ep_activate_level_2(){
	with(player_character)
	{
		ranged_damage_bonus +=10

	}
}

function scr_ep_deactivate_level_2(){
	with(player_character)
	{
		ranged_damage_bonus -=10
	}
}

function scr_ep_deactivate_all(){
	scr_ep_deactivate_level_1()
	scr_ep_deactivate_level_2()

}
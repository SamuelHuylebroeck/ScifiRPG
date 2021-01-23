// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fr_activate_level_1(){
	with(player_character)
	{
		var rel_health = current_hp/max_hp;
		max_hp += 20;
		current_hp = rel_health * max_hp
	}
}

function scr_fr_deactivate_level_1(){
	with(player_character)
	{
		var rel_health = current_hp/max_hp;
		max_hp -= 20;
		current_hp = rel_health * max_hp
	}
}

function scr_fr_activate_level_2(){
	with(player_character){
		walk_speed_pps += 32
		max_speed_walk=walk_speed_pps/game_get_speed(gamespeed_fps)
	}
}

function scr_fr_deactivate_level_2(){
	with(player_character){
		walk_speed_pps -= 32
		max_speed_walk=walk_speed_pps/game_get_speed(gamespeed_fps)
	}
}

function scr_fr_activate_level_3(){
	with(player_character)
	{
		regenate_hp_sec += 1;
	}

}

function scr_fr_deactivate_level_3(){
	with(player_character)
	{
		regenate_hp_sec -= 1;
	}

}

function scr_fr_deactivate_all(){
	scr_fr_deactivate_level_1();
	scr_fr_deactivate_level_2();
	scr_fr_deactivate_level_3();	
}
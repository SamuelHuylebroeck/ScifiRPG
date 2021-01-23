// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_nfa_activate_level_1(){
	with(player_character)
	{
		melee_damage_bonus += 5;
	}

}

function scr_nfa_deactivate_level_1(){
	with(player_character)
	{
		melee_damage_bonus -= 5;
	}

}


function scr_nfa_deactivate_all(){
	scr_nfa_deactivate_level_1();
}
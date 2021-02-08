// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_qwerty_azerty_switch(){
	global.azerty = !global.azerty
	apply_keybinds()
}

function apply_keybinds(){
	if(global.azerty){
		global.left_key = "Q";
		global.right_key="D";
		global.up_key = "Z";
		global.down_key = "S";
	}
	
	if(!global.azerty){
		global.left_key = "A";
		global.right_key="D";
		global.up_key = "W";
		global.down_key = "S";
	}
	global.pause_key = "P";
	global.attack_key = "K";
	global.shoot_key = "L";
	global.skill_allocation_key = "H"
	global.activate_key = "F";
	global.keyboard_switch_key = "O";
}
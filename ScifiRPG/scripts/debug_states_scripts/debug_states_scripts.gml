// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function show_internal_state(){
	var old_halign = draw_get_halign()
	var old_valign = draw_get_valign()
	var old_font = draw_get_font()
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_set_font(fo_text_debug_small)
	var state_text = "State: " + get_state_string(state)
	draw_text(x,y, state_text)
	switch(state){
		case ENEMY_STATE.PATROL:
			var path_completion = "Path: " + string(path_position)
			draw_text(x,y+10, path_completion)
			break;
		case ENEMY_STATE.HURT:
			var prev_s = "Previous state: " + get_state_string(state_previous)
			draw_text(x,y+10, prev_s)
			var path_completion = "Path: " + string(path_position)
			draw_text(x,y+20, path_completion)
			break;
		case ENEMY_STATE.GOTO:
			var prev_s = "Previous state: " + get_state_string(state_previous)
			draw_text(x,y+10, prev_s)
			var next_s = "Next state: " + get_state_string(state_target)
			draw_text(x,y+20, next_s)
			var path_completion = "Path: " + string(path_position)
			draw_text(x,y+30, path_completion)
			break;
		case ENEMY_STATE.WANDER:
		default:
			break;
	}
	
	draw_set_halign(old_halign)
	draw_set_valign(old_valign)
	draw_set_font(old_font)


}

function get_state_string(state){
	switch(state){
		case ENEMY_STATE.IDLE:
			return "idle"
		case ENEMY_STATE.PATROL:
			return "patrol"
		case ENEMY_STATE.WANDER:
			return "wander"
		case ENEMY_STATE.GOTO:
			return "goto"
		case ENEMY_STATE.CHASE:
			return "chase"
		case ENEMY_STATE.ATTACK:
			return "attack"
		case ENEMY_STATE.HURT:
			return "hurt"
		case -1:
			return string(-1)
		default:
			return "NT"
	
	}

}
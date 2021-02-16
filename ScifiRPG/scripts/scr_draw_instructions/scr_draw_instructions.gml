// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_instructions(pos_x, pos_y){
	var cur_pos_x = pos_x
	var cur_pos_y = pos_y
	var old_font = draw_get_font();
	var old_color = draw_get_color();
	//Movement
	draw_text(cur_pos_x, cur_pos_y, "Movement[Up-Down-Left-Right]:  " + string(global.up_key) + "-" + string(global.down_key) + "-"+string(global.left_key)+"-"+string(global.right_key))
	//Actions
	cur_pos_y +=16
	draw_text(cur_pos_x, cur_pos_y, "Attack: " + string(global.attack_key))
	cur_pos_y +=16
	draw_text(cur_pos_x, cur_pos_y, "Shoot: " + string(global.shoot_key))
	cur_pos_y +=16
	draw_text(cur_pos_x, cur_pos_y, "Activate: "+string(global.activate_key))
	cur_pos_y +=16
	draw_text(cur_pos_x, cur_pos_y, "Open skill allocation: "+string(global.skill_allocation_key))
	cur_pos_y +=16
	draw_text(cur_pos_x, cur_pos_y, "Pause game: "+string(global.pause_key))
	cur_pos_y +=16
	draw_text(cur_pos_x, cur_pos_y, "Switch between Azerty and Querty movement: "+string(global.keyboard_switch_key))
	cur_pos_y +=16
	//hide instructions
	draw_text(cur_pos_x, cur_pos_y, "Hide instructions: F10" )
	cur_pos_y +=16
	
	if(global.debug_draw_debug_commands){
		//Debug
		cur_pos_y +=16
		draw_text(cur_pos_x, cur_pos_y, "Debug commands")
		cur_pos_y +=16
		//draw aggro
		draw_text(cur_pos_x, cur_pos_y, "Player god mode: NUM5" )
		cur_pos_y +=16
		//draw aggro
		draw_text(cur_pos_x, cur_pos_y, "Enemy AI vis: Y" )
		cur_pos_y +=16
		//draw map
		draw_text(cur_pos_x, cur_pos_y, "Pathing Map (will slow game to a crawl): G" )
		cur_pos_y +=16
		//reset game
		draw_text(cur_pos_x, cur_pos_y, "Reset Game: R" )
		cur_pos_y +=16
	}
	draw_set_font(old_font)
	draw_set_color(old_color)
	
}
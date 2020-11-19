// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_animate_sprite(direction){
	// Map the angle of rotation to a cardinal direction
	var cardinal_direction = round(direction/90)
	//movement
	switch(cardinal_direction){
		case 0:
		//left
			sprite_index = anim_move_lr;
			break;
		case 1:
		//up
			sprite_index = anim_move_bt
			break;
		case 2:
		//right
			sprite_index = anim_move_rl
			break;
		case 3:
		//down
			sprite_index = anim_move_tb
			break;
	}
}
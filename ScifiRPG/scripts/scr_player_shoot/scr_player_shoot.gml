// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_shoot(){
	//Start attack
	if(attack_done)
	{
		attack_done = false
		shots_to_fire = 1
		shots_fired = 0
		var cardinal_direction = round(direction/90)
		origin_correction_x = 0;
		origin_correction_y = 0;
		//Assign correct sprite
		switch(cardinal_direction)
		{
			case 0:
				//right
				sprite_index = spr_pc_attack_shoot_lr
				origin_correction_x += 16;
				break
			case 1:
				//top
				sprite_index = spr_pc_attack_shoot_bt
				origin_correction_y -= 16;
				break
			case 2:
				//left
				sprite_index = spr_pc_attack_shoot_rl
				origin_correction_x -= 16;
				break
			case 3:
				//bottom
				sprite_index = spr_pc_attack_shoot_tb
				origin_correction_y += 16;
				break
			default:
				sprite_index = spr_pc_attack_shoot_lr
				origin_correction_x += 16;
				break
		}
		image_index = 0
	}
	
	//Create Shot
	if(floor(image_index) == 3 and  shots_fired < shots_to_fire){
		shot_fired = instance_create_layer(x+origin_correction_x,y+origin_correction_y,"Instances",obj_pc_energy_bolt);
		with(shot_fired)
		{
			direction = other.direction
			image_angle = other.direction
		}
		shots_fired++
	}
	//End attack
	if ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number )
	{
		state=PLAYER_STATE.FREE
		shots_fired = 0
		attack_done = true
		sprite_index = spr_pc_idle
	}	
}
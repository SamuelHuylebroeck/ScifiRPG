// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_shoot(){
	//Start attack
	if(attack_done)
	{
		attack_done = false
		//check if we can shoot
		if(current_energy - 1 <= 0){
			state=PLAYER_STATE.FREE
			shots_fired = 0
			attack_done = true
			sprite_index = spr_pc_idle
			image_index = 0;
		}else{
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
	}
	
	//Create Shot
	if(floor(image_index) == 3 and  shots_fired < shots_to_fire){
		var shot_fired = instance_create_layer(x+origin_correction_x,y+origin_correction_y,"Instances",obj_pc_energy_bolt);
		audio_sound_gain(so_pc_energy_bolt, global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
		audio_play_sound(so_pc_energy_bolt,global.sfx_priority,false)
		current_energy = max(current_energy - 1, 0)
		with(shot_fired)
		{
			var cardinal_direction = round(other.direction/90)
			direction = cardinal_direction*90
			image_angle = cardinal_direction*90
			projectile_damage += other.ranged_damage_bonus;
		}
		shots_fired++
	}
	//End attack
	if ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number )
	{
		end_shoot()
	}	
}

function end_shoot()
{
		state=PLAYER_STATE.FREE
		shots_fired = 0
		attack_done = true
		sprite_index = spr_pc_idle
}
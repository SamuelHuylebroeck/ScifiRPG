// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_state_free(){
	
	//Movement
	h_speed = lengthdir_x(input_magnitude * max_speed_walk, input_direction);
	v_speed = lengthdir_y(input_magnitude * max_speed_walk, input_direction);
	
	scr_player_collision();
	//Sprite animation
	if(input_magnitude != 0){
		scr_player_animate_sprite(input_direction);
		direction = input_direction
	}else{
		sprite_index = anim_idle;
	}
	
	//Activate key logic
	if(key_activate)
	{
		
		//1. Check for an entity
		var activate_x = lengthdir_x(ACTIVATE_RANGE, direction)
		var activate_y = lengthdir_y(ACTIVATE_RANGE, direction)
		activate = instance_position(x + activate_x, y + activate_y, p_entity)
		if(activate == noone || activate.entity_activate_script == -1)
		{
			//2. If there is nothing, or there is somethign without a script, smile
			state = PLAYER_STATE.INTERACT
			sprite_index = anim_smile;
			image_index = 0;
		}else{
			//3. Otherwise, if there is something and it has a script, activate
			with(activate)
			{
				scr_script_execute_array(self.entity_activate_script, self.entity_activate_args)
			}
		}
	}
	
	//Main attack logic
	if(key_attack_main and current_combo_cooldown<=0)
	{
		state = PLAYER_STATE.ATTACK_1
		next_attack_script = scr_player_attack_slash_1
	}
	current_combo_cooldown = max(current_combo_cooldown - 1/room_speed, 0)
}
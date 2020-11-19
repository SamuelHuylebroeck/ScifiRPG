// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_combo_attack(default_next, next_chain, frame_start, frame_end, refresh_frames){
	// Startup animation
	if(attack_done)
	{
		attack_done = false
		next_state = default_next
		image_index = frame_start
		var cardinal_direction = round(direction/90)
		//Assign correct sprite
		switch(cardinal_direction){
			case 0:
				//right
				sprite_index = spr_pc_slash_right
				hit_box_mask = spr_pc_slash_right_hb
				break
			case 1:
				//top
				sprite_index = spr_pc_slash_top
				hit_box_mask = spr_pc_slash_top_hb
				break
			case 2:
				//left
				sprite_index = spr_pc_slash_left
				hit_box_mask = spr_pc_slash_left_hb
				break
			case 3:
				//bottom
				sprite_index = spr_pc_slash_bottom
				hit_box_mask = spr_pc_slash_bottom_hb
				break
			default:
				sprite_index = spr_pc_slash_top
				hit_box_mask = spr_pc_slash_top_hb
				break
		}
	
		//Clear hit list
		if (!ds_exists(entities_hit_by_attack, ds_type_list))
		{
			entities_hit_by_attack = ds_list_create();
			
		}
		ds_list_clear(entities_hit_by_attack);
		if(refresh_frames != noone and is_array(refresh_frames))
		{
			for(var i = 0; i < array_length(refresh_frames);i++)
			{
				refresh_frames_passed[refresh_frames[i]] = false;
			}
		
		}
		
	}
	//Check for next chain
	if(key_attack_main){
		next_state = next_chain
	}
	
	//Check if we need to reset the hit list
	if(refresh_frames != noone and is_array(refresh_frames))
	{
		for(var j =0; j < array_length(refresh_frames);j++)
		{
			if (image_index == refresh_frames[j] && !refresh_frames_passed[refresh_frames[j]])
			{
				ds_list_clear(entities_hit_by_attack)
				refresh_frames_passed[refresh_frames[j]] = true
			}
		}
	}
	
	//Calculate hits
	scr_calculate_attack_hits(hit_box_mask)
	
	// End animation
	if(image_index >= frame_end){
		state=next_state
		attack_done = true
		if(next_state == scr_player_state_free) sprite_index = spr_pc_idle
	}
	
}
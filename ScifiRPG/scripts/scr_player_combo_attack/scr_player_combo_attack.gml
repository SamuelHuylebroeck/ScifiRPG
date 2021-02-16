// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_combo_attack(default_next, next_chain, frame_start, frame_end, refresh_frames, damage, knockback, sfx_attack, sfx_hit){
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
	
		//Clear hit lists
		if (!ds_exists(entities_hit_by_attack, ds_type_list))
		{
			entities_hit_by_attack = ds_list_create();
			
		}
		ds_list_clear(entities_hit_by_attack);
		
		if (!ds_exists(projectiles_hit_by_attack, ds_type_list))
		{
			projectiles_hit_by_attack = ds_list_create();
		}
		ds_list_clear(projectiles_hit_by_attack);
		
		if(refresh_frames != noone and is_array(refresh_frames))
		{
			for(var i = 0; i < array_length(refresh_frames);i++)
			{
				refresh_frames_passed[refresh_frames[i]] = false;
			}
		
		}
		//Play attack sound
		if(sfx_attack != -1)
		{
			audio_sound_gain(sfx_attack,global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
			audio_play_sound(sfx_attack,global.sfx_priority,false)
		}
		
	}
	//Check for next chain
	if(key_attack_main and (next_chain != noone) and (next_chain != -1)){
		next_state = PLAYER_STATE.ATTACK_1;
		next_attack_script = next_chain;
	}
	
	//Check if we need to reset the hit list
	if(refresh_frames != noone and is_array(refresh_frames))
	{
		for(var j =0; j < array_length(refresh_frames);j++)
		{
			if (image_index == refresh_frames[j] && !refresh_frames_passed[refresh_frames[j]])
			{
				ds_list_clear(entities_hit_by_attack)
				ds_list_clear(projectiles_hit_by_attack)
				refresh_frames_passed[refresh_frames[j]] = true
			}
		}
	}
	
	//Calculate hits
	scr_calculate_attack_hits(hit_box_mask, damage+melee_damage_bonus, knockback, sfx_hit)
	
	// End animation
	if(image_index >= frame_end){
		state=next_state
		current_attack_script = next_attack_script
		attack_done = true
		if(next_state == PLAYER_STATE.FREE)
		{
			sprite_index = spr_pc_idle
			current_attack_script=scr_player_attack_slash_1
		} 
	}
	
}

function scr_player_attack_slash_1(){
	// Config, sprite specific data
	var frame_start = 0
	var frame_end = 5
	var default_state = PLAYER_STATE.FREE
	var next_chain = scr_player_attack_slash_2
	var damage = 5;
	var knockback = 5;
	scr_player_combo_attack(default_state, next_chain, frame_start, frame_end, noone, damage, knockback,so_pc_combo_slash_1, so_pc_combo_slash_hit)
}

function scr_player_attack_slash_2(){
	// Config, sprite specific data
	var frame_start = 5
	var frame_end = 8
	var default_state = PLAYER_STATE.FREE
	var next_chain = scr_player_attack_spin
	var damage = 10;
	var knockback = 10;
	scr_player_combo_attack(default_state, next_chain, frame_start, frame_end, noone, damage, knockback,so_pc_combo_slash_1, so_pc_combo_slash_hit)
}

function scr_player_attack_spin(){
	var frame_start = 8
	var frame_end = 14
	var default_state = PLAYER_STATE.FREE
	var next_chain = noone
	var damage = 8;
	var knockback = 32;
	scr_player_combo_attack(default_state, next_chain, frame_start, frame_end,[11], damage, knockback,so_pc_combo_slash_spin, so_pc_combo_slash_hit)
	current_combo_cooldown = combo_cooldown
}

function scr_calculate_attack_hits(hitbox_mask, damage, knockback, sfx_hit){
	//Use attack hitbox and check for hits
	var old_mask = mask_index
	mask_index = hitbox_mask
	var hit_by_attack_now = ds_list_create()
	var projectiles_hit_by_attack_now = ds_list_create()
	var hits = instance_place_list(x,y, p_entity, hit_by_attack_now, false)
	
	if(hits > 0)
	{
		for (var i = 0; i<hits;i++)
		{
			//If this instance has not yet been hit by this attack, hit it
			var hit_id = hit_by_attack_now[| i];
			if(ds_list_find_index(entities_hit_by_attack, hit_id) == -1)
			{
				ds_list_add(entities_hit_by_attack, hit_id)
				with(hit_id)
				{
					if(object_is_ancestor(object_index, p_enemy))
					{
		
						hurt_enemy(id, damage, other.id, knockback, sfx_hit);
					}
					else if(entity_hit_script != -1) script_execute(entity_hit_script);
				}
			}
		}
			
	}
	var projectile_hits = instance_place_list(x,y, p_projectile, projectiles_hit_by_attack_now, false)
	if(projectile_hits > 0 ){
		for (var i = 0; i<projectile_hits;i++)
		{
			var hit_id = projectiles_hit_by_attack_now[| i];
			if(ds_list_find_index(projectiles_hit_by_attack, hit_id) == -1)
			{
				ds_list_add(projectiles_hit_by_attack, hit_id)
				with(hit_id)
				{
					if(projectile_hit_script != -1){ 
						script_execute(projectile_hit_script);
					}
				}
			}
		}

	}
	ds_list_destroy(hit_by_attack_now)
	ds_list_destroy(projectiles_hit_by_attack_now)
	mask_index = old_mask
}

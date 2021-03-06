// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_calculate_attack_hits(hitbox_mask, damage, knockback){
	//Use attack hitbox and check for hits
	var old_mask = mask_index
	if (hitbox_mask != noone){ 
		mask_index = hitbox_mask
	}
	var hit_by_attack_now = ds_list_create()
	var hits = instance_place_list(x,y, obj_pc, hit_by_attack_now, false)
	
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
					hurt_player(id, damage, other.id, knockback, true);
				}
			}
		}
			
	}
	
	ds_list_destroy(hit_by_attack_now)
	mask_index = old_mask
}

function hurt_player(player, damage, source, knockback, do_stagger)
{
	with(player)
	{
		if( state != PLAYER_STATE.DIE )
		{
			if(remaining_grace_frames<=0)
			{
				current_hp -= damage;
				remaining_grace_frames = grace_frames
				flash += 0.5;
				if(source.enemy_sfx_attack_hit != -1)
				{
					audio_sound_gain(source.enemy_sfx_attack_hit,global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
					audio_play_sound_on(source.entity_emit,source.enemy_sfx_attack_hit,false,global.sfx_priority)
				}
				
				if( current_hp <= 0 ) {
					sprite_index = spr_pc_hurt;
					state = PLAYER_STATE.DIE;
					scr_game_end_defeat_trigger()
				}else{
					if(do_stagger) 
					{
						state = PLAYER_STATE.HURT
						image_index = 0;
						var knock_direction = point_direction(x,y,(source).x, (source).y)
						x_to = x - lengthdir_x(knockback, knock_direction);
						y_to = y - lengthdir_y(knockback, knock_direction);
					}
				}
				
			}else
			{
				show_debug_message("Damaged during grace period, damage not applied")
			}

		}
	}
}
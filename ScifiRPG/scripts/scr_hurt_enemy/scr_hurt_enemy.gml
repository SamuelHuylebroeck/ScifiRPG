// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hurt_enemy(enemy, damage, source, knockback, sfx_hit)
{
	with(enemy)
	{
		if( state != ENEMY_STATE.DIE )
		{
			enemy_current_hp -= damage;
			flash = 0.75;
			if(sfx_hit != -1 and state != ENEMY_STATE.DIE)
			{
				audio_sound_gain(sfx_hit,global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
				audio_play_sound_on(entity_emit,sfx_hit,false,global.sfx_priority)
			}
			if( enemy_current_hp <= 0 ) {
				if(enemy_sfx_death != -1 and state != ENEMY_STATE.DIE)
				{
					audio_sound_gain(enemy_sfx_death,global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
					audio_play_sound_on(entity_emit,enemy_sfx_death,false,global.sfx_priority)
					state_initialized = false;
					
					if(knockback != 0 and  enemy_can_be_staggered)
					{
						var knock_direction = point_direction(x,y,(source).x, (source).y)
						x_to = x - lengthdir_x(knockback, knock_direction);
						y_to = y - lengthdir_y(knockback, knock_direction);
					}
					
				}
				state = ENEMY_STATE.DIE
				
			}else{
				if(enemy_can_be_staggered)
				{
					if(state != ENEMY_STATE.HURT) state_previous = state
					state = ENEMY_STATE.HURT
					image_index = 0;
					if(knockback != 0 )
					{
						var knock_direction = point_direction(x,y,(source).x, (source).y)
						x_to = x - lengthdir_x(knockback, knock_direction);
						y_to = y - lengthdir_y(knockback, knock_direction);
					}
				}
			
			}

		}
	
	}
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spawner_spawn_enemy(){
	if(not spawn_in_progress)
	{
		//Start the process
		sprite_index = spawner_sprite[SPAWNER_STATE.SPAWNING];
		image_index = 0;
		spawn_in_progress = true;
	}
	
	if(floor(image_index) == spawner_anim_spawn_frame and not has_spawned )
	{
		
		if(spawner_unit_type != -1)
		{
			has_spawned = true;
			if(nr_active_spawns < spawner_limit )
			{
				nr_active_spawns++;
				spawner_xp_giving_units = max(0, --spawner_xp_giving_units)
				spawned_unit = instance_create_layer(x,y, "Instances", spawner_unit_type);
				with(spawned_unit)
				{
					controlling_spawner = other.id;
					collision_map = layer_tilemap_get_id(layer_get_id("Collision"))
					flash=0.5;
					image_alpha = 0.25;
					state_initialized = false;
					direction = other.direction;
					if(other.spawner_xp_giving_units ==0) enemy_xp_given = 0
					
					if(other.spawner_patrol_path != -1)
					{
						patrol_path = other.spawner_patrol_path;
						state = ENEMY_STATE.GOTO;
						state_target = ENEMY_STATE.PATROL;
						state_default = ENEMY_STATE.PATROL;
						x_to = path_get_point_x(patrol_path,0);
						y_to = path_get_point_y(patrol_path,0);
						
					}else
					{
						var length = 80;
						
						xstart = xstart + lengthdir_x(length, other.image_angle-90);
						ystart = ystart + lengthdir_y(length, other.image_angle-90);
						x_to = xstart;
						y_to = ystart;
						state = ENEMY_STATE.GOTO;
						state_default = ENEMY_STATE.WANDER;
					}
				}
			}
		}	
	}
	
	//End the spawn
	if ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number )
	{
		state = SPAWNER_STATE.IDLE;
		spawn_current_cooldown_gs = spawn_cooldown * game_get_speed(gamespeed_fps);
		sprite_index = spawner_sprite[SPAWNER_STATE.IDLE];
		image_index = 0;
		has_spawned = false;
		spawn_in_progress = false;
	}
	
}
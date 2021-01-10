// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spawner_spawn_enemy(){
	if(not spawn_in_progress)
	{
		show_debug_message("Start spawn unit");
		//Start the process
		sprite_index = spawner_sprite[SPAWNER_STATE.SPAWNING];
		image_index = 0;
		spawn_in_progress = true;
	}
	
	if(floor(image_index) == spawner_anim_spawn_frame and not has_spawned )
	{
		
		if(spawner_unit_type != -1)
		{
			show_debug_message("Trying to spawn a unit");
			has_spawned = true;
			
			if(nr_active_spawns < spawner_limit )
			{
				nr_active_spawns++;
				spawned_unit = instance_create_layer(x,y, "Instances", spawner_unit_type);
				with(spawned_unit)
				{
					controlling_spawner = other.id;
					collision_map = layer_tilemap_get_id(layer_get_id("Collision"))
				}
				show_debug_message("Unit spawned");
			}
		}	
	}
	
	//End the spawn
	if ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number )
	{
		
		show_debug_message("finish spawn unit");
		state = SPAWNER_STATE.IDLE;
		spawn_current_cooldown_gs = spawn_cooldown * game_get_speed(gamespeed_fps);
		sprite_index = spawner_sprite[SPAWNER_STATE.IDLE];
		image_index = 0;
		has_spawned = false;
		spawn_in_progress = false;
	}
	
}
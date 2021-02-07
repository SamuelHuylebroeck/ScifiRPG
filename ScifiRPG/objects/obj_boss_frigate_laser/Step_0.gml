image_angle = direction

//Hit detection
if(not instance_exists(obj_sensor))
{
	instance_create_depth(0,0,0,obj_sensor)
}

obj_sensor.x = x
obj_sensor.y = y
obj_sensor.image_angle = direction

obj_sensor.image_xscale = laser_length;
obj_sensor.image_yscale = sprite_height / sprite_get_height(spr_sensor);

with(obj_pc)
{
	if(place_meeting(x,y,obj_sensor)){
		
		if(ds_list_find_index(other.hit_list, id) == -1){
			flash= min(1, flash+ 0.5);
			if(other.laser_hit_sfx != -1)
			{
				hit_sound = audio_play_sound_on(other.laser_emit,other.laser_hit_sfx,false,global.sfx_priority)
				audio_sound_gain(hit_sound,0.5*global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
				audio_sound_gain(hit_sound,0, 1000)
			}
			hurt_player(self, other.laser_damage, other,other.laser_knockback, false);
			
			part_particles_create(global.particle_system, x,y,global.part_laser_end,5);
		}
	}
}
current_laser_hit_interval = min(current_laser_hit_interval + 1/game_get_speed(gamespeed_fps), laser_hit_interval);

if(current_laser_hit_interval >=laser_hit_interval )
{
	ds_list_clear(hit_list)
	current_laser_hit_interval = 0;
}

audio_emitter_position(laser_emit, x,y,0)
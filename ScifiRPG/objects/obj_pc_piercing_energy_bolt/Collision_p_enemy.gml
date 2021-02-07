/// @description Insert description here
// You can write your code in this editor
if(projectile_impact_enemy and projectile_nr_impacts>0)
{
	if(ds_list_find_index(hit_list, other) == -1)
	{
		ds_list_add(hit_list, other)
		has_impacted = true;
		--projectile_nr_impacts;
		if(projectile_impact_sfx != -1)
		{
			audio_sound_gain(projectile_impact_sfx,global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
			audio_play_sound_on(projectile_emit,projectile_impact_sfx,false,global.sfx_priority)
		}
		//Create some particle effects
		var dir = point_direction(x,y,other.x,other.y)
		var length = point_distance(x,y,other.x,other.y)/3
		part_particles_create(global.particle_system, x+lengthdir_x(length,dir), y+lengthdir_y(length,dir),global.part_hit,2)
		hurt_enemy(other.id,projectile_damage, id, projectile_knockback,-1)
	}
}
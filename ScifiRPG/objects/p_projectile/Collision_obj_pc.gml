/// @description Insert description here
// You can write your code in this editor
if(projectile_impact_player and not has_impacted)
{
	has_impacted = true;
	if(projectile_impact_sfx != -1)
	{
		audio_sound_gain(projectile_impact_sfx,global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
		audio_play_sound_on(projectile_emit,projectile_impact_sfx,false,global.sfx_priority)
	}
	sprite_index = projectile_impact_sprite;
	image_index = 0;
	speed  *= 0.01;
	hurt_player(other.id,projectile_damage, id, projectile_knockback)	
}
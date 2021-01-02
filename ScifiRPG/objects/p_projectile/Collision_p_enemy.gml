/// @description Insert description here
// You can write your code in this editor
if(projectile_impact_enemy and not has_impacted)
{
	show_debug_message("Enemy hit")
	has_impacted = true;
	sprite_index = projectile_impact_sprite;
	image_index = 0;
	speed = 0;
	hurt_enemy(other.id,projectile_damage, id, projectile_knockback)
	
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_explode_projectile(){
	has_impacted = true
	projectile_nr_impacts = 0;
	sprite_index = projectile_impact_sprite;
	image_index = 0;
	speed  *= 0.01;
}
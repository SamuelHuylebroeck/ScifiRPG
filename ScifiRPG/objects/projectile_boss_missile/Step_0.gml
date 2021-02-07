/// @description Insert description here
// You can write your code in this editor
if (has_impacted && ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number ))
{
	instance_destroy()
}
var target_direction = self.direction
if(target != noone){
	//set a target direction
   target_direction = point_direction(x,y,target.x, target.y);
}

if(state == MISSILE_STATES.INERT){
	//Only change image angle
	var turn_commit = sign(angle_difference(image_angle,target_direction))*turn_rate_inert_gs
	if(abs(angle_difference(image_angle,target_direction)) <= turn_rate_inert_gs) turn_commit = angle_difference(image_angle,target_direction)
	image_angle -= turn_commit
	
}
 
if(state == MISSILE_STATES.FIRING){
	//Change direction as well
	var turn_commit = sign(angle_difference(direction,target_direction))*turn_rate_firing_gs
	if(abs(angle_difference(direction,target_direction)) <= turn_rate_firing_gs) turn_commit = angle_difference(direction,target_direction)
	 //Commit turning
	 direction -= turn_commit
	 image_angle = direction
	 
	 //Create particles
	 part_particles_create(global.particle_system, x,y,global.part_basic,1);
}

//Check if we go from inert to firing
if(current_missile_inert_time <= 0 and state == MISSILE_STATES.INERT ){
	state = MISSILE_STATES.FIRING
	direction = image_angle;
	speed = projectile_speed;
	if(missile_sfx_ignite != -1)
	{
		var sfx = audio_play_sound_on(projectile_emit,missile_sfx_ignite,false,global.sfx_priority)
		audio_sound_gain(sfx,0.5*global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
		audio_sound_gain(sfx,0,1000)
	}
}


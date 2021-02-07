// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_boss_frigate_missiles_hunt(){
	if(not state_initialized)
	{
		boss_missiles_hunt_attack_init()
	}
	boss_chase_movement();
	image_angle = direction;
	
	//Create first set
	if(floor(image_index) == 8 and not missiles_first_set_fired){
		
		show_debug_message("Firing first set of missiles")
		
		var shot_origin_base_correction_x = -10
		var shot_origin_base_correction_y = 35
		
		fire_missile_set(shot_origin_base_correction_x,shot_origin_base_correction_x,1)
		missiles_first_set_fired = true;
	}
	
	//Create second set
	if(floor(image_index) == 10 and  not missiles_second_set_fired){
		var shot_origin_base_correction_x = -17
		var shot_origin_base_correction_y = 35

		fire_missile_set(shot_origin_base_correction_x,shot_origin_base_correction_x,2)
		missiles_second_set_fired = true;
	}
	
	//End the attack
	if ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number )
	{
		boss_missiles_attack_cleanup(BOSS_STATE.CHASE, true)
	}

}

function scr_boss_frigate_missiles_patrol(){
	if(not state_initialized){
		boss_missiles_patrol_attack_init();
	}
	scr_boss_frigate_patrol_image_rotation(current_patrol_path , enemy_turn_rate_rs);
	current_volley_cooldown = max(0, --current_volley_cooldown);
	if(floor(image_index) == 8 and nr_of_volleys>0){
		image_speed = 0
		if(current_volley_cooldown <=0){
			var shot_origin_base_correction_x = -10
			var shot_origin_base_correction_y = 35
			fire_missile_set(shot_origin_base_correction_x,shot_origin_base_correction_x,1)
			
			var shot_origin_base_correction_x = -17
			var shot_origin_base_correction_y = 35

			fire_missile_set(shot_origin_base_correction_x,shot_origin_base_correction_x,1)
			nr_of_volleys --;
			current_volley_cooldown = volley_cooldown;
		}
	}else{
		image_speed = 1;
	}
	
	//End the attack
	if ( image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number )
	{
		boss_missiles_attack_cleanup(state_previous, false)
	}

}
function fire_missile_set(shot_origin_base_correction_x, shot_origin_base_correction_y, nr_of_missiles_per_volley){
	for(var i=-1; i<3; i+=2){
		//Calculate the correct coordinates to create the shot at by rotating the base vector along the current direction
		var c = dcos(image_angle)
		var s = dsin(image_angle)
		var shot_origin_correction_x = shot_origin_base_correction_x * c + i*shot_origin_base_correction_y *s;
		var shot_origin_correction_y = shot_origin_base_correction_x * (-1*s) + i*shot_origin_base_correction_y * c
		for(var j = 0; j <nr_of_missiles_per_volley;j++){
			missile_fired = instance_create_layer(x+shot_origin_correction_x,y+shot_origin_correction_y,"Instances",projectile_boss_missile);
			with(missile_fired){
				speed=0.85+j*0.15
				direction = other.image_angle+i*90
				image_angle = other.image_angle+i*90
				target = other.target;
				if(other.boss_missile_launch_sfx != -1){
					var sfx = audio_play_sound_on(projectile_emit,other.boss_missile_launch_sfx,false,global.sfx_priority)
					audio_sound_gain(sfx,0.5*global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
				}
				
			}
		}
	}
}

function boss_missiles_hunt_attack_init(){
	sprite_index = boss_sprites[BOSS_STATE.MISSILES_HUNT]
	image_index = 0;
	missiles_first_set_fired = false;
	missiles_second_set_fired = false;
	state_initialized = true
}
	
function boss_missiles_patrol_attack_init(){
	sprite_index = boss_sprites[BOSS_STATE.MISSILES_PATROL]
	image_index = 0;
	nr_of_volleys = 5;
	volley_cooldown = 1*game_get_speed(gamespeed_fps);
	current_volley_cooldown = volley_cooldown;
	state_initialized = true
}

function boss_missiles_attack_cleanup(next_state, initialize_next_state){
	current_missile_cooldown = boss_missile_cooldown * game_get_speed(gamespeed_fps)
	state = next_state
	state_initialized = !initialize_next_state;

}


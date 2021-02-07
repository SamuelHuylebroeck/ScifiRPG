// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function should_retreat(){
	return enemy_current_hp < next_retreat_point
}

function power_up_for_retreat(){
	enemy_speed *=1.2
	enemy_turn_rate_rs *= 1.2
	boss_missile_cooldown -=2;
	//Rebuild turrets
	if(turret_left == noone)
	{
		show_debug_message("Rebuilding turret left")
	}
	
	if(turret_right == noone){
		show_debug_message("Rebuilding turret right")
	
	}
	scr_boss_frigate_init_setup_turrets()
}

function set_up_retreat(){
	//Setup next state
	state_target = BOSS_STATE.LASER_SWEEP
	x_to = boss_retreat_coords[0];
	y_to = boss_retreat_coords[1];
	
	//Setup next retreat
	nr_of_retreats++;
	next_retreat_point = (1- (nr_of_retreats +1) *boss_retreat_fraction) * enemy_max_hp 
	
	//Execute powerup
	power_up_for_retreat()
}
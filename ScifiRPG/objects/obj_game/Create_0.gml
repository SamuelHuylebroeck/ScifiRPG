/// @description Insert description here
if(RANDOMIZE) randomize();

//initialize grid
global.pathing_grid = noone;
global.free_pathing_grid = noone;

//initialize particle system
global.particle_system = part_system_create();
part_system_depth(global.particle_system, -24);

depth = -100000

camera_start_pos_x =0
camera_start_pos_y = 0
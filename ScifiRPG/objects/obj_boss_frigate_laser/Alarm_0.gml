var c = dcos(image_angle)
var s = dsin(image_angle)

var laser_origin_correction_x = (laser_length) * c 
var laser_origin_correction_y = (laser_length) * (-1*s)
part_particles_create(global.particle_system, x+laser_origin_correction_x,y+laser_origin_correction_y,global.part_laser_end,2)
alarm[0] = laser_particle_interval
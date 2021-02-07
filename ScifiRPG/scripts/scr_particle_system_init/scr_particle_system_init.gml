#region Particle Types
//Basic energy article
var part_b=part_type_create()
part_type_shape(part_b, pt_shape_pixel);
part_type_life(part_b, 10,20);
part_type_alpha2(part_b,1,0);
part_type_color2(part_b, PARTICLE_GREEN_LIGHT, PARTICLE_GREEN_DARK);
global.part_basic=part_b

//Hit effect
var part_h=part_type_create()
part_type_shape(part_h, pt_shape_flare);
part_type_life(part_h, 10,20);
part_type_alpha2(part_h,1,0);
part_type_color2(part_h, PARTICLE_GREEN_LIGHT, PARTICLE_GREEN_DARK);
part_type_size(part_h,0.25,0.25,0,0.2);
part_type_speed(part_h,1,2,0,0);
part_type_direction(part_h,0,360,0,0);
global.part_hit=part_h

//laser end
var part_le = part_type_create()
part_type_shape(part_le, pt_shape_explosion)
part_type_life(part_le, 10,50)
part_type_alpha2(part_le,1,0)
part_type_color3(part_le,PARTICLE_GREEN_LIGHT, PARTICLE_GREEN_DARK, PARTICLE_GREEN_EXTRA_DARK);
part_type_size(part_le,0.25,0.25,0,0.2);
part_type_speed(part_le,0.1,0.2,0,0);
part_type_direction(part_le,0,360,0,0);
global.part_laser_end=part_le

#endregion
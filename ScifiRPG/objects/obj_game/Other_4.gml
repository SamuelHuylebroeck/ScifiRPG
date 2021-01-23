/// @description Layer management
// You can write your code in this editor
layer_set_visible("Collision", false)

global.pathing_grid = mp_grid_create(0,0, floor(room_height/global.pathing_grid_cell_height), floor(room_width*global.pathing_grid_cell_width), global.pathing_grid_cell_width, global.pathing_grid_cell_height);
scr_enemy_pathing_register_collision_tiles()
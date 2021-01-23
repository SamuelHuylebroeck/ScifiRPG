// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_pathing_register_collision_tiles(){
	var collision_map = layer_tilemap_get_id(layer_get_id("Collision"))
	show_debug_message("Adding collision tiles")
	var nr_h_cells = floor(room_width/global.pathing_grid_cell_width)
	var nr_v_cells = floor(room_height/global.pathing_grid_cell_height)
	for (var i = 0; i< nr_h_cells; i++)
	{
		for (var j = 0 ; j<nr_v_cells ; j++)
		{
			var h =  i<<log2(global.pathing_grid_cell_width)
			var v =  j<<log2(global.pathing_grid_cell_height)
			if(tilemap_get_at_pixel(collision_map,h,v))
			{
				mp_grid_add_cell(global.pathing_grid, i,j)
			}
		}
		show_debug_message("Finished row " + string(i));
	}
	show_debug_message("finished adding collision tiles")
}
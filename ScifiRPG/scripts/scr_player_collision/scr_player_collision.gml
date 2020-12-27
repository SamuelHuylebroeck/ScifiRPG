// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_collision(){
	var colliding = false;
	var entity_list = ds_list_create()
	
	//Horizontal Tiles
	if(tilemap_get_at_pixel(collision_map, x+ h_speed, y))
	{
		x -= x mod COLLISION_TILESIZE; //move to pixel one of the tile (left)
		if(sign(h_speed) == 1) x += COLLISION_TILESIZE -1 //move to  (shift to right)
		colliding = true
		h_speed = 0
	}
	
	//Horizontal Entities
	var entity_count = instance_position_list(x + h_speed,y, p_entity, entity_list, false)
	var snap_x;
	while(entity_count > 0){
		var entity_check = entity_list[| 0];
		if(entity_check.entity_collision == true)
		{
			//Move as close as we can
			if(sign(h_speed)==-1)
			{ 
				snap_x = entity_check.bbox_right+1;
			}else{
				snap_x = entity_check.bbox_left-1;
			}
			x = snap_x;
			colliding = true;
			entity_count = 0;
			h_speed = 0
		}
		ds_list_delete(entity_list,0);
		entity_count--;
	}
	//Horizontal Move Commit
	x+=h_speed
	
	//Clear list between axis
	ds_list_clear(entity_list)

	//Vertical Tiles
    if(tilemap_get_at_pixel(collision_map, x, y+v_speed))
	{
		y -= y mod COLLISION_TILESIZE; //move to pixel one of the tile (left)
		if(sign(v_speed) == 1) y+= COLLISION_TILESIZE -1 //move to  (shift to right)
		colliding = true
		v_speed = 0
	}
	
	//Vertical Entities
	var entity_count = instance_position_list(x,y+v_speed, p_entity, entity_list, false)
	var snap_y;
	while(entity_count > 0){
		var entity_check = entity_list[| 0];
		if(entity_check.entity_collision == true)
		{
			//Move as close as we can
			if(sign(v_speed)==-1)
			{ 
				snap_y = entity_check.bbox_bottom+1;
			}else{
				snap_y = entity_check.bbox_top-1;
			}
			y = snap_y;
			v_speed = 0
			colliding = true;
			entity_count = 0;
		}
		ds_list_delete(entity_list,0);
		entity_count--;
	}
	
	//Vertical Move Commit
	y+=v_speed

	ds_list_destroy(entity_list)
	return colliding
}
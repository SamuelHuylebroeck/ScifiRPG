// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_calculate_attack_hits(hitbox_mask){
	//Use attack hitbox and check for hits
	var old_mask = mask_index
	show_debug_message(string(hitbox_mask))
	mask_index = hitbox_mask
	var hit_by_attack_now = ds_list_create()
	var hits = instance_place_list(x,y, p_entity, hit_by_attack_now, false)
	
	if(hits > 0)
	{
		for (var i = 0; i<hits;i++)
		{
			//If this instance has not yet been hit by this attack, hit it
			var hit_id = hit_by_attack_now[| i];
			if(ds_list_find_index(entities_hit_by_attack, hit_id) == -1)
			{
				ds_list_add(entities_hit_by_attack, hit_id)
				with(hit_id){
					if(entity_hit_script != -1){
						script_execute(entity_hit_script)
					}
				}
			}
			
		}
	}
	
	ds_list_destroy(hit_by_attack_now)
	mask_index = old_mask
	
}
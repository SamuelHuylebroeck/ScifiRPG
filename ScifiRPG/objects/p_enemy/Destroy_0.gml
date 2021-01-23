event_inherited();

if(controlling_spawner != noone)
{
	with(controlling_spawner)
	{
		nr_active_spawns--;
	}

}
path_delete(goto_path);

with(obj_pc){
	current_xp = min(current_xp + other.enemy_xp_given, xp_to_next_level)	
}
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
	if(current_level < max_level) current_xp += other.enemy_xp_given
}
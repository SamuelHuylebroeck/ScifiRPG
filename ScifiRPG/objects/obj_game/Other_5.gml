// Clean up pathing datastructures

if room == room_sandbox
{
	mp_grid_destroy(global.pathing_grid)
	mp_grid_destroy(global.free_pathing_grid)
}
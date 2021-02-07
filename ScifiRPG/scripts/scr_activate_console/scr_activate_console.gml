// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_activate_console(){
	if(not console_activated)
	{
		image_index = 1
		console_activated = true
		with(obj_pc){
			current_xp += other.console_xp_contents
		}
	}
}
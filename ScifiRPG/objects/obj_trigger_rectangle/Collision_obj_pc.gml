/// @description Insert description here
// You can write your code in this editor
if (not fired) 
{
	show_debug_message("Hit boss start trigger")
	var pc = other
	with(en_boss_frigate){
		scr_boss_frigate_init(self, pc)
	}
	fired = true
}
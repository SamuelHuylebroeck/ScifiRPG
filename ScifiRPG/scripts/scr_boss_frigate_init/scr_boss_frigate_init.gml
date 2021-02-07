// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_boss_frigate_init(boss, target){
	with(boss)
	{
		self.target = target 
		scr_boss_frigate_init_setup_turrets()
		state = BOSS_STATE.CHASE
		boss_draw_healthbar = true;
		if(boss_entry_sfx != -1){
			audio_sound_gain(boss_entry_sfx,global.sfx_gain_base*global.sound_effect_scale*global.sound_master_scale,0)
			audio_play_sound_on(entity_emit,boss_entry_sfx,false,global.sfx_priority)
		}
		
		with(turret_left){
			self.target = other.target
			state = ENEMY_STATE.CHASE
		}
		
		with(turret_right)
		{
			self.target = other.target
			state = ENEMY_STATE.CHASE
		}
	}

}
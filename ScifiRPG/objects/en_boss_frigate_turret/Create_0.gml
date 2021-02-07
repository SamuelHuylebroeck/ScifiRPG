/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
#region config_vars
anticipation_pause_duration = 0.25 *  game_get_speed(gamespeed_fps)
shots_to_fire = 1;
shot_origin_base_correction_x = 10;
shot_origin_base_correction_y = 0;

enemy_script[ENEMY_STATE.IDLE] = scr_boss_frigate_turret_idle;
enemy_script[ENEMY_STATE.CHASE] = scr_boss_frigate_turret_chase;
enemy_script[ENEMY_STATE.ATTACK] = scr_boss_frigate_turret_attack;
enemy_script[ENEMY_STATE.WAIT] = scr_enemy_wait;
enemy_script[ENEMY_STATE.DIE] = scr_enemy_die;

sprite_idle = spr_boss_frigate_turret;
sprite_move = spr_boss_frigate_turret;
sprite_attack = spr_boss_frigate_turret;
sprite_hurt = spr_boss_frigate_turret;
sprite_die = spr_boss_frigate_turret;
#endregion

#region intrinsic_vars

//Intrinsic variables
anticipation_pause = 0;
current_shot_cooldown = 0;
shots_fired = 0;
is_left_turret = false;
controlling_boss = noone;
#endregion
/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Intrinsic variables
anticipation_pause_duration = 0.25 *  game_get_speed(gamespeed_fps)
anticipation_pause = 0;

shots_fired = 0;
shots_to_fire = 1;

shot_origin_base_correction_x = 14;
shot_origin_base_correction_y = 2;

gunner_shooting_turn_rate_gs = gunner_shooting_turn_rate/game_get_speed(gamespeed_fps)

current_shot_cooldown = 0;
gunner_shot_cooldown_gs = gunner_shot_cooldown * game_get_speed(gamespeed_fps) 

//Enemy sprites
sprite_idle = spr_gunner_idle;
sprite_attack = spr_gunner_shooting;
sprite_move = spr_gunner_moving;
sprite_hurt = spr_gunner_moving;
sprite_die = spr_gunner_die;


//Enemy functions
enemy_script[ENEMY_STATE.WANDER] = scr_enemy_wander;
enemy_script[ENEMY_STATE.CHASE] = scr_gunner_chase;
enemy_script[ENEMY_STATE.ATTACK] = scr_gunner_attack;
enemy_script[ENEMY_STATE.HURT] = scr_enemy_hurt;
enemy_script[ENEMY_STATE.DIE] = scr_enemy_die;
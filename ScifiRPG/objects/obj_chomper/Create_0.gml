/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMY_STATE.WANDER

anticipation_pause_duration = 0.25 *  room_speed
anticipation_pause = 0;

//Enemy sprites
sprite_idle = spr_chomper_idle;
sprite_attack = spr_chomper_attack;
sprite_move = spr_chomper_walk;

//Enemy functions
enemy_script[ENEMY_STATE.WANDER] = scr_chomper_wander;
enemy_script[ENEMY_STATE.CHASE] = scr_chomper_chase;
enemy_script[ENEMY_STATE.ATTACK] = scr_chomper_attack;
enemy_script[ENEMY_STATE.HURT] = scr_chomper_hurt;
enemy_script[ENEMY_STATE.DIE] = scr_enemy_die;
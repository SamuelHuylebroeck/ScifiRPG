/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Intrinsic variables
state = ENEMY_STATE.IDLE;
h_speed = 0;
v_speed = 0;
x_to = xstart;
y_to = ystart;

depth = 50;

enemy_turn_rate_rs = enemy_turn_rate/game_get_speed(gamespeed_fps)

dir=0;
time_passed = 0;
wait_duration_base = 1; //In seconds
wait_duration_current = (wait_duration_base + irandom(enemy_wander_wait_time_variance)) * game_get_speed(gamespeed_fps)
wait = 0;

state_target = state;
state_previous = state;
state_initialized = false;
state_wait = 0;
state_wait_duration = 0;
state_default = ENEMY_STATE.WANDER;

aggro_check = 0;
aggro_check_interval = 5;

enemy_aggro_duration_gs = enemy_aggro_duration * game_get_speed(gamespeed_fps);
current_enemy_aggro_duration = 0;

target = noone;

enemy_current_hp = enemy_max_hp;

controlling_spawner = noone;

patrol_path = noone;

goto_path = path_add();

//Enemy sprites
sprite_idle = spr_chomper_idle;
sprite_move = spr_chomper_walk;
sprite_attack = spr_chomper_attack;
sprite_hurt = spr_chomper_hurt;
sprite_die = spr_chomper_die;

//Enemy functions
enemy_script[ENEMY_STATE.IDLE] = -1;
enemy_script[ENEMY_STATE.WANDER] = -1;
enemy_script[ENEMY_STATE.GOTO] = scr_enemy_goto
enemy_script[ENEMY_STATE.PATROL] = scr_enemy_patrolling;
enemy_script[ENEMY_STATE.CHASE] = -1;
enemy_script[ENEMY_STATE.ATTACK] = -1;
enemy_script[ENEMY_STATE.HURT] = -1;
enemy_script[ENEMY_STATE.DIE] = -1;
enemy_script[ENEMY_STATE.WAIT] = scr_enemy_wait;
/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


//Config
chase_sc_default_weights[BOSS_STATE.GOTO_PATROL_1] = 5;
chase_sc_default_weights[BOSS_STATE.GOTO_PATROL_2] = 10;
chase_sc_default_weights[BOSS_STATE.LASER_HUNT] = 20;
chase_sc_default_weights[BOSS_STATE.MISSILES_HUNT] = 30;

sc_repeat_chance_default[BOSS_STATE.CHASE] = 0.7
sc_repeat_chance_default[BOSS_STATE.PATROL_1] = 0.9
sc_repeat_chance_default[BOSS_STATE.PATROL_2] = 0.9

patrol_sc_default_weights[BOSS_STATE.CHASE] = 5;
patrol_sc_default_weights[BOSS_STATE.MISSILES_PATROL] = 10;

patrol_path_one = path_boss_patrol_1;
patrol_path_two = path_boss_patrol_2;

boss_sprites[BOSS_STATE.IDLE] = spr_boss_frigate_idle
boss_sprites[BOSS_STATE.CHASE] = spr_boss_frigate_idle
boss_sprites[BOSS_STATE.GOTO_PATROL_1] = spr_boss_frigate_idle
boss_sprites[BOSS_STATE.PATROL_1] = spr_boss_frigate_idle
boss_sprites[BOSS_STATE.GOTO_PATROL_2] = spr_boss_frigate_idle
boss_sprites[BOSS_STATE.PATROL_2] = spr_boss_frigate_idle
boss_sprites[BOSS_STATE.MISSILES_HUNT] = spr_boss_frigate_missiles_attack
boss_sprites[BOSS_STATE.MISSILES_PATROL] = spr_boss_frigate_missiles_patrol
boss_sprites[BOSS_STATE.LASER_HUNT] = spr_boss_frigate_laser_cycle
boss_sprites[BOSS_STATE.RETREAT] = spr_boss_frigate_idle
boss_sprites[BOSS_STATE.LASER_SWEEP] = spr_boss_frigate_laser_cycle


enemy_script[BOSS_STATE.IDLE] = -1;
enemy_script[BOSS_STATE.CHASE] = scr_boss_frigate_chase;
enemy_script[BOSS_STATE.GOTO_PATROL_1] = scr_boss_frigate_goto;
enemy_script[BOSS_STATE.PATROL_1] = scr_boss_frigate_patrol;
enemy_script[BOSS_STATE.GOTO_PATROL_2] = scr_boss_frigate_goto;
enemy_script[BOSS_STATE.PATROL_2] = scr_boss_frigate_patrol;
enemy_script[BOSS_STATE.MISSILES_HUNT] = scr_boss_frigate_missiles_hunt;
enemy_script[BOSS_STATE.LASER_HUNT] = scr_boss_frigate_laser_hunt;
enemy_script[BOSS_STATE.MISSILES_PATROL] = scr_boss_frigate_missiles_patrol;
enemy_script[BOSS_STATE.RETREAT] = scr_boss_frigate_goto;
enemy_script[BOSS_STATE.LASER_SWEEP] = scr_boss_frigate_laser_sweep;

//Intrinsic variables
current_missile_cooldown = 0;
state = BOSS_STATE.IDLE
turret_left = noone;
turret_right = noone;

circle_direction = 1; //1 left, -1 right
current_state_change_interval = boss_state_change_interval * game_get_speed(gamespeed_fps);

ds_state_change_stack = ds_stack_create();
ds_state_change_map = ds_map_create();

chase_sc_weights[BOSS_STATE.GOTO_PATROL_1] = chase_sc_default_weights[BOSS_STATE.GOTO_PATROL_1];
chase_sc_weights[BOSS_STATE.GOTO_PATROL_2] = chase_sc_default_weights[BOSS_STATE.GOTO_PATROL_2];
chase_sc_weights[BOSS_STATE.LASER_HUNT] = chase_sc_default_weights[BOSS_STATE.LASER_HUNT];
chase_sc_weights[BOSS_STATE.MISSILES_HUNT] = chase_sc_default_weights[BOSS_STATE.MISSILES_HUNT];

patrol_sc_weights[BOSS_STATE.CHASE] = patrol_sc_default_weights[BOSS_STATE.CHASE];
patrol_sc_weights[BOSS_STATE.MISSILES_PATROL] = patrol_sc_default_weights[BOSS_STATE.MISSILES_PATROL];

sc_repeat_chance[BOSS_STATE.CHASE] = sc_repeat_chance_default[BOSS_STATE.CHASE];
sc_repeat_chance[BOSS_STATE.PATROL_1] = sc_repeat_chance_default[BOSS_STATE.PATROL_1];
sc_repeat_chance[BOSS_STATE.PATROL_2] = sc_repeat_chance_default[BOSS_STATE.PATROL_2];

current_patrol_path = noone;
path_started = false;
spinup_complete = false;

nr_of_retreats = 0
next_retreat_point = (1- (nr_of_retreats +1) *boss_retreat_fraction) * enemy_max_hp 

defeated = false;

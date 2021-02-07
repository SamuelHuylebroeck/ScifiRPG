/// @description Player creation logic
//Sprite assignment
anim_idle=spr_pc_idle;
anim_move_tb=spr_pc_move_tb;
anim_move_bt=spr_pc_move_bt;
anim_move_lr=spr_pc_move_lr;
anim_move_rl=spr_pc_move_rl;

anim_smile = spr_pc_smile;

anim_hurt = spr_pc_hurt;

//Levelup modifiers
melee_damage_bonus = 0;
ranged_damage_bonus = 0;
regenate_hp_sec = 0;

//Game logic variables
h_speed=0
v_speed=0
collision_map = layer_tilemap_get_id(layer_get_id("Collision"))

state_map[PLAYER_STATE.FREE] = scr_player_state_free
state_map[PLAYER_STATE.INTERACT] = scr_player_state_smile
state_map[PLAYER_STATE.ATTACK_1] = scr_player_state_combo_attack
state_map[PLAYER_STATE.ATTACK_2] = scr_player_shoot
state_map[PLAYER_STATE.HURT] = scr_player_state_hurt
state_map[PLAYER_STATE.DIE] = -1;

state = PLAYER_STATE.FREE

current_combo_cooldown=0.0
current_hp = max_hp;

max_energy = 3;
current_energy = max_energy;

current_attack_script = scr_player_attack_slash_1;
next_attack_script = scr_player_attack_slash_1;
attack_done = true
entities_hit_by_attack = -1
projectiles_hit_by_attack = -1

max_speed_walk=walk_speed_pps/game_get_speed(gamespeed_fps)

flash = 0
us_flash = shader_get_uniform(sha_white_flash, "flash") //Sends flash value to flash shader in the draw event
z = 0

depth = 0;

remaining_grace_frames = 0

player_debug_mode = false

allocated_reactor_points = 0;

current_level = 1;
xp_to_next_level = (current_level+1) * global.levelling_xp_scale
current_xp = 0;

energy_regen_gs = energy_regen /game_get_speed(gamespeed_fps);




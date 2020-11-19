/// @description Player creation logic
//Config Variables
max_speed_walk=2.0

combo_cooldown=0.25

current_combo_cooldown=0.0

anim_idle=spr_pc_idle
anim_move_tb=spr_pc_move_tb
anim_move_bt=spr_pc_move_bt
anim_move_lr=spr_pc_move_lr
anim_move_rl=spr_pc_move_rl

anim_smile = spr_pc_smile

//Game logic variables
h_speed=0
v_speed=0
collision_map = layer_tilemap_get_id(layer_get_id("Collision"))
state = scr_player_state_free
last_state = state
attack_done=true
entities_hit_by_attack = -1

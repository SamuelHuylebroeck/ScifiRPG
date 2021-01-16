/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Instrinsic spawner variables
spawn_in_progress = false;
has_spawned = false;
nr_active_spawns = 0;
spawn_current_cooldown_gs = spawn_cooldown * game_get_speed(gamespeed_fps);

state = SPAWNER_STATE.IDLE;

//Animation sprites
spawner_sprite[SPAWNER_STATE.IDLE] = spr_spawner_idle_relax;
spawner_sprite[SPAWNER_STATE.SPAWNING] = spr_spawner_spawning;
spawner_sprite[SPAWNER_STATE.DORMANT] = spr_spawner_idle_relax;
spawner_sprite[SPAWNER_STATE.WAIT] = spr_spawner_idle_relax;

//Behaviour scripts
spawner_script[SPAWNER_STATE.IDLE] = scr_spawner_idle;
spawner_script[SPAWNER_STATE.SPAWNING] = scr_spawner_spawn_enemy;
spawner_script[SPAWNER_STATE.DORMANT] = -1;
spawner_script[SPAWNER_STATE.WAIT] = -1;

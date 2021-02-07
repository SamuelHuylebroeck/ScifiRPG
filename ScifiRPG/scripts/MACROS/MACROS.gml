// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro COLLISION_TILESIZE 16
#macro ROOM_START room_sandbox
#macro RANDOMIZE false
#macro ACTIVATE_RANGE 10

enum MOVE_DIRECTIONS
{
	T2B,
	B2T,
	L2R,
	R2L
}

enum PLAYER_STATE
{
	FREE,
	ATTACK_1,
	ATTACK_2,
	INTERACT,
	HURT,
	DIE
	

}

enum ENEMY_STATE
{
	DIE,
	IDLE,
	WANDER,
	GOTO,
	PATROL,
	CHASE,
	ATTACK,
	HURT,
	WAIT
}

enum SPAWNER_STATE
{
	IDLE,
	SPAWNING,
	DORMANT,
	WAIT
}

enum BOSS_STATE
{
	IDLE,
	MISSILES_HUNT,
	MISSILES_PATROL,
	LASER_HUNT,
	LASER_SWEEP,
	GOTO_PATROL_1,
	PATROL_1,
	GOTO_PATROL_2,
	PATROL_2,
	CHASE,
	RETREAT
}

enum MISSILE_STATES
{
	INERT,
	FIRING

}

//Colour definition
#macro GUI_ORANGE_DARK make_color_rgb(147,78,72)
#macro GUI_ORANGE_BRIGHT make_color_rgb(188,133,99)

#macro PARTICLE_GREEN_DARK make_color_rgb(81,108,94)
#macro PARTICLE_GREEN_LIGHT make_color_rgb(175,179,129)
#macro PARTICLE_GREEN_EXTRA_DARK make_color_rgb(75,90,87)
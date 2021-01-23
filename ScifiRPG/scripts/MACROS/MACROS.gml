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
	IDLE,
	WANDER,
	GOTO,
	PATROL,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT
}

enum SPAWNER_STATE
{
	IDLE,
	SPAWNING,
	DORMANT,
	WAIT
}

//Colour definition
#macro GUI_ORANGE_DARK make_color_rgb(147,78,72)
#macro GUI_ORANGE_BRIGHT make_color_rgb(184,99,67)
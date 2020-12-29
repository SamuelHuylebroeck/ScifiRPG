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

enum ENEMY_STATE
{
	IDLE,
	WANDER,
	PATROL,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT
}
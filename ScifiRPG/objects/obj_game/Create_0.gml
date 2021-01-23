/// @description Insert description here
if(RANDOMIZE) randomize();

global.game_paused = false
room_goto(ROOM_START)

//initialize grid
global.pathing_grid = noone;

depth = -100000
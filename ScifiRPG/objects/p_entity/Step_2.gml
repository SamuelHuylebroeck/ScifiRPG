/// @description Insert description here
// You can write your code in this editor
if(!global.game_paused){
	flash = max(0, flash -0.04)
	image_alpha = min(1, image_alpha + 0.04)
}
audio_emitter_position(entity_emit,x,y,0);
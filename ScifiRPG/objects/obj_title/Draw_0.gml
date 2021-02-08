/// @description Insert description here
// You can write your code in this editor
//draw_self()
var old_halign = draw_get_halign()
draw_set_halign(fa_center)
draw_text(x+sprite_width/2,y,object_text);
draw_set_halign(old_halign)
/// @description Insert description here
// You can write your code in this editor
var old_halign = draw_get_halign()
var old_font= draw_get_font()
var old_color = draw_get_color()


draw_set_color(para_color)
draw_set_font(para_font)
draw_set_halign(text_halign)

draw_text(x,y,para_title);

draw_set_color(text_color)
draw_set_font(text_font)

draw_text_ext(x,y+10,text_text,10,300)

draw_set_halign(old_halign)
draw_set_color(old_color)
draw_set_font(old_font)
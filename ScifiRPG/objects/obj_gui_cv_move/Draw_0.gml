draw_self()
var old_halign = draw_get_halign()
var old_font= draw_get_font()
var old_color = draw_get_color()
var old_valign = draw_get_valign()

draw_set_color(control_vis_color)
draw_set_font(control_vis_font)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

var current_x = x+sprite_width+20
var current_y = y
//Up
current_y-=10
draw_text(current_x,current_y, global.up_key)
current_y -=5 
draw_text(current_x,current_y, "^")
//Down
current_y = y + 10
draw_text(current_x,current_y, global.down_key)
current_y+=5
draw_text(current_x,current_y, "v")
//Left
current_y= y
current_x-=10
draw_set_halign(fa_right)
draw_text(current_x,current_y, "< "+string(global.left_key))
//Right
current_x +=20
draw_set_halign(fa_left)
draw_text(current_x,current_y, global.right_key+ " >")



draw_set_halign(old_halign)
draw_set_valign(old_valign)
draw_set_color(old_color)
draw_set_font(old_font)
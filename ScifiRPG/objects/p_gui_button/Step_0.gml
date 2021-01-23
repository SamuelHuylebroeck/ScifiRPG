/// @description Insert description here
// You can write your code in this editor
var hover = scr_is_mouse_hovering_over_gui_element(x,y,sprite_width * image_xscale ,sprite_height);
var click = hover && mouse_check_button_pressed(mb_left)
var click_alt = hover && mouse_check_button_pressed(mb_right)

if(hover)
{
	highlighted = true;
}else{
	highlighted = false;
}

if(visible && click)
{
	if(activation_script != -1)
	{
		scr_script_execute_array(activation_script, [])
	}
}

if(visible && click_alt)
{
	if(alt_activation_script != -1)
	{
		scr_script_execute_array(alt_activation_script, [])
	}
}
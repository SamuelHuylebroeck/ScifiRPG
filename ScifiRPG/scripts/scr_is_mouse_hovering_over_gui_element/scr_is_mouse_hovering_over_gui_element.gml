///@function scr_is_hovering_over(x_pos, y_pos, width, height)
///@param {int} x_pos x-value of the top left corner in pixels
///@param {int} y_pos y-value of the the top left corner in pixels
///@param {int} width width of the object in pixels
///@param {int} height height of the object in pixels
///@description check if the mouse is hovering over this object
function scr_is_mouse_hovering_over_gui_element(x_pos, y_pos, width, height) {
	var mouse_gui_x = device_mouse_x_to_gui(0);
	var mouse_gui_y = device_mouse_y_to_gui(0);

	return point_in_rectangle(mouse_gui_x,mouse_gui_y,x_pos,y_pos,x_pos+width,y_pos+height);
}

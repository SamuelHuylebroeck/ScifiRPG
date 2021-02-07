// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function debug_print_stack_contents(stack){
	var copied_stack  = ds_stack_create()
	ds_stack_copy(copied_stack,stack)
	var result = "";
	while(not ds_stack_empty(copied_stack))
	{
		result += string(ds_stack_pop(copied_stack))+ "->"
	}
	ds_stack_destroy(copied_stack)
	show_debug_message(result)
}

function debug_print_list_contents(list){
	result = "["
	for(var i = 0; i< ds_list_size(list);i++)
	{
		result+= string(list[|i])+", "
	
	}
	result += "]"
	show_debug_message(result)
}

function debug_print_map_contents(map){
	var keys = ds_map_keys_to_array(map)
	var result = "{";
	for(var i = 0; i< array_length(keys);i++){
		result += string(keys[i]) +":"+string(ds_map_find_value(map, keys[i]))+", "
	}
	result += "}";
	show_debug_message(result)
}
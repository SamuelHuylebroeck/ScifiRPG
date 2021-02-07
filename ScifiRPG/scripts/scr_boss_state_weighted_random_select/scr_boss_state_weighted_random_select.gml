// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_boss_state_weighted_random_select(behaviour_map, behaviour_stack, default_state){
	//debug_print_map_contents(behaviour_map)
	var key_array = ds_map_keys_to_array(behaviour_map)
	array_sort(key_array, true)
	ds_stack_clear(behaviour_stack)
	//Build the stack
	for (var i=0; i < array_length(key_array); i++)
	{
		ds_stack_push(behaviour_stack, key_array[i])
	}
	debug_print_stack_contents(behaviour_stack)
	//Generate random number
	var rand_value = random_range(0,100)
	//Retrieve the found state from the stack and map
	var chosen_state = default_state
	while(not ds_stack_empty(behaviour_stack)){
		var border_value = ds_stack_pop(behaviour_stack)
		if (rand_value > border_value)
		{
			//Value is found, get the state and clear the stack
			//show_debug_message("random value " + string(rand_value) + ", border value: " + string(border_value));
			chosen_state = ds_map_find_value(behaviour_map, border_value);
			ds_stack_clear(behaviour_stack)
		}
	
	}
	return chosen_state

}
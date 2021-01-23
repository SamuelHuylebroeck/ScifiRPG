// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_allocate_skill(){
	nr_states = array_length_1d(sprite_map)
	//Check if there's enough reactor space left to go to the next state
	var next_state = (state+1)%nr_states
	var execute_script = false;
	if(next_state == 0)
	{
		//de-allocate
		var points_to_free = 0
		state = next_state
		sprite_index = sprite_map[state];
		for(var j=nr_states; j>0; j--) points_to_free += j;
		player_character.allocated_reactor_points=max(0,player_character.allocated_reactor_points - points_to_free);
		execute_script = true
		
	} else
	{
		if (player_character.allocated_reactor_points + next_state <= player_character.available_reactor_points){
			state = ++state%nr_states;
			sprite_index = sprite_map[state];
			player_character.allocated_reactor_points += next_state
			execute_script = true
		}
	}
	

	if(skill_script_map[state] != -1 && execute_script)
	{
		show_debug_message("Activating skill state " + string(state) +" for block " + string(text_title));
		scr_script_execute_array(skill_script_map[state], [])	
	}
}
	
function scr_deallocate_skill(){ 
	nr_states = array_length_1d(sprite_map)
	var next_state = max((state-1)%nr_states,0)
	player_character.allocated_reactor_points=max(0,player_character.allocated_reactor_points - state);
	if(skill_inverse_script_map[state] != -1)
	{
		
		show_debug_message("Deactivating skill state " + string(state) +" for block " + string(text_title));
		scr_script_execute_array(skill_inverse_script_map[state], [])	
	}
	state = next_state
	sprite_index = sprite_map[state];
}
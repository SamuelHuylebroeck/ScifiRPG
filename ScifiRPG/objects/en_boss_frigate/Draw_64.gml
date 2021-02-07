//Draw Boss Health bar

if (boss_draw_healthbar){

	var boss_healthbar_length = view_get_wport(0)/2
	var health_bar_width = 30
	var health_bar_y_pos = 620
	var old_color = draw_get_color();
	draw_set_color(GUI_ORANGE_DARK);
	draw_rectangle(boss_healthbar_length/2,health_bar_y_pos,3*boss_healthbar_length/2, health_bar_y_pos +health_bar_width ,false);
	draw_set_color(GUI_ORANGE_BRIGHT);
	var relative_health = max(enemy_current_hp/enemy_max_hp,0)
	draw_rectangle(boss_healthbar_length/2,health_bar_y_pos,boss_healthbar_length/2 +boss_healthbar_length*relative_health,health_bar_y_pos+health_bar_width,false);
	draw_text(boss_healthbar_length-100,600, boss_title)
	
	//Draw segments
	var nr_segments = floor(1/boss_retreat_fraction);
	var segment_width = 5;
	for(var i = 1; i < nr_segments; i++){
		draw_set_color(GUI_ORANGE_DARK);
		draw_rectangle(boss_healthbar_length/2 +i*(boss_healthbar_length/nr_segments) -segment_width/2,health_bar_y_pos,boss_healthbar_length/2 +i*(boss_healthbar_length/nr_segments) + segment_width/2, health_bar_y_pos +health_bar_width ,false);
	}
	
	//reset
	draw_set_color(old_color);

}
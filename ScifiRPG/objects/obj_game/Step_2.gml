/// @description Pausing the game
// You can write your code in this editor
if(keyboard_check_pressed(ord(global.pause_key)))
{
	global.game_paused = ! global.game_paused;

	if(global.game_paused)
	{
		with(all)
		{
  			game_paused_image_speed = image_speed;
			image_speed = 0;
		}
	
	}else{
		with(all){
			image_speed = game_paused_image_speed;
		}
	
	
	}
}

if(keyboard_check_pressed(ord(global.keyboard_switch_key))){
	scr_qwerty_azerty_switch()
}
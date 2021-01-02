// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hurt_enemy(enemy, damage, source, knockback)
{
	with(enemy)
	{
		if( state != ENEMY_STATE.DIE )
		{
			enemy_current_hp -= damage;
			flash = 0.75;
			
			if( enemy_current_hp <= 0 ) {
				state = ENEMY_STATE.DIE
			}else{
				if(state != ENEMY_STATE.HURT) state_previous = state
				state = ENEMY_STATE.HURT
			
			}
			image_index = 0;
			if(knockback != 0 )
			{
				var knock_direction = point_direction(x,y,(source).x, (source).y)
				x_to = x - lengthdir_x(knockback, knock_direction);
				y_to = y - lengthdir_y(knockback, knock_direction);
			}
		}
	
	}
}
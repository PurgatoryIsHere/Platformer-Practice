/// @description Damage Handling
// You can write your code in this editor

// Taking damage from player
if(place_meeting(x, y, PlayerObject) && !shield_active && (PlayerObject.groundPounding || PlayerObject.dashing))
{
	if(boss_i_frame_timer == 0)
	{
		TakeDamage(phase);
	}
}

if (phase == 3)
{
	y_speed += 0.2
	
	player_dir = point_direction(x, y, PlayerObject.x, PlayerObject.y)
	
	if ((player_dir >= 0 && player_dir <= 89) || (player_dir >= 270 && player_dir <= 359))
	{
		hspeed = 2
	}
	else if (player_dir >= 90 && player_dir <= 269)
	{
		hspeed = -2
	}
	
	// Apply movement with collision
	boss_move_and_collide(hspeed, y_speed, GroundObject);
}
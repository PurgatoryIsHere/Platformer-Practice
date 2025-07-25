/// @description Chase player & damage handling
// You can write your code in this editor

if sees_player
{
	sprite_index = FreeFlyEnemyActiveSprite
	
	var dir = point_direction(x, y, PlayerObject.x - 16, PlayerObject.y - 16);
    var spd = 2; // Example speed, adjust as needed
    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);
	
	
	// Damage the Player
	if(place_meeting(x, y, PlayerObject) && !PlayerObject.dashing && !PlayerObject.groundPounding)
	{
		if(PlayerObject.i_frame_timer == 0)
		{
			PlayerObject.TakeDamage(5);
			PlayerObject.i_frame_timer = 48
		}
	}
}

// Damaged by the player
if(place_meeting(x, y, PlayerObject) && (PlayerObject.groundPounding || PlayerObject.dashing))
{
	instance_destroy(self)
}
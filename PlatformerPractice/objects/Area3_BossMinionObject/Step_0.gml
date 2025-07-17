/// @description Movement & Damage
// You can write your code in this editor

if(instance_exists(PlayerObject))
{
	if(PlayerObject.x < x)
	{
		dir = -1;
	}
	
	else
	{
		dir = 1;
	}
}

if place_free(x + dir, y) && !place_free(x + (dir * 16), y + 9)
{
	hspeed = dir * 1
}

// Damaging the player
if(place_meeting(x, y, PlayerObject) && !PlayerObject.dashing && !PlayerObject.groundPounding)
{
	if(PlayerObject.i_frame_timer == 0)
	{
		PlayerObject.TakeDamage(5);
		PlayerObject.i_frame_timer = 32
	}
}

// Damaged by the player
if(place_meeting(x, y - 1, PlayerObject) && (PlayerObject.groundPounding || PlayerObject.dashing))
{
	instance_destroy(self)
}
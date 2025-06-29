/// @description Insert description here
// You can write your code in this editor
image_xscale = dir / 2

if place_free(x + dir, y) && !place_free(x + (dir * 16), y + 9)
{
	hspeed = dir * 1
}
else 
{
	image_xscale = dir / 2
	dir *= -1
}

// Damaging the player
if(place_meeting(x, y, PlayerObject) && !PlayerObject.dashing && !PlayerObject.groundPounding)
{
	if(PlayerObject.i_frame_timer == 0)
	{
		PlayerObject.TakeDamage(5);
		PlayerObject.i_frame_timer = 32
	}
	
	if(global.player_health == 0)
	{
		PlayerObject.LifeReduction();
	}
}

// Damaged by the player
if(place_meeting(x, y - 1, PlayerObject) && (PlayerObject.groundPounding || PlayerObject.dashing))
{
	instance_destroy(self)
}
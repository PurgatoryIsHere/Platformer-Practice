/// @description Damage calculation
// You can write your code in this editor

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
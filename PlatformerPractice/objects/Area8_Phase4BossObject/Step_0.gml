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
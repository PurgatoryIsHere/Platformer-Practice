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
	y_speed += 0/2

	if (instance_exists(PlayerObject))
	{
		var dist = PlayerObject.x - x
		
		var pull = 40
		
		hspeed += dist / pull;
		
		hspeed *= 4
		
		hspeed = clamp(hspeed, -4, 4)
	}
	
	if (place_meeting(x + hspeed, y, GroundObject))
	{
		hspeed *= -1
	}
}

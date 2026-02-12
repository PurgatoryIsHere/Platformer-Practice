     /// @description Damage Handling
// You can write your code in this editor

// Taking damage from player
if(place_meeting(x, y, O_Player) && !shield_active && (O_Player.groundPounding || O_Player.dashing))
{
	if(boss_i_frame_timer == 0)
	{
		TakeDamage(phase);
	}
}

if (phase == 3)
{
	if (shield_active)
	{
		sprite_index = S_A8BossPhase4Shielded	
	}
	else if (!shield_active)
	{
		sprite_index = S_A8BossPhase4
	}
	
	y_speed += 0/2

	if (instance_exists(O_Player))
	{
		var dist = O_Player.x - x
		
		var pull = 40
		
		hspeed += dist / pull;
		
		hspeed *= 4
		
		hspeed = clamp(hspeed, -4, 4)
	}
	
	if (place_meeting(x + hspeed, y, O_Ground))
	{
		hspeed *= -1
	}
}
else if (shield_active)
{
	sprite_index = S_A8BossSheilded	
}
else if (!shield_active)
{
	sprite_index = S_A8Boss	
}

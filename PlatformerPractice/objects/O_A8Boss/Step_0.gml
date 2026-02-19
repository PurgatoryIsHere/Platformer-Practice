/// @description Boss Mechanics
// You can write your code in this editor

boss_i_frame_timer = max(boss_i_frame_timer - 1, 0);

if(boss_battle_active)
{
	// --------------------------------------------
	// Dealing/Taking Damage
	// --------------------------------------------
	if(place_meeting(x, y, O_Player) && !shield_active && (O_Player.groundPounding || O_Player.dashing))
	{
		if(boss_i_frame_timer == 0)
		{
			TakeDamage(phase);
		}
	}

	// --------------------------------------------
	// I-frame Visualization
	// --------------------------------------------
	if(boss_i_frame_timer > 0)
	{
		image_alpha = 0.5 + 0.5 * sin(boss_i_frame_timer * 0.5);
	}

	else
	{
		image_alpha = 1	
	}
	

	if(phase == 3)
	{
		if (shield_active)
		{
			sprite_index = S_A8BossPhase4Shielded;
		}
		
		else if (!shield_active)
		{
			sprite_index = S_A8BossPhase4;
		}
	
		y_speed += 0/2

		if(instance_exists(O_Player))
		{
			var dist = O_Player.x - x;
			var pull = 40;
		
			hspeed += dist / pull;
			hspeed *= 4;
			hspeed = clamp(hspeed, -4, 4);
		}
	
		if (place_meeting(x + hspeed, y, O_Ground))
		{
			hspeed *= -1
		}
	}
}

// Screen white-out effect
if(fading_out) 
{
    fade_alpha += fade_speed;
	
    if (fade_alpha >= 1) 
	{
        fade_alpha = 1;
        fading_out = false;
		whited_out = true;
		PhaseChange();
    }
}

if(phase < 3)
{
	if (shield_active)
	{
		sprite_index = S_A8BossShielded	
	}

	else if (!shield_active)
	{
		sprite_index = S_A8Boss	
	}
}

else
{
	if(shield_active)
	{
		sprite_index = S_A8BossPhase4Shielded;
	}
		
	else if (!shield_active)
	{
		sprite_index = S_A8BossPhase4;
	}
}
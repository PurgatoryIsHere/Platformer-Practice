/// @description Insert description here
// You can write your code in this editor
boss_i_frame_timer = max(boss_i_frame_timer - 1, 0);

image_xscale = dir / 2;

if place_free(x + dir, y) && !place_free(x + (dir * 16), y + 9)
{
	hspeed = dir * 1
}
else 
{
	image_xscale = dir / 2;
	dir *= -1
}

// Damaging the player
if(place_meeting(x, y, PlayerObject) && !PlayerObject.dashing && !PlayerObject.groundPounding)
{
	if(PlayerObject.i_frame_timer == 0)
	{
		PlayerObject.TakeDamage(15);
		PlayerObject.i_frame_timer = 32
	}
	
	if(global.player_health == 0)
	{
		PlayerObject.LifeReduction();
	}
}

// Taking damage from player
if(place_meeting(x, y, PlayerObject) && (PlayerObject.groundPounding || PlayerObject.dashing))
{
	if(boss_i_frame_timer == 0)
	{
		TakeDamage(10);
	}
}

// I-frames visualization (after being damaged by player)
if(boss_i_frame_timer > 0)
{
	image_alpha = 0.5 + 0.5 * sin(boss_i_frame_timer * 0.5);
}

else
{
	image_alpha = 1	
}
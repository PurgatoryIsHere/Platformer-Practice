/// @description Basic frame-by-frame mechanics
// You can write your code in this editor

boss_i_frame_timer = max(boss_i_frame_timer - 1, 0);


// Taking damage from player
if(place_meeting(x, y, PlayerObject) && (PlayerObject.groundPounding || PlayerObject.dashing))
{
	if(boss_i_frame_timer == 0)
	{
		TakeDamage(10);
	}
}


// Invicibility frames
if(boss_i_frame_timer > 0)
{
	image_alpha = 0.5 + 0.5 * sin(boss_i_frame_timer * 0.5);
}

else
{
	image_alpha = 1	;
}


boss_move_and_collide(hspeed, vspeed, GroundObject);
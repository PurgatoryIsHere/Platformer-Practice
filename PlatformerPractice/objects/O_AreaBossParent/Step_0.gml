/// @description Basic frame-by-frame mechanics
// You can write your code in this editor

boss_i_frame_timer = max(boss_i_frame_timer - 1, 0);

image_xscale = dir;

// Horizontal Movement
if place_free(x + dir, y) && !place_free(x + (dir * 24), y + 9)
{
	hspeed = dir;
}

else
{
	image_xscale = dir * 1.5;
	dir *= -1;
}

if(!place_free(x + hspeed, y)) 
{
    image_xscale = dir * 1.5;
    dir *= -1;   // Reverse direction
	hspeed = dir;
}


// Taking damage from player
if(place_meeting(x, y, O_Player) && (O_Player.groundPounding || O_Player.dashing))
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


boss_move_and_collide(hspeed, vspeed, O_Ground);
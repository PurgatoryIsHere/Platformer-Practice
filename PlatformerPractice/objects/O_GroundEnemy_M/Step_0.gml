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
if(place_meeting(x, y, O_Player) && !O_Player.dashing && !O_Player.groundPounding)
{
	if(O_Player.i_frame_timer == 0)
	{
		O_Player.TakeDamage(5);
		O_Player.i_frame_timer = 32
	}
}

// Damaged by the player
if(place_meeting(x, y - 1, O_Player) && (O_Player.groundPounding || O_Player.dashing))
{
	instance_destroy(self)
}
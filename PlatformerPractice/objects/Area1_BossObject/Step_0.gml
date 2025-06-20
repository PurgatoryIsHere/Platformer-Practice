/// @description Movement and mechanics of the boss for area 1
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

if(place_meeting(x, y, PlayerObject) && (PlayerObject.groundPounding || PlayerObject.dashing))
{
	PlayerObject.TakeDamage(-5)
	PlayerObject.i_frame_timer = 0
	instance_destroy(self)
}
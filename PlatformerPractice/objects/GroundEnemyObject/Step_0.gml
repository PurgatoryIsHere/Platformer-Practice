/// @description Insert description here
// You can write your code in this editor
image_xscale = dir / 2

if place_free(x + dir, y) && !place_free(x + dir, y + 1)
{
	hspeed = dir * 1
}
else 
{
	image_xscale = dir / 2
	dir *= -1
}
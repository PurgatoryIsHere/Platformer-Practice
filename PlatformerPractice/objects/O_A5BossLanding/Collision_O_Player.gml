/// @description Insert description here
// You can write your code in this editor

with(O_Player)
{
	beingFired = false;
	dashing = false;
	groundPounding = false;
	grappling = false;
	input_enabled = true;
	x_speed = max(x_speed - 1, 0);
	
	if(x_speed == 0)
	{
		state = stateFree;
	}
}
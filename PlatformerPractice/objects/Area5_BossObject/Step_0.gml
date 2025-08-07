/// @description Check if being hit
// You can write your code in this editor

if (place_meeting(x, y, PlayerObject) && PlayerObject.beingFired)
{
	//move to next phase
	PlayerObject.beingFired = false
	phase += 1
	
	show_debug_message(phase)
	show_debug_message(next_site.phase)
	
	//if this was the last phase, die
	if(next_site.phase != phase)
	{
		instance_destroy(self)
		instance_create_layer(x, y, "Instances", GrappleUnlockObject);
	}
}

if(!instance_exists(next_site))
{
	speed = 0
}
else if (point_distance(x, y, next_site.x, next_site.y) > 2)
{
	direction = point_direction(x, y, next_site.x, next_site.y)
	speed = 2
}
else
{
	speed = 0
}

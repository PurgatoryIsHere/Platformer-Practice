  /// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, O_Player) && O_Player.beingFired)
{
	//move to next phase
	O_Player.beingFired = false
	phase += 1
	
	show_debug_message(phase)
	show_debug_message(next_site.phase)
	
	//if this was the last phase, die
	if(phase >= 4)
	{
		instance_destroy(self)
		DropKeyPiece()
	}
}

if (point_distance(x, y, next_site.x, next_site.y) > 2 )
{
	direction = point_direction(x, y, next_site.x, next_site.y)
	speed = 2
}
else
{
	speed = 0
}

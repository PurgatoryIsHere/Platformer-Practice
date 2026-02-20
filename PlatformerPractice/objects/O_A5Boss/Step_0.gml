/// @description Check if being hit
// You can write your code in this editor

if (place_meeting(x, y, O_Player) && O_Player.beingFired)
{
	//move to next phase
	O_Player.beingFired = false
	phase += 1
	
	show_debug_message(phase)
	show_debug_message(next_site.phase)
	
	//if this was the last phase, die
	if(phase >= 8)
	{
		audio_play_sound(_629664__stumpbutt__retro_taking_damage_sfx2_boss, 1, false)
		
		with(O_A5PhaseGate)
		{
			instance_destroy(self);
		}
		
		instance_destroy(self)
		DropAbility()
	}
}

if (instance_exists(next_site))
{
	if (point_distance(x, y, next_site.x, next_site.y) > 2)
	{
		direction = point_direction(x, y, next_site.x, next_site.y)
		speed = 2
	}
	else
	{
		speed = 0
	}
} 
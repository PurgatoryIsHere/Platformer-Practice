/// @description Creates an alarm if player passes this object
// You can write your code in this editor

if(place_meeting(x, y, O_Player) && !passed)
{
	with(O_BottomlessPit)
	{
		passed = true;
	}
	
	O_Player.input_enabled = false;
	O_Player.x_speed = 0;
	alarm[0] = 60; // Triggers after 1 second (60 frames)
}
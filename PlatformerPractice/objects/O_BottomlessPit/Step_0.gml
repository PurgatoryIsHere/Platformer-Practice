/// @description Creates an alarm if player passes this object
// You can write your code in this editor

if(place_meeting(x, y, O_Player))
{
	alarm[0] = 60; // Triggers after 1 second (60 frames)
}
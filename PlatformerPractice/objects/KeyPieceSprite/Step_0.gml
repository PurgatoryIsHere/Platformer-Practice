/// @description Increment variable in KeyObject
// You can write your code in this editor

if(place_meeting(x, y, PlayerObject))
{
	KeyObject.key_pieces_collected += 1;
	instance_destroy(self);
}
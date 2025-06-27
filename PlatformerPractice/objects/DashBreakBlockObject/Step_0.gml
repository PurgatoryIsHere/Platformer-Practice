/// @description Break Logic
// You can write your code in this editor

if((PlayerObject.dashing) && (place_meeting(x + 1, y, PlayerObject) || place_meeting(x - 1, y, PlayerObject)))
{
	instance_destroy(self);
}
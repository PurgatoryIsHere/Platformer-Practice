/// @description Break Logic
// You can write your code in this editor

if PlayerObject.ground_dash && (place_meeting(x + 1, y, PlayerObject) || place_meeting(x - 1, y, PlayerObject))
{
	instance_destroy(self)	
	PlayerObject.ground_dash = false
}
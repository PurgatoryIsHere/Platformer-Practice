/// @description Break Logic
// You can write your code in this editor

if PlayerObject.groundPounding && place_meeting(x, y - 1, PlayerObject)
{
	instance_destroy(self)	
	PlayerObject.groundPounding = false
}
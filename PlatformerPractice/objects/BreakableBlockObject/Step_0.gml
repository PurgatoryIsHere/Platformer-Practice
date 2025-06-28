/// @description Break Logic
// You can write your code in this editor

if(PlayerObject.groundPounding) && place_meeting(x, y - sprite_height, PlayerObject)
{
	instance_destroy(self)	
	PlayerObject.groundPounding = false
}
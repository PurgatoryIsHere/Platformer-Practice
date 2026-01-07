/// @description Break Logic
// You can write your code in this editor

if(O_Player.groundPounding) && place_meeting(x, y - sprite_height, O_Player)
{
	instance_destroy(self)	
	O_Player.groundPounding = false
}
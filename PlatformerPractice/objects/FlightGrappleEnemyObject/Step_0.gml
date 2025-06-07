/// @description Insert description here
// You can write your code in this editor

if place_meeting(x, y, PlayerObject) && PlayerObject.grappling
{
	instance_destroy(self)
	PlayerObject.y_speed = 2
	PlayerObject.x_speed = 0
}
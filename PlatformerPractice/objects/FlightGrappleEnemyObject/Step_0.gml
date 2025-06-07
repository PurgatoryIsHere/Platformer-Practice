/// @description Insert description here
// You can write your code in this editor

if place_meeting(x, y, PlayerObject) && PlayerObject.grappling
{
	instance_destroy(self)
	PlayerObject.grappling = false
	PlayerObject.y_speed = -2.5
}
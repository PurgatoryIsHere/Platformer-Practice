/// @description Insert description here
// You can write your code in this editor

if place_meeting(x, y, PlayerObject)
{
	global.groundPoundUnlock = true
	global.ability_collected = true;
	instance_destroy(self)
}
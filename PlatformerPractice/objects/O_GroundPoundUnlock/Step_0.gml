/// @description Insert description here
// You can write your code in this editor

if place_meeting(x, y, O_Player)
{
	global.groundPoundUnlock = true
	global.ability_collected = true;
	instance_destroy(self)
}
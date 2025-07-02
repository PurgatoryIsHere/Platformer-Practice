/// @description Insert description here
// You can write your code in this editor

if place_meeting(x, y, PlayerObject)
{
	global.doubleJumpUnlock = true
	global.ability_collected = true;
	instance_destroy(self)
}
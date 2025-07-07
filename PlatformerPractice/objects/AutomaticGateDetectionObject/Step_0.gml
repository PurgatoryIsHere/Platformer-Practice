/// @description Insert description here
// You can write your code in this editor

if(!activated && collision_rectangle(x - 6, y - 8, x + 6, y + 8, PlayerObject, false, true))
{
	activated = true;
	alarm[0] = 10;
}
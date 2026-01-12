 /// @description Initialize Variables
// You can write your code in this editor

alarm[0] =  60 * 3;

phase = 1 
next_site = 0

DropAbility = function()
{
	instance_create_layer(x, y, "Instances", O_GrappleUnlock);
}
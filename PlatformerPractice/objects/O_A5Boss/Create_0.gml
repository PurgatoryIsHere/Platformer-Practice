 /// @description Initialize Variables
// You can write your code in this editor

alarm[0] =  60 * 3;

phase = 1 

next_site = 0

global.isBossAlive = true;


DropAbility = function() // Spawns the ability that a boss would drop upon defeat
{
	// Have a place in the boss arena that the ability will spawn at; likely the center of the arena will do
	instance_create_layer(x, y, "Instances", O_GrappleUnlock); // Change x and y to the specified coordinates
}
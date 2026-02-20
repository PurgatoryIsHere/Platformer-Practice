 /// @description Initialize Variables
// You can write your code in this editor

alarm[0] =  60 * 3;

phase = 1 
next_site = 0
respawn_check = true;

if(global.checkpoint_x == 1232 && global.checkpoint_y == 448 && respawn_check)
{
	x = 1280;
	y = 336;
	phase = 4;
	respawn_check = false;
}

if(global.checkpoint_x == 1872 && global.checkpoint_y == 448 && respawn_check)
{
	x = 1920;
	y = 96;
	phase = 6;
	respawn_check = false;
}

DropAbility = function()
{
	instance_create_layer(2672, 448, "Instances", O_GrappleUnlock);
}
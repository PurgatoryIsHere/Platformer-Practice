/// @description Teleport
// You can write your code in this editor
if(!instance_exists(PlayerObject) && fading_in)
{
	instance_create_layer(0, 0, "Instances", PlayerObject);
	PlayerObject.x = global.teleport_x;
	PlayerObject.y = global.teleport_y;
}

else if(instance_exists(PlayerObject) && fading_in)
{
	PlayerObject.x = global.teleport_x;
	PlayerObject.y = global.teleport_y;
}
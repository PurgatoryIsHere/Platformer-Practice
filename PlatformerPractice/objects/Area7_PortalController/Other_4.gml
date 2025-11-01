/// @description Teleport
// You can write your code in this editor
if(instance_exists(PlayerObject) && fading_in)
{
	PlayerObject.x = global.teleport_x;
	PlayerObject.y = global.teleport_y;
}
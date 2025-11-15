/// @description Teleport
// You can write your code in this editor
if(instance_exists(O_Player) && fading_in)
{
	O_Player.x = global.teleport_x;
	O_Player.y = global.teleport_y;
}
/// @description Warp mechanics
// You can write your code in this editor

var player = instance_place(x, y, PlayerObject);

if (player != noone && !Area7_PortalController.fading_out && !Area7_PortalController.fading_in) 
{
	Area7_PortalController.fading_out = true;
	Area7_PortalController.teleport_key = key;
	
	with(PlayerObject)
	{
		input_enabled = false;
		x_speed = 0;
		y_speed = 0;
	}
}




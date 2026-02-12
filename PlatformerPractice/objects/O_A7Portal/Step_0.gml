/// @description Warp mechanics
// You can write your code in this editor
cooldown_timer = max(cooldown_timer - 1, 0)

var player = instance_place(x, y, O_Player);

if(player != noone && !A7PortalController.fading_out && !A7PortalController.fading_in && cooldown_timer == 0) 
{
	audio_play_sound(_683096__florianreichelt__woosh, 2, false)
	
	A7PortalController.fading_out = true;
	A7PortalController.teleport_key = key;
	
	with(O_Player)
	{
		input_enabled = false;
		x_speed = 0;
		y_speed = 0;
	}
}




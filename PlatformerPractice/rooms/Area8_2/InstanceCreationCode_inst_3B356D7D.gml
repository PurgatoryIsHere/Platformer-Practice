TriggerEvent = function()
{
	var tiles_to_destroy = [instance_position(80, 400, O_Ground), instance_position(96, 400, O_Ground),
							instance_position(112, 400, O_Ground), instance_position(128, 400, O_Ground),
							instance_position(80, 416, O_Ground), instance_position(96, 416, O_Ground),
							instance_position(112, 416, O_Ground), instance_position(128, 416, O_Ground),
							instance_position(144, 400, O_LeftSpike), instance_position(144, 416, O_LeftSpike)];
							
	for(var i = 0; i < array_length(tiles_to_destroy); i++)
	{
		instance_destroy(tiles_to_destroy[i]);
	}
	
	audio_play_sound(_267409__thestarking__building_destruction_noise_1_quiet, 1, false)
	
	instance_destroy(self);
}
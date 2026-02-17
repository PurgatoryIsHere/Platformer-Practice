TriggerEvent = function()
{
	var tiles_to_destroy = [instance_position(864, 48, O_AutoGate),
	instance_position(864, 64, O_AutoGate), instance_position(864, 80, O_AutoGate)];
	
	for(var i = 0; i < array_length(tiles_to_destroy); i++)
	{
		instance_destroy(tiles_to_destroy[i]);
	}
	
	instance_deactivate_object(O_Timer);
	audio_stop_sound(_759501__gammagool__tick_tock_dry);
	instance_destroy(self);
}
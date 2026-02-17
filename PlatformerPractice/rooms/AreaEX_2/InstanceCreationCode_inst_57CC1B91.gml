TriggerEvent = function()
{
	instance_deactivate_object(O_Timer);
	audio_stop_sound(_759501__gammagool__tick_tock_dry);
	instance_destroy(self);
}
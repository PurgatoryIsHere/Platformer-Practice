TriggerEvent = function()
{	
	with(PillarObject)
	{
		alarm_triggered = true;
		alarm[0] = 30; // Delay before destruction
		shake_time = 30;
	}
	
	instance_destroy(self);
}
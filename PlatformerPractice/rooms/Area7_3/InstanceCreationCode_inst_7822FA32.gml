TriggerEvent = function()
{
	var tiles_to_destroy = [instance_position(864, 48, AutomaticGateObject),
	instance_position(864, 64, AutomaticGateObject), instance_position(864, 80, AutomaticGateObject)];
	
	for(var i = 0; i < array_length(tiles_to_destroy); i++)
	{
		instance_destroy(tiles_to_destroy[i]);
	}
	
	instance_deactivate_object(TimerObject);
	instance_destroy(self);
}
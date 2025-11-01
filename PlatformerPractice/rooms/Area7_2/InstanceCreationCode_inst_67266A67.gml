TriggerEvent = function()
{
	var tiles_to_destroy = [instance_position(3120, 384, GroundObject), instance_position(3136, 384, GroundObject)];
	
	for(var i = 0; i < array_length(tiles_to_destroy); i++)
	{
		instance_destroy(tiles_to_destroy[i]);
	}
	
	instance_create_layer(3120, 384, "Instances", AutomaticGateDetectionObject);
	instance_create_layer(3136, 384, "Instances", AutomaticGateDetectionObject);
	
	instance_destroy(self);
}
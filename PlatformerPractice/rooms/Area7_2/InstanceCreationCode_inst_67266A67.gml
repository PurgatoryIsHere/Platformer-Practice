TriggerEvent = function()
{
	var tiles_to_destroy = [instance_position(1056, 384, GroundObject), instance_position(1072, 384, GroundObject)];
	
	for(var i = 0; i < array_length(tiles_to_destroy); i++)
	{
		instance_destroy(tiles_to_destroy[i]);
	}
	
	instance_create_layer(1056, 384, "Instances", AutomaticGateDetectionObject);
	instance_create_layer(1072, 384, "Instances", AutomaticGateDetectionObject);
	
	instance_destroy(self);
}
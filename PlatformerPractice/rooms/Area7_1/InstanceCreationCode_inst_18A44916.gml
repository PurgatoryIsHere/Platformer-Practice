EventTrigger = function()
{
	var tiles_to_destroy = [instance_position(656, 192, GroundObject), instance_position(672, 192, GroundObject),
	instance_position(656, 208, GroundObject), instance_position(672, 208, GroundObject)];
	
	for(var i = 0; i < array_length(tiles_to_destroy); i++)
	{
		instance_destroy(tiles_to_destroy[i]);
	}
	
	instance_create_layer(688, 224, "Instances", AutomaticGateObject);
	instance_create_layer(704, 224, "Instances", AutomaticGateObject);
	instance_create_layer(720, 224, "Instances", AutomaticGateObject);
	
	instance_destroy(self);
}
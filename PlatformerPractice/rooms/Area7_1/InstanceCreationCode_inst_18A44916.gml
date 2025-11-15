TriggerEvent = function()
{
	var tiles_to_destroy = [instance_position(656, 192.099, O_Ground), instance_position(672, 192.099, O_Ground),
	instance_position(656, 208.099, O_Ground), instance_position(672, 208.099, O_Ground)];
	
	for(var i = 0; i < array_length(tiles_to_destroy); i++)
	{
		instance_destroy(tiles_to_destroy[i]);
	}
	
	instance_create_layer(688, 224, "Instances", O_AutoGate);
	instance_create_layer(704, 224, "Instances", O_AutoGate);
	instance_create_layer(720, 224, "Instances", O_AutoGate);
	
	instance_destroy(self);
}
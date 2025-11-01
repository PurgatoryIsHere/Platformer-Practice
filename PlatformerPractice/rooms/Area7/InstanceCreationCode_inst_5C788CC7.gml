TriggerEvent = function()
{
	var gates = [instance_position(592, 160, AutomaticGateObject), instance_position(608, 160, AutomaticGateObject),
	instance_position(624, 160, AutomaticGateObject), instance_position(640, 160, AutomaticGateObject)];
	
	for(var i = 0; i < array_length(gates); i++)
	{
		instance_destroy(gates[i]);
	}
	
	instance_destroy(self);
}
TriggerEvent = function()
{
	var gates = [instance_position(2192, 1536, AutomaticGateObject), instance_position(2208, 1536, AutomaticGateObject),
	instance_position(2224, 1536, AutomaticGateObject), instance_position(2240, 1536, AutomaticGateObject)];
	
	for(var i = 0; i < array_length(gates); i++)
	{
		instance_destroy(gates[i]);
	}
	
	instance_destroy(self);
}
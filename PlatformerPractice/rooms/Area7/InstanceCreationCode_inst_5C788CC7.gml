TriggerEvent = function()
{
	var gates = [instance_position(592, 160, O_AutoGate), instance_position(608, 160, O_AutoGate),
	instance_position(624, 160, O_AutoGate), instance_position(640, 160, O_AutoGate)];
	
	for(var i = 0; i < array_length(gates); i++)
	{
		instance_destroy(gates[i]);
	}
	
	instance_destroy(self);
}
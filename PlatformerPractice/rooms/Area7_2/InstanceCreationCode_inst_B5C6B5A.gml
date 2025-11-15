TriggerEvent = function()
{
	gates = [instance_position(992, 656, O_AutoGate), instance_position(1008, 656, O_AutoGate),
    instance_position(1024, 656, O_AutoGate), instance_position(928, 640, O_AutoGate),
    instance_position(928, 624, O_AutoGate), instance_position(928, 608, O_AutoGate),
    instance_position(928, 592, O_AutoGate), instance_position(400, 592, O_AutoGate),
    instance_position(416, 576, O_AutoGate), instance_position(432, 560, O_AutoGate),
    instance_position(448, 544, O_AutoGate), instance_position(464, 528, O_AutoGate),
    instance_position(480, 512, O_AutoGate), instance_position(496, 496, O_AutoGate),
    instance_position(512, 480, O_AutoGate), instance_position(512, 336, O_AutoGate),
    instance_position(512, 320, O_AutoGate), instance_position(512, 304, O_AutoGate)];
	
	for(var i = 0; i < array_length(gates); i++)
	{
		instance_destroy(gates[i]);
	}
	
	instance_destroy(self);
}
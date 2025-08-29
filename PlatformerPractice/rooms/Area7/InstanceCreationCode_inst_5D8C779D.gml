TriggerEvent = function()
{
	gates = [instance_position(3056, 656, AutomaticGateObject), instance_position(3072, 656, AutomaticGateObject),
	instance_position(3088, 656, AutomaticGateObject), instance_position(2992, 640, AutomaticGateObject),
	instance_position(2992, 624, AutomaticGateObject), instance_position(2992, 608, AutomaticGateObject),
	instance_position(2992, 592, AutomaticGateObject), instance_position(2464, 592, AutomaticGateObject),
	instance_position(2480, 576, AutomaticGateObject), instance_position(2496, 560, AutomaticGateObject),
	instance_position(2512, 544, AutomaticGateObject), instance_position(2528, 528, AutomaticGateObject),
	instance_position(2544, 512, AutomaticGateObject), instance_position(2560, 496, AutomaticGateObject),
	instance_position(2576, 480, AutomaticGateObject), instance_position(2576, 336, AutomaticGateObject),
	instance_position(2576, 320, AutomaticGateObject), instance_position(2576, 304, AutomaticGateObject)];
	
	for(var i = 0; i < array_length(gates); i++)
	{
		instance_destroy(gates[i]);
	}
	
	instance_destroy(self);
}
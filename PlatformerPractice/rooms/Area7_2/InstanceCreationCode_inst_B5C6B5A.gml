TriggerEvent = function()
{
	gates = [instance_position(992, 656, AutomaticGateObject), instance_position(1008, 656, AutomaticGateObject),
    instance_position(1024, 656, AutomaticGateObject), instance_position(928, 640, AutomaticGateObject),
    instance_position(928, 624, AutomaticGateObject), instance_position(928, 608, AutomaticGateObject),
    instance_position(928, 592, AutomaticGateObject), instance_position(400, 592, AutomaticGateObject),
    instance_position(416, 576, AutomaticGateObject), instance_position(432, 560, AutomaticGateObject),
    instance_position(448, 544, AutomaticGateObject), instance_position(464, 528, AutomaticGateObject),
    instance_position(480, 512, AutomaticGateObject), instance_position(496, 496, AutomaticGateObject),
    instance_position(512, 480, AutomaticGateObject), instance_position(512, 336, AutomaticGateObject),
    instance_position(512, 320, AutomaticGateObject), instance_position(512, 304, AutomaticGateObject)];
	
	for(var i = 0; i < array_length(gates); i++)
	{
		instance_destroy(gates[i]);
	}
	
	instance_destroy(self);
}
TriggerEvent = function()
{
	if(!instance_place(448, 0, O_AutoGate) && !instance_place(464, 0, O_AutoGate) && !instance_place(480, 0, O_AutoGate))
	{
		instance_create_layer(448, 0, "Instances", O_AutoGate);
		instance_create_layer(464, 0, "Instances", O_AutoGate);
		instance_create_layer(480, 0, "Instances", O_AutoGate);
	}
	
	instance_destroy(self);
}
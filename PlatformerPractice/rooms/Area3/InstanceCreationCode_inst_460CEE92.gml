TriggerEvent = function()
{
	if(!instance_place(1424, 944, O_AutoGate) && !instance_place(1440, 944, O_AutoGate) && !instance_place(1456, 944, O_AutoGate))
	{
		instance_create_layer(1424, 944, "Instances", O_AutoGate);
		instance_create_layer(1440, 944, "Instances", O_AutoGate);
		instance_create_layer(1456, 944, "Instances", O_AutoGate);
	}
	
	instance_destroy(self);
}
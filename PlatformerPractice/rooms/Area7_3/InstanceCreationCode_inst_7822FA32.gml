TriggerEvent = function()
{
	inst = instance_position(864, 848, AutomaticGateObject)
	
	if(instance_exists(inst))
	{
		instance_destroy(inst)
	}
}
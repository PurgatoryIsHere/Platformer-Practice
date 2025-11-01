TriggerEvent = function()
{
	var cannon = instance_create_layer(3200, 1024, "Instances", CannonObject);
	cannon.depth = PlayerObject.depth - 1;
	cannon.target = instance_position(3216, 832, CannonTargetObject);
	
	instance_destroy(self);	
}
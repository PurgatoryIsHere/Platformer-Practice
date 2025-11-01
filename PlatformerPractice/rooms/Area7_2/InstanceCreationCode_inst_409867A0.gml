TriggerEvent = function()
{
	var cannon = instance_create_layer(1136, 1024, "Instances", CannonObject);
	cannon.depth = PlayerObject.depth - 1;
	cannon.target = instance_position(1152, 832, CannonTargetObject);
	
	instance_destroy(self);	
}
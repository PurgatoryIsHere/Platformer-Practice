TriggerEvent = function()
{
	var cannon = instance_create_layer(1136, 1024, "Instances", O_Cannon);
	cannon.depth = O_Player.depth - 1;
	cannon.target = instance_position(1184, 832, O_CannonTarget);
	
	instance_destroy(self);	
}
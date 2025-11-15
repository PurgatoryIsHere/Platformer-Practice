TriggerEvent = function()
{
	instance_create_layer(176, 208, "Instances", O_Shelf);
	instance_create_layer(224, 224, "Instances", O_Shelf);
	instance_create_layer(208, 304, "Instances", O_Shelf);
	instance_create_layer(176, 336, "Instances", O_Shelf);
	
	instance_destroy(self);
}
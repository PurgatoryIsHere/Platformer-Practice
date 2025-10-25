TriggerEvent = function()
{
	instance_create_layer(176, 208, "Instances", ShelfObject);
	instance_create_layer(224, 224, "Instances", ShelfObject);
	instance_create_layer(208, 304, "Instances", ShelfObject);
	instance_create_layer(176, 336, "Instances", ShelfObject);
	
	instance_destroy(self);
}
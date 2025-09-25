TriggerEvent = function()
{
	instance_create_layer(448, 144, "Instances", ShelfObject);
	instance_create_layer(448, 96, "Instances", ShelfObject);
	
	instance_destroy(self);
}
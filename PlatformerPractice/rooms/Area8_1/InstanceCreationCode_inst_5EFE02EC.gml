TriggerEvent = function()
{
	instance_create_layer(448, 144, "Instances", O_Shelf);
	instance_create_layer(448, 96, "Instances", O_Shelf);
	
	instance_destroy(self);
}
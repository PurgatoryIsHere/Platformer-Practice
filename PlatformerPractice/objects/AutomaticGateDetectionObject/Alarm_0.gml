/// @description Insert description here
// You can write your code in this editor
	
var loc_tag = tag;
	
with(object_index)
{
	if(loc_tag == tag)
	{
		instance_create_layer(x, y, "Instances", AutomaticGateObject);
		instance_destroy(self);
	}
}
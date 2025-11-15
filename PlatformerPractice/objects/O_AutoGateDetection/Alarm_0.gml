/// @description Close gate once triggered
// You can write your code in this editor
	
var loc_tag = tag;
	
with(object_index)
{
	if(loc_tag == tag)
	{
		instance_create_layer(x, y, "Instances", O_AutoGate);
		instance_destroy(self);
	}
}
/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x, y, PlayerObject) && !discovered)
{
	discovered = true;
	is_fading = true;
	
	with(object_index)
	{
		is_fading = true;
	}
}

if(is_fading)
{
	image_alpha = max(image_alpha - 0.05, 0);
	
	if (image_alpha <= 0) 
	{
		instance_destroy();
	}
}

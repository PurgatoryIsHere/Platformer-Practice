/// @description Vanish upon player contact
// You can write your code in this editor
if(place_meeting(x, y, O_Player) && !discovered)
{
	discovered = true;
	is_fading = true;
	
	var this_tag = tag;
	
	with(object_index)
	{
		if(tag == this_tag)
		{
			audio_play_sound(_670185__robinhood76__11342_breath_ghost_vanish, 1, false)
			is_fading = true;
		}
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

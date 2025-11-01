/// @description Insert description here
// You can write your code in this editor
// White-out the screen
if(fading_out) 
{
    fade_alpha += fade_speed;
	
    if (fade_alpha >= 1) 
	{
        fade_alpha = 1;
        fading_out = false;

        // Teleport
        player.x = other_side.x;
        player.y = other_side.y;
        activated = false;
        other_side.activated = false;
        alarm[0] = 180;

        fading_in = true;
    }
}

// Return screen to normal
if(fading_in) 
{
    fade_alpha -= fade_speed;
	
    if (fade_alpha <= 0) 
	{
        fade_alpha = 0;
        fading_in = false;
		
		PlayerObject.input_enabled = true;
		
		if(disappear)
		{
			alarm[1] = 30;
		}
    }
}

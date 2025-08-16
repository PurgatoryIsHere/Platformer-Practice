/// @description Warp mechanics
// You can write your code in this editor

var player = instance_place(x, y, PlayerObject);

if (player != noone && instance_exists(other_side) && activated && !fading_out && !fading_in) 
{
	fading_out = true;
	
	with(PlayerObject)
	{
		input_enabled = false;
		x_speed = 0;
		y_speed = 0;
	}
}

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




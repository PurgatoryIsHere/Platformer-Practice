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
		
		var dest = portal_data[? teleport_key];
		var dest_ex = dest[? "ex"];

		var dest_room = dest_ex[? "room"];
		var dest_x = dest_ex[? "x"];
		var dest_y = dest_ex[? "y"];

		global.teleport_x = dest_x;
		global.teleport_y = dest_y;
		global.screen_faded = true;
		room_goto(dest_room);

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
		
		global.screen_faded = false;
		
		O_Player.input_enabled = true;
    }
}

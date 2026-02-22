/// @description Fade out & Return to menu
// You can write your code in this editor

if(room != CreditsScreen)
{
	fade_alpha += fade_speed;
	
    if (fade_alpha >= 1) 
	{
        fade_alpha = 1;
        room_goto(CreditsScreen);
    }
}

else
{
	if(keyboard_check_pressed(vk_anykey) && return_to_menu)
	{
		room_goto(MainMenu);
	}
}
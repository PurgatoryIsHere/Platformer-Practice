/// @description Fade out
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
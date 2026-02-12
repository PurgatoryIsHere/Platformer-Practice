/// @description Fade alpha setting
// You can write your code in this editor

if(fading_out) 
{
    fade_alpha = clamp(fade_alpha + fade_speed, 0, 1);
	
	if(fade_alpha >= 1)
	{
		fading_out = false;
	}
}

else
{
	if(keyboard_check_pressed(ord("R")))
	{
		audio_stop_sound(_8Bit_Tragic_Mistake_Loop);
		global.lives = 3;
		global.respawn_queue = [];
		instance_activate_all();
		room_restart();
	}
	
	else if(keyboard_check_pressed(ord("Q")))
	{
		audio_stop_sound(_8Bit_Tragic_Mistake_Loop);
		global.lives = 3;
		global.respawn_queue = [];
		instance_activate_all();
		room_goto(MainMenu);
	}
}
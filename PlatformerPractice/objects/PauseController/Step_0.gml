/// @description Input Handling
// You can write your code in this editor

if(pause) 
{
    if(keyboard_check_pressed(ord("R"))) 
	{
		pause = false;
        instance_activate_all();

        if(surface_exists(pause_surf))
		{
            surface_free(pause_surf);
        }
		
		/*
		audio_stop_sound(pause_music);
		pause_music = noone;
		*/
		
		global.respawn_queue = [];
        room_restart();
    }
	
    if(keyboard_check_pressed(ord("Q"))) 
	{
		pause = false;
        instance_activate_all();

        if(surface_exists(pause_surf))
		{
            surface_free(pause_surf);
        }
		
		/*
		audio_stop_sound(pause_music);
		pause_music = noone;
		*/
		
		global.checkpoint_x = noone;
		global.checkpoint_y = noone;
		global.respawn_queue = [];
        room_goto(MainMenu);
    }
}

/// @description Surface Capturing
// You can write your code in this editor

if(pause) 
{
    if(surface_exists(pause_surf)) 
	{
        draw_surface(pause_surf, 0, 0);
    }
}

if(keyboard_check_pressed(vk_backspace)) 
{
    if(!pause) 
	{
        pause = true;
		current_room = room;
		
		/*
		if(BGMController.current_bgm != noone) 
		{
			audio_pause_sound(BGMController.current_bgm);
		}
		
		pause_music =  audio_play_sound(Sketchbook_2025_12_03_LOOP, 1, true);
		*/
		
        instance_deactivate_all(true);

        // Capture current screen
        if(surface_exists(pause_surf))
		{
			surface_free(pause_surf);
		}
		
        pause_surf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
        
        surface_set_target(pause_surf);
        draw_surface(application_surface, 0, 0);
        surface_reset_target();
    }
	
    else 
	{
        pause = false;
        instance_activate_all();
		
		/*
		audio_stop_sound(pause_music);
		pause_music = noone;
		
		audio_resume_sound(BGMController.current_bgm);
		*/
		
        if(surface_exists(pause_surf))
		{
            surface_free(pause_surf);
        }
    }
}
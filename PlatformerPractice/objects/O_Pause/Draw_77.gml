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

        if(surface_exists(pause_surf))
		{
            surface_free(pause_surf);
        }
    }
}
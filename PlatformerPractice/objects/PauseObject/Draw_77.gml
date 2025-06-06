/// @description Pause Functionality
// You can write your code in this editor
gpu_set_blendenable(false)

if global.gamePaused
{
	surface_set_target(application_surface)	
	if surface_exists(paused_surf)
	{
		draw_surface(paused_surf, 0, 0)	
	}
	else
	{
		paused_surf = surface_create(res_w, res_h)
		buffer_set_surface(pause_surf_buffer, paused_surf, 0)
	}
	
	surface_reset_target()
}


if keyboard_check_pressed(ord("P"))
{
	if !global.gamePaused
	{
		global.gamePaused = true
		instance_deactivate_all(true)
		show_debug_log(global.gamePaused)
		
		paused_surf = surface_create(res_w, res_h)
		surface_set_target(paused_surf)
		draw_surface(application_surface, 0, 0)
		surface_reset_target()
		
		if (buffer_exists(pause_surf_buffer)) buffer_delete(pause_surf_buffer);
		
		pause_surf_buffer = buffer_create(res_w * res_h * 4, buffer_fixed, 1)
		buffer_get_surface(pause_surf_buffer, paused_surf, 0)
	}
	else
	{
		global.gamePaused = false
		instance_activate_all()
		show_debug_log(global.gamePaused)
		
		if (surface_exists(paused_surf)) surface_free(paused_surf);
		if (buffer_exists(pause_surf_buffer)) buffer_delete(pause_surf_buffer);
	}
}

gpu_set_blendenable(true)
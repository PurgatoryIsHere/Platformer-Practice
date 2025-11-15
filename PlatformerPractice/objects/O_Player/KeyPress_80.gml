/// @description Pause Mechanics
// You can write your code in this editor
if (!paused) 
{
    // Starting pause
	
	// Save player postion and veloctity
	global.player_positionX = O_Player.x;
	global.player_positionY = O_Player.y;
	global.player_velocityX = O_Player.x_speed;
	global.player_velocityY = O_Player.y_speed;
	
    paused = true;
    instance_deactivate_all(true);
    
    // Create the pause surface
    paused_surf = surface_create(camera_width, camera_height);
    surface_set_target(paused_surf);
    draw_surface(application_surface, 0, 0);
    surface_reset_target();
} 

else 
{
    // Unpausing
    paused = false;
    instance_activate_all();
    
    // Clean up surface
    if (surface_exists(paused_surf))
	{
        surface_free(paused_surf);
    }
	
    paused_surf = -1;
	
	// Restore player position and velocity
	O_Player.x = global.player_positionX;
	O_Player.y = global.player_positionY;
	O_Player.x_speed = global.player_velocityX;
	O_Player.y_speed = global.player_velocityY;
}
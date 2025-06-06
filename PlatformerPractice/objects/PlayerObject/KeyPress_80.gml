/// @description Insert description here
// You can write your code in this editor
if (!paused) 
{
    // Starting pause
	
	// Save player postion and veloctity
	global.player_positionX = PlayerObject.x;
	global.player_positionY = PlayerObject.y;
	global.player_velocityX = PlayerObject.x_speed;
	global.player_velocityY = PlayerObject.y_speed;
	
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
	PlayerObject.x = global.player_positionX;
	PlayerObject.y = global.player_positionY;
	PlayerObject.x_speed = global.player_velocityX;
	PlayerObject.y_speed = global.player_velocityY;
}
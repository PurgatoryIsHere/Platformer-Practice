/// @description Insert description here
// You can write your code in this editor
if (!paused) {
    // Starting pause
    paused = true;
    instance_deactivate_all(true);
    
    // Create the pause surface
    paused_surf = surface_create(room_width, room_height);
    surface_set_target(paused_surf);
    draw_surface(application_surface, 0, 0);
    surface_reset_target();
} else {
    // Unpausing
    paused = false;
    instance_activate_all();
    
    // Clean up surface
    if (surface_exists(paused_surf)) {
        surface_free(paused_surf);
    }
    paused_surf = -1;
}
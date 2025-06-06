/// @description Free Surface
// You can write your code in this editor

if (surface_exists(paused_surf)) surface_free(paused_surf);
if (buffer_exists(pause_surf_buffer)) buffer_delete(pause_surf_buffer);
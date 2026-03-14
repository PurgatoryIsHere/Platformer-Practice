/// @description Set game to full-screen by default
// You can write your code in this editor

window_set_cursor(cr_none);

global.fullscreen = true;

window_enable_borderless_fullscreen(true);
window_set_fullscreen(true);
surface_resize(application_surface, display_get_gui_width(), display_get_gui_height());

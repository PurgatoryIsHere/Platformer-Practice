/// @description Initialize Health
// You can write your code in this editor

draw_set_font(global.default_font);
draw_set_halign(global.default_halign);
draw_set_valign(global.default_valign);

// Temporary Visualization, update once game is close to being done
draw_text(10, 10, "Lives: " + string(global.lives));
draw_text(10, 70, "Health: " + string(global.player_health));


if (paused && surface_exists(paused_surf)) {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    
    draw_surface_stretched(paused_surf, 0, 0, gui_w, gui_h);
    draw_set_alpha(0.5);
    draw_rectangle_colour(0, 0, gui_w, gui_h, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_text_transformed_colour(gui_w / 2, gui_h / 2, "PAUSED", 2, 2, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
    draw_set_halign(fa_left);
}
/// @description Diplay Health and Lives
// You can write your code in this editor

draw_set_font(global.default_font);
draw_set_halign(global.default_halign);
draw_set_valign(global.default_valign);

// Temporary Visualization, update once game is close to being done
draw_text(10, 10, "Lives: " + string(global.lives));
draw_text(10, 70, "Health: " + string(global.player_health));
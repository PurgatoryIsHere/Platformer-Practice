/// @description Diplay Health and Lives
// You can write your code in this editor

draw_set_font(global.default_font);
draw_set_halign(global.default_halign);
draw_set_valign(global.default_valign);

// Temporary Visualization, update once game is close to being done
// Draw the life icon
draw_sprite_ext(S_PlayerLives, 0, 25, 25, 2, 2, 0, c_white, 1);

// Draw text
draw_text_outline(50, 15, "x" + string(global.lives), 1.5, 1.5, c_white, c_black);
draw_text_outline(10, 50, "Health: " + string(global.player_health), 1, 1, c_white, c_black);
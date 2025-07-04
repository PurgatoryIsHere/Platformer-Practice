/// @description Draws text to be displayed on buttons
// You can write your code in this editor
draw_self();

draw_set_font(MainMenuFont);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y, button_text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
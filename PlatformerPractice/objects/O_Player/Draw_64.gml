/// @description Diplay Health and Lives
// You can write your code in this editor

draw_set_font(global.default_font);
draw_set_halign(global.default_halign);
draw_set_valign(global.default_valign);

if(global.lives >= 0)
{
	// Life counter
	draw_sprite_ext(S_PlayerLives, 0, 25, 25, 2, 2, 0, c_white, 1);
	draw_text_outline(50, 17.5, "x" + string(global.lives), 1.4, 1.4, c_white, c_black);

	// Health Display
	draw_sprite_ext(S_HealthRestore, 0, 10, 50, 2, 2, 0, c_white, 1);
	draw_text_outline(50, 52.5, string(global.player_health), 1.3, 1.3, c_white, c_black);
}
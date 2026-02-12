/// @description Game Over Screen Text
// You can write your code in this editor

if(fade_alpha > 0) 
{
    draw_set_alpha(fade_alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
	draw_set_color(c_white);
}

if(fade_alpha >= 1)
{
	if(!game_over_bgm_started)
	{
		audio_stop_all();
		audio_play_sound(_8Bit_Tragic_Mistake_Loop, 1, true);
		instance_deactivate_all(true);
		game_over_bgm_started = true;
	}
	
	draw_set_font(global.default_font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	draw_text_transformed_colour(display_get_gui_width() / 2, (display_get_gui_height() / 2) - 100, "GAME OVER", 3, 3, 0, c_red, c_red, c_red, c_red, 1);
	draw_text_transformed(display_get_gui_width() / 2, (display_get_gui_height() / 2) + 50, "Press R to Restart Level", 1.5, 1.5, 0);
	draw_text_transformed(display_get_gui_width() / 2, (display_get_gui_height() / 2) + 100, "Press Q to Return to Menu", 1.5, 1.5, 0);
}
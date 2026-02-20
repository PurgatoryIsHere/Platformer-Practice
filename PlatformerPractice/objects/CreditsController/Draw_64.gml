/// @description Credits Text
// You can write your code in this editor
if(room == CreditsScreen)
{
	draw_set_halign(fa_left);
	draw_set_colour(c_white);
	draw_set_font(MainMenuFont);

	draw_text_transformed(16, 50, "Credits", 1, 1, 0);

	draw_text_transformed(16, 150, game_title, 0.65, 0.65, 0);

	draw_text_transformed(16, 250, category1, 0.75, 0.75, 0);
	draw_text_transformed(16, 300, game_development, 0.65, 0.65, 0);

	draw_text_transformed(16, 400, category2, 0.75, 0.75, 0);
	draw_text_transformed(16, 450, musician1, 0.65, 0.65, 0);
	draw_text_transformed(16, 500, musician2, 0.65, 0.65, 0);
	draw_text_transformed(16, 550, musician3, 0.65, 0.65, 0);
	draw_text_transformed(16, 600, musician4, 0.65, 0.65, 0);
	draw_text_transformed(16, 650, musician5, 0.65, 0.65, 0);
}

else
{
	if(fade_alpha > 0) 
	{
		draw_set_alpha(fade_alpha);
		draw_set_color(c_black);
		draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
		draw_set_alpha(1);
	}
}


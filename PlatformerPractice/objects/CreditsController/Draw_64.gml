/// @description Credits Text
// You can write your code in this editor
if (room == CreditsScreen)
{
    draw_set_halign(fa_left);
    draw_set_colour(c_white);
    draw_set_font(MainMenuFont);

    var x_pos = 16;
    var y_pos = 40;

    var section_spacing = 40;
    var entry_spacing = 30;

    for (var i = 0; i < array_length(credits); i++)
    {
        var sec = credits[i];

        // Draw section title
        draw_text_transformed(x_pos, y_pos, sec.title, sec.scale, sec.scale, 0);
        y_pos += section_spacing;

        // Draw entries
        for (var j = 0; j < array_length(sec.entries); j++)
        {
            draw_text_transformed(x_pos + 12, y_pos, sec.entries[j], 0.65, 0.65, 0);
            y_pos += entry_spacing;
        }

        y_pos += 20;
    }
	
	if(return_to_menu)
	{
		draw_text_transformed(16, 745, "Press any key to return to the main menu...", 0.65, 0.65, 0);
	}
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


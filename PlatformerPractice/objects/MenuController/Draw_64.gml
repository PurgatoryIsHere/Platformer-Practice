/// @description Draw Submenus
// You can write your code in this editor

draw_set_font(MainMenuFont);

// -------------------------------
// SUBMENU 1 — Area Select Grid
// -------------------------------
if (sub_menu == 1)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    draw_set_colour(c_white);
    draw_text(gw * 0.5, gh * 0.2, menu[1][0]);

    var _start_x = gw * 0.5 - 200;
    var _start_y = gh * 0.4;
    var _gap_x = 200;
    var _gap_y = 100;

    for (var i = 1; i < array_length(menu[sub_menu]); i++)
    {
        var idx = i - 1;
        var col = idx % grid_cols;
        var row = idx div grid_cols;

        var xx = _start_x + col * _gap_x;
        var yy = _start_y + row * _gap_y;

        if (global.levelUnlocked[i - 1])
            draw_set_colour(c_white);
        else
            draw_set_colour(c_gray);

        if (i == index)
            draw_set_colour(c_teal);

        draw_text(xx, yy, menu[sub_menu][i]);
    }
}

// -------------------------------
// SUBMENU 2 — Controls / Rebinding
// -------------------------------
else if (sub_menu == 2)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    draw_set_colour(c_white);
    draw_text(gw * 0.5, gh * 0.2, menu[2][0]);

    var _start_y = gh * 0.35;
    var _gap_y = 50;

    for (var i = 1; i < array_length(menu[2]); i++)
    {
        var yy = _start_y + (i - 1) * _gap_y;

        draw_set_colour(i == index ? c_teal : c_white);
        draw_text(gw * 0.5, yy, menu[2][i]);
    }

    if (waiting_for_input)
    {
        draw_set_colour(c_white);
        draw_text_transformed(
            gw * 0.5,
            gh * 0.9,
            "Press a key to rebind...",
            0.8, 0.8, 0
        );
    }
	
	// "Clear save data {C}" text
	var margin = 16;
    draw_set_halign(fa_left);
    draw_text_outline(margin, display_get_gui_height() - 48, "Clear save data {C}", 0.5, 0.5, c_white, c_black);
}

// -------------------------------
// SUBMENU 3 — Another Area Grid
// -------------------------------
else if (sub_menu == 3)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    draw_set_colour(c_white);
    draw_text(gw * 0.5, gh * 0.2, menu[3][0]);

    var _start_x = gw * 0.5 - 200;
    var _start_y = gh * 0.4;
    var _gap_x = 200;
    var _gap_y = 100;

    for (var i = 1; i < array_length(menu[sub_menu]); i++)
    {
        var idx = i - 1;
        var col = idx % grid_cols;
        var row = idx div grid_cols;

        var xx = _start_x + col * _gap_x;
        var yy = _start_y + row * _gap_y;
		
		draw_set_colour(c_white);

        if (i == index)
		{
			 draw_set_colour(c_teal);
		}

        draw_text(xx, yy, menu[sub_menu][i]);
    }
}

// -------------------------------
// SUBMENU 4 — Clear save data prompt
// -------------------------------
else if (sub_menu == 4)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var cx = display_get_gui_width()  * 0.5;
    var cy = display_get_gui_height() * 0.5;

    draw_set_colour(c_white);
    draw_text(cx, cy - 80, menu[4][0]);   // Title

    var gap = 60;

    for (var i = 1; i < array_length(menu[4]); i++)
    {
        var yy = cy + (i - 1) * gap;

        draw_set_colour(i == index ? c_teal : c_white);
        draw_text(cx, yy, menu[4][i]);
    }
}
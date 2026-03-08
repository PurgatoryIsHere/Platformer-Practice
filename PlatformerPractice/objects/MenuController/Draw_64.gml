/// @description Draw Submenus
// You can write your code in this editor

draw_set_font(global.menu_options_font);

// -------------------------------
// SUBMENU 0 — Main Menu
// -------------------------------
if(sub_menu == 0)
{
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    // Title
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var title_x = gw * 0.5;
    var title_y = gh * 0.16;
	
	draw_set_font(global.title_font);

    // Title outline
    draw_set_color(c_black);
    draw_text(title_x + 2, title_y, "Mousebound");
    draw_text(title_x - 2, title_y, "Mousebound");
    draw_text(title_x, title_y + 2, "Mousebound");
    draw_text(title_x, title_y - 2, "Mousebound");

    // Title main text
    draw_set_color(c_white);
    draw_text(title_x, title_y, "Mousebound");

    // Panel
    var panel_w = 380;
    var panel_h = 260;
    var panel_x = gw * 0.5 - panel_w * 0.5;
    var panel_y = gh * 0.63 - panel_h * 0.5;

    // Panel background
    draw_set_alpha(0.65);
    draw_set_color(c_black);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);

    // Panel border
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(60, 60, 60));
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);


    // Menu Options
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
	
	draw_set_font(global.menu_options_font);

    var item_y = panel_y + 45;
    var gap = 45;

    for(var i = 0; i < array_length(menu[0]); i++)
	{
		var yy = item_y + i * gap;

		if (i == index)
		{
			// Pulse value
			var pulse = 0.25 + 0.10 * sin(current_time / 200);

			// Highlight bar with pulse
			draw_set_alpha(pulse);
			draw_set_color(make_color_rgb(255, 200, 80));
			draw_rectangle(gw*0.5 - 140, yy - 18, gw*0.5 + 140, yy + 18, false);

			// Reset alpha
			draw_set_alpha(1);
		}

		// Menu text
		draw_set_color(i == index ? make_color_rgb(255, 220, 120) : c_white);
		draw_text(gw * 0.5, yy, menu[0][i]);
	}
}


// -------------------------------
// SUBMENU 1 — Area Select Grid
// -------------------------------
if(sub_menu == 1)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
	
	// Panel
	var panel_w = 650;
	var panel_h = 420;
	var panel_x = gw * 0.5 - panel_w * 0.5;
	var panel_y = gh * 0.55 - panel_h * 0.5;

	// Background
	draw_set_alpha(0.65);
	draw_set_color(c_black);
	draw_rectangle(panel_x, panel_y + 25, panel_x + panel_w, panel_y + panel_h + 25, false);

	// Border
	draw_set_alpha(1);
	draw_set_color(make_color_rgb(60, 60, 60));
	draw_rectangle(panel_x, panel_y + 25, panel_x + panel_w, panel_y + panel_h + 25, true);


    // Title
	draw_set_font(global.title_font);
    draw_set_color(c_white);
    draw_text_outline(gw * 0.5, gh * 0.2, menu[1][0], 0.75, 0.75, c_white, c_black);
	
	draw_set_font(global.menu_options_font);
	
    // Grid layout
    var _start_x = gw * 0.5 - 200;
    var _start_y = gh * 0.4;
    var _gap_x = 200;
    var _gap_y = 100;

    for(var i = 1; i < array_length(menu[sub_menu]); i++)
    {
        var idx = i - 1;
        var col = idx % grid_cols;
        var row = idx div grid_cols;

        var xx = _start_x + col * _gap_x;
        var yy = _start_y + row * _gap_y;

        // Center the "Back to Main Menu" option
        if (i == 10)
        {
            xx = gw * 0.5;
			yy -= 15;
			draw_set_colour(c_white)
        }
		
		else
		{
			 // Locked/unlocked color
			 if(global.levelUnlocked[i - 1])
			 {
				 draw_set_colour(c_white);
			 }
			 
			 else
			 {
				 draw_set_colour(c_gray);
			 }
		}

        if(i == index)
		{
			// Pulse value
			var pulse = 0.25 + 0.10 * sin(current_time / 200);

			// Highlight bar with pulse
			draw_set_alpha(pulse);
			draw_set_color(make_color_rgb(255, 200, 80));
			draw_rectangle(xx - 110, yy - 18, xx + 110, yy + 18, false);

			// Reset alpha
			draw_set_alpha(1);

			// Selected text color
			draw_set_color(make_color_rgb(255, 220, 120));
		}

        draw_text(xx, yy, menu[sub_menu][i]);
    }
}

// -------------------------------
// SUBMENU 2 — Settings
// -------------------------------
else if(sub_menu == 2)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
    
    // PANEL
    var panel_w = 650;
    var panel_h = 420;
    var panel_x = gw * 0.5 - panel_w * 0.5;
    var panel_y = gh * 0.55 - panel_h * 0.5;

    // Background
    draw_set_alpha(0.65);
    draw_set_color(c_black);
    draw_rectangle(panel_x, panel_y + 25, panel_x + panel_w, panel_y + panel_h + 25, false);

    // Border
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(60, 60, 60));
    draw_rectangle(panel_x, panel_y + 25, panel_x + panel_w, panel_y + panel_h + 25, true);

    // Title
    draw_set_font(global.title_font);
    draw_set_color(c_white);
    draw_text_outline(gw * 0.5, gh * 0.2, menu[2][0], 0.75, 0.75, c_white, c_black);

    draw_set_font(global.menu_options_font);

    var _start_y = gh * 0.35;
    var _gap_y = 85;

    for(var i = 1; i < array_length(menu[2]); i++)
    {
        var yy = _start_y + (i - 1) * _gap_y;

        // Highlight pulse
        if(i == index)
        {
            var pulse = 0.25 + 0.10 * sin(current_time / 200);
            draw_set_alpha(pulse);
            draw_set_color(make_color_rgb(255, 200, 80));
			
			if(i == 2 || i == 3 ||i == 4)
			{
				draw_rectangle(gw * 0.5 - 250, yy - 40, gw * 0.5 + 250, yy + 25, false);
			}
			
			else if(i == 5)
			{
				draw_rectangle(gw * 0.5 - 250, yy - 40, gw * 0.5 + 250, yy, false);
			}
			
			else
			{
				draw_rectangle(gw * 0.5 - 250, yy - 20, gw * 0.5 + 250, yy + 20, false);
			}
            
            draw_set_alpha(1);
        }

        draw_set_color(i == index ? make_color_rgb(255, 220, 120) : c_white);
        
        // Display
        if(i == 1)
        {
            var mode_text = global.fullscreen ? "Fullscreen" : "Windowed";
            draw_text(gw * 0.5, yy, menu[2][1] + mode_text);
        }

        // Sliders
        else if(i == 2 || i == 3 || i == 4)
        {   
            // Label above slider
            draw_text(gw * 0.5, yy - 20, menu[2][i]);

            // Slider bar geometry
            var bar_w = 300;
            var bar_h = 8;
            var bar_x1 = gw * 0.5 - bar_w * 0.5;
            var bar_y1 = yy + 10;

            // Select Slider Value
            var val = 0;
			
            if(i == 2)
			{
				val = global.master_volume;
			}
			
			if(i == 3)
			{
				val = global.bgm_volume;
			}
			
			if(i == 4)
			{
				val = global.sfx_volume;
			}

            // Background bar
            draw_set_color(make_color_rgb(80, 80, 80));
            draw_rectangle(bar_x1, bar_y1, bar_x1 + bar_w, bar_y1 + bar_h, false);

            // Fill bar (gold)
            draw_set_color(make_color_rgb(255, 200, 80));
            draw_rectangle(bar_x1, bar_y1, bar_x1 + (bar_w * val), bar_y1 + bar_h, false);

            // Diamond knob
            var knob_x = bar_x1 + (bar_w * val);
            var knob_y = bar_y1 + bar_h * 0.5;

            draw_set_color(c_white);
            draw_primitive_begin(pr_trianglestrip);
            draw_vertex(knob_x, knob_y - 6);
            draw_vertex(knob_x + 6, knob_y);
            draw_vertex(knob_x, knob_y + 6);
            draw_vertex(knob_x - 6, knob_y);
            draw_primitive_end();
        }

        // Back
        else
        {
			yy -= 20;
            draw_text(gw * 0.5, yy, menu[2][i]);
        }
    }
}

// -------------------------------
// SUBMENU 3 — Controls / Rebinding
// -------------------------------
else if(sub_menu == 3)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
	
	// PANEL
	var panel_w = 650;
	var panel_h = 420;
	var panel_x = gw * 0.5 - panel_w * 0.5;
	var panel_y = gh * 0.55 - panel_h * 0.5;

	// Background
	draw_set_alpha(0.65);
	draw_set_color(c_black);
	draw_rectangle(panel_x, panel_y + 25, panel_x + panel_w, panel_y + panel_h + 25, false);

	// Border
	draw_set_alpha(1);
	draw_set_color(make_color_rgb(60, 60, 60));
	draw_rectangle(panel_x, panel_y + 25, panel_x + panel_w, panel_y + panel_h + 25, true);

    // Title
	draw_set_font(global.title_font);
    draw_set_color(c_white);
    draw_text_outline(gw * 0.5, gh * 0.2, menu[3][0], 0.75, 0.75, c_white, c_black);
	
	draw_set_font(global.menu_options_font);

    var _start_y = gh * 0.35;
    var _gap_y = 50;

    for (var i = 1; i < array_length(menu[3]); i++)
    {
        var yy = _start_y + (i - 1) * _gap_y;
		
		if (i == index)
		{
			// Pulse value
			var pulse = 0.25 + 0.10 * sin(current_time / 200);

			// Highlight bar with pulse
			draw_set_alpha(pulse);
			draw_set_color(make_color_rgb(255, 200, 80));
			draw_rectangle(gw * 0.5 - 250, yy - 18, gw * 0.5 + 250, yy + 18, false);

			// Reset alpha
			draw_set_alpha(1);
		}

        draw_set_color(i == index ? make_color_rgb(255, 220, 120) : c_white);
        draw_text(gw * 0.5, yy, menu[3][i]);
    }

    if (waiting_for_input)
    {
        draw_set_colour(c_white);
		draw_text_outline(gw * 0.5, gh * 0.9, "Press a key to rebind...", 0.8, 0.8, c_white, c_black);
    }
	
	// "Clear save data {C}" text
	var margin = 16;
    draw_set_halign(fa_left);
    draw_text_outline(margin, display_get_gui_height() - 48, "Clear save data {C}", 0.75, 0.75, c_white, c_black);
}

// -------------------------------
// SUBMENU 4 — Another Area Grid
// -------------------------------
else if(sub_menu == 4)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    draw_set_colour(c_white);
    draw_text(gw * 0.5, gh * 0.2, menu[4][0]);

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
			draw_set_color(make_color_rgb(255, 220, 120));
		}

        draw_text(xx, yy, menu[sub_menu][i]);
    }
}

// -------------------------------
// SUBMENU 5 — Clear save data prompt
// -------------------------------
else if(sub_menu == 5)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
	
	// PANEL
	var panel_w = 500;
	var panel_h = 300;
	var panel_x = gw * 0.5 - panel_w * 0.5;
	var panel_y = gh * 0.55 - panel_h * 0.5;

	// Background
	draw_set_alpha(0.65);
	draw_set_color(c_black);
	draw_rectangle(panel_x, panel_y - 25, panel_x + panel_w, panel_y + panel_h - 25, false);

	// Border
	draw_set_alpha(1);
	draw_set_color(make_color_rgb(60, 60, 60));
	draw_rectangle(panel_x, panel_y - 25, panel_x + panel_w, panel_y + panel_h - 25, true);

    draw_set_colour(c_white);
    draw_text(gw * 0.5, gh * 0.5 - 80, menu[5][0]);   // Title

    var gap = 60;

    for (var i = 1; i < array_length(menu[5]); i++)
    {
        var yy = gh * 0.5 + (i - 1) * gap;
		
		draw_set_color(i == index ? make_color_rgb(255, 220, 120) : c_white);
        draw_text(gw * 0.5, yy, menu[5][i]);
    }
}
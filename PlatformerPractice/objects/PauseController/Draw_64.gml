/// @description Pause Screen Text
// You can write your code in this editor

draw_set_font(global.default_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if(pause && surface_exists(pause_surf)) 
{
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    // Draw frozen screen
    draw_surface(pause_surf, 0, 0);

    // Dim overlay
    draw_set_alpha(0.5);
    draw_rectangle_colour(0, 0, gui_w, gui_h, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
	
	var collected_heart_pieces = 0;
	var heart_pieces_to_collect = 0;
	
	if(current_room == Area7_1 || current_room = Area7_2 || current_room = Area7_3)
	{
		collected_heart_pieces = string(global.heart_pieces_collected[7]);
		heart_pieces_to_collect = string(global.heart_pieces_to_collect[7]);
	}
	
	else if(current_room == AreaEX_1 || current_room = AreaEX_2 || current_room = Area8_3_1 || current_room = Area8_3_2 || current_room = Area8_3_3)
	{
		collected_heart_pieces = string(global.heart_pieces_collected[8]);
		heart_pieces_to_collect = string(global.heart_pieces_to_collect[8]);
	}
	
	else if(current_room < 9)
	{
		collected_heart_pieces = string(global.heart_pieces_collected[current_room]);
		heart_pieces_to_collect = string(global.heart_pieces_to_collect[current_room]);
	}
	
	else
	{
		collected_heart_pieces = string(0);
		heart_pieces_to_collect = string(0);
	}

    // Menu content
    var lines = [
        "PAUSED",
        "Heart pieces collected: " + collected_heart_pieces + "/" + heart_pieces_to_collect,
        "Press R to Restart",
        "Press Q to Return to Menu"
    ];

    var title_scale = 2;   // bigger for "PAUSED"
    var text_scale  = 1.5; // slightly larger than default
    var line_spacing = 50; // vertical spacing between lines

    // Calculate total block height
    var total_height = (title_scale * 16) + (array_length(lines) - 1) * line_spacing;
    var start_y = (gui_h / 2) - (total_height / 2);

    // Draw each line
    for(var i = 0; i < array_length(lines); i++) 
	{
        var y_pos = start_y + i * line_spacing;
		
        if(i == 0) 
		{
            // PAUSED
            draw_text_transformed_colour(gui_w / 2, y_pos, lines[i], title_scale, title_scale, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
        } 
		
		else 
		{
            // Other lines
            draw_text_transformed(gui_w / 2, y_pos, lines[i], text_scale, text_scale, 0);
        }
    }

    // Reset alignment
    draw_set_halign(global.default_halign);
    draw_set_valign(global.default_valign);
}



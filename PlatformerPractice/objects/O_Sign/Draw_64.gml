/// @description Insert description here
// You can write your code in this editor

if (show_text) {
    var box_x = display_get_gui_width() / 2;
    var box_y = display_get_gui_height() - 80;
    var padding = 12;
	var max_width = 1000;
    
    // Measure text
    draw_set_font(TutorialSignFont);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var txt_w = min(string_width_ext(text, -1, max_width), max_width);
    var txt_h = string_height_ext(text, -1, max_width);

    
    // Draw background box
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(
        box_x - txt_w / 2 - padding,
        box_y - txt_h / 2 - padding,
        box_x + txt_w / 2 + padding,
        box_y + txt_h / 2 + padding,
        false
    );
    
    // Draw text
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_text_ext(box_x, box_y, text, -1, max_width);
    
    // Reset alignment
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
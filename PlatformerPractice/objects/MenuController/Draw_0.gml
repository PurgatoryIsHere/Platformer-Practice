/// @description Draw submenu
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_font(MainMenuFont);

if(sub_menu == 1)
{
    // Draw "Which area?" title
    draw_set_colour(c_white);
    draw_text(room_width / 2, room_height * .2, menu[1][0]);
    
    // Draw area buttons in grid
    var _start_x = room_width / 2 - 200;  // Adjust spacing as needed
    var _start_y = room_height * .4;
    var _gap_x = 200;
    var _gap_y = 100;
    
    for(var i = 1; i < array_length(menu[sub_menu]); ++i) // Start from 1 to skip title
    {
        var _grid_index = i - 1; // Adjust for grid positioning (0-6)
        var _col = _grid_index % grid_cols;
        var _row = _grid_index div grid_cols;
        
        var _x = _start_x + _col * _gap_x;
        var _y = _start_y + _row * _gap_y;
        
        draw_set_colour(c_white);
        
        if(i == index)
        {
            draw_set_colour(c_teal);
        }
        
        draw_text(_x, _y, menu[sub_menu][i]);
    }
}
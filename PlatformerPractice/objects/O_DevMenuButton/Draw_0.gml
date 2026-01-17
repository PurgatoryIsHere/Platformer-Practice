 /// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (menu_index == MenuController.index)
{
    draw_set_color(c_white);
    draw_set_alpha(0.3);
    draw_rectangle(x - sprite_xoffset, y - sprite_yoffset, x + (sprite_width - sprite_xoffset), y + (sprite_height - sprite_yoffset), false);
    draw_set_alpha(1);
}
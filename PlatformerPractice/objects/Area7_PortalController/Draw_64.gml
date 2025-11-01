/// @description Screen white-out effect
// You can write your code in this editor
if (fade_alpha > 0) 
{
    draw_set_alpha(fade_alpha);
    draw_set_color(c_white);
    draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
    draw_set_alpha(1);
}

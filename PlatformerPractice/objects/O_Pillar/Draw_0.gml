/// @description Visualization of collapsing tiles
// You can write your code in this editor
if (shake_time > 0)
{
    var shake_x = x + random_range(-shake_magnitude, shake_magnitude);
    var shake_y = y + random_range(-shake_magnitude, shake_magnitude);
    draw_sprite(sprite_index, image_index, shake_x, shake_y);
}

else
{
    draw_self();
}
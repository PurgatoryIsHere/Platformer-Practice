/// @description 
// You can write your code in this editor
draw_self()

//Draw dotted ine to grapple point if valid grapple
if (target_in_range && global.grappleUnlock) {
    var line_segments = 20; // Number of dots
    var segment_length = point_distance(x, y, target_x, target_y) / line_segments;
    var line_direction = point_direction(x, y, target_x, target_y);
    
    // Draw dots along the line
    for (var i = 1; i < line_segments; i++) {
        var dot_x = x + lengthdir_x(segment_length * i, line_direction);
        var dot_y = y + lengthdir_y(segment_length * i, line_direction);
        
        // Only draw every other dot for dotted effect
        if (i % 2 == 0) {
            draw_circle(dot_x, dot_y, 2, false);
        }
    }
}

if (paused && surface_exists(paused_surf)) {
    draw_surface(paused_surf, 0, 0);
    draw_set_alpha(0.5);
    draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_text_transformed_colour(room_width / 2, room_height / 2, "PAUSED", 2, 2, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
    draw_set_halign(fa_left);
}
/// @description Insert description here
// You can write your code in this editor
draw_self()

//Draw dotted ine to grapple point if valid grapple
if (target_in_range) {
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
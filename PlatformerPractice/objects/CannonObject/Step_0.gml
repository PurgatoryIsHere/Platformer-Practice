/// @description Launch player
// You can write your code in this editor

//if PlayerObject touches cannon and we haven't fired yet
if target != noone && place_meeting(x, y, PlayerObject) && !fired
{
    //lock player to cannon position and stop all movement
    with (PlayerObject) {
        x = other.x;
        y = other.y;
        x_speed = 0;
        y_speed = 0;
        gravity = 0; // disable gravity while in cannon
    }
    
    player_loaded = true;
    
    //turn cannon towards target
    var target_angle = point_direction(x, y, target.x, target.y); 
    var angle_diff = angle_difference(target_angle, image_angle);
    var rotation_speed = 2;
    
    if (abs(angle_diff) > rotation_speed) {
        image_angle += sign(angle_diff) * rotation_speed;
    }
    else {
        //snap to target angle and fire
        image_angle = target_angle;

        
        //cannon is aimed, now launch PlayerObject
        var launch_speed = 12;
        // Add 90 degrees to compensate for sprite orientation
        var launch_x = lengthdir_x(launch_speed, image_angle);
		var launch_y = lengthdir_y(launch_speed, image_angle);
        
        with (PlayerObject) {
            x_speed = launch_x;
            y_speed = launch_y;
            gravity = 0.3; // restore original gravity value
            
            // Force player slightly away from cannon to avoid getting stuck
            x += sign(launch_x) * 2;
            y += sign(launch_y) * 2;
        }
        
        fired = true;
        player_loaded = false;
    }
}

//reset when player is no longer touching cannon
if !place_meeting(x, y, PlayerObject) {
    fired = false;
    player_loaded = false;
}
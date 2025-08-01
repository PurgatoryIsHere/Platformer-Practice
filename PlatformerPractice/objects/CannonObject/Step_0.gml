/// @description Launch player
// You can write your code in this editor

//if PlayerObject touches cannon and we haven't fired yet
if (!instance_exists(target))
{
    solid = true    
}
else if target != noone && place_meeting(x, y, PlayerObject) && !fired
{
    //lock player to cannon position and stop all movement
    with (PlayerObject) {
        x = other.x;
        y = other.y;
        PlayerObject.x_speed = 0;
        PlayerObject.y_speed = 0;
        gravity = 0; // disable gravity while in cannon
    }

    player_loaded = true;

    //turn cannon towards target
    var target_angle = point_direction(x, y, target.x, target.y); 
    var angle_diff = angle_difference(target_angle, image_angle);

    if (abs(angle_diff) > rotation_speed) {
        image_angle += sign(angle_diff) * rotation_speed;
    }
    else {
		image_angle = target_angle;
    
		// Calculate smooth offset based on height difference
		var height_difference = target.y - y;
		var distance_to_target = point_distance(x, y, target.x, target.y);
    
		// Create a smooth offset that scales with both height and distance
		var target_offset_y = 0;
    
		if (height_difference != 0) {
			// Scale the offset based on height difference and distance
			var height_ratio = height_difference / distance_to_target;
			target_offset_y = height_ratio * -160; // Adjust this multiplier as needed
		}
    
		var adjusted_target_y = target.y + target_offset_y;
		var direct_angle = point_direction(x, y, target.x, adjusted_target_y);
    
		PlayerObject.flight_target_x = target.x;
		PlayerObject.flight_target_y = target.y;
		PlayerObject.flight_distance = point_distance(x, y, target.x, target.y);
		PlayerObject.flight_traveled = 0;
    
		var flight_speed = 7;
		launch_x = lengthdir_x(flight_speed, direct_angle);
		launch_y = lengthdir_y(flight_speed, direct_angle);
    
		show_debug_message("Height diff: " + string(height_difference) + " Smooth offset: " + string(target_offset_y));
    
		PlayerObject.beingFired = true;
		fired = true;
		player_loaded = false;
	}
}

if (fired && PlayerObject.beingFired) {
    // Keep the player moving at consistent speed
    PlayerObject.x_speed = launch_x;
    PlayerObject.y_speed = launch_y;
}
//reset when player is no longer touching cannon
if !place_meeting(x, y, PlayerObject) {
    fired = false;
    player_loaded = false;

    var angle_diff = angle_difference(0, image_angle);

    if (abs(angle_diff) > rotation_speed)
    {
         image_angle += sign(angle_diff) * rotation_speed;
    }
}
//make sure Player stops moving once they hit the ground
if (PlayerObject.onGround)
{
    PlayerObject.beingFired = false;
    PlayerObject.x_speed = 0;
}
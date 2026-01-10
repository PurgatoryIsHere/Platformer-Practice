 /// @description Launch player
// You can write your code in this editor

//if PlayerObject touches cannon and we haven't fired yet
if (!instance_exists(target))
{
    solid = true    
}
else if (target != noone && place_meeting(x, y, O_Player) && !fired)
{
    //lock player to cannon position and stop all movement
    with (O_Player) 
	{
        x = other.x;
        y = other.y;
        O_Player.x_speed = 0; 
        O_Player.y_speed = 0;
		
		state = stateCannonball;
		sprite_index = S_PlayerDashing;
		image_xscale = facing / 2;
		
		i_frame_timer = 60;
		O_Player.input_enabled = false;
        gravity = 0; // disable gravity while in cannon
    }
	
	O_Player.depth = depth + 1;
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
    
		var direct_angle = point_direction(x, y, target.x, target.y);
    
		O_Player.flight_target_x = target.x;
		O_Player.flight_target_y = target.y;
		O_Player.flight_distance = point_distance(x, y, target.x, target.y);
		O_Player.flight_traveled = 0;
    
		var flight_speed = 7;
		launch_x = lengthdir_x(flight_speed, direct_angle);
		launch_y = lengthdir_y(flight_speed, direct_angle);
    
		show_debug_message("Height diff: " + string(height_difference) + " Smooth offset: " + string(target_offset_y));
    
		O_Player.beingFired = true; 
		fired = true;
		player_loaded = false;
		
		O_Player.x_speed = launch_x;
		O_Player.y_speed = launch_y;
	}
}

//reset when player is no longer touching cannon
if !place_meeting(x, y, O_Player) {
    fired = false;
    player_loaded = false;

    var angle_diff = angle_difference(0, image_angle);

    if (abs(angle_diff) > rotation_speed)
    {
         image_angle += sign(angle_diff) * rotation_speed;
    }
}

var x1 = O_Player.x - O_Player.sprite_width * 0.6;
var y1 = O_Player.y - O_Player.sprite_height * 0.6;
var x2 = O_Player.x + O_Player.sprite_width * 0.6;
var y2 = O_Player.y + O_Player.sprite_height * 0.6;

//make sure Player stops moving once they hit the ground
if (O_Player.beingFired && collision_rectangle(x1, y1, x2, y2, O_Ground, false, true))
{
    with(O_Player)
	{
		beingFired = false;
		dashing = false;
		groundPounding = false;
		grappling = false;
		input_enabled = true;
		state = stateFree;
	}
}
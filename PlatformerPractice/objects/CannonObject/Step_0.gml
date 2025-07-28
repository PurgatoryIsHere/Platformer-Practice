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
        //snap to target angle and fire
        image_angle = target_angle;
      
        // Add 90 degrees to compensate for sprite orientation
		PlayerObject.beingFired = true;
        fired = true;
        player_loaded = false;
		
		launch_x = lengthdir_x(launch_speed, image_angle);
		launch_y = lengthdir_y(launch_speed, image_angle);
	}
}

if (point_distance(PlayerObject.x, PlayerObject.y, target.x, target.y) > 2  && fired)
{
	PlayerObject.hspeed = launch_x;
	PlayerObject.y_speed = launch_y;
}

//reset when player is no longer touching cannon
if !place_meeting(x, y, PlayerObject) {
    fired = false;
    player_loaded = false;
	
	var angle_diff = angle_difference(0, image_angle);
	
	if (abs(angle_diff) > rotation_speed)
	{
		 image_angle +=	sign(angle_diff) * rotation_speed;
	}
}

//make sure Player stops moving once they hit the ground
if (PlayerObject.onGround)
{
	PlayerObject.beingFired = false;
	PlayerObject.hspeed = 0;
}
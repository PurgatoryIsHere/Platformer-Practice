/// @description All Player Actions
// You can write your code in this editor

// Camera Stuff
var cam_x = x - (camera_get_view_width(view_camera[0]) / 2)
var cam_y = camera_get_view_y(view_camera[0])

camera_set_view_pos(view_camera[0], cam_x, cam_y)


// Player Functionality

y_speed += 0.2 // Gravity
x_speed = 0 // Stationary Speed

dir = keyboard_check(ord("D")) - keyboard_check(ord("A")) // Direction the player is facing

onGround = place_meeting(x, y + 1, GroundObject);
onWall = place_meeting(x - 0.075, y, GroundObject) - place_meeting(x + 0.075, y, GroundObject)
var holdingLeft = keyboard_check(ord("A"))
var holdingRight = keyboard_check(ord("D"))

dash_timer = max(dash_timer - 1, 0)
movement_locked_timer = max(movement_locked_timer - 1, 0)
wall_jump_timer = max(wall_jump_timer - 1, 0)
i_frame_timer = max(i_frame_timer - 1, 0)

if(movement_locked_timer <= 0)
{
	// Movement
	x_speed = dir * 2
	
	// Jumping
	if(keyboard_check_pressed(ord("W")) && jump_current > 0)
	{
		if(onWall != 0)
		{
			movement_locked_timer = 10
			wall_jump_timer = 5
		}
	
		else if (global.doubleJumpUnlock)
		{
			y_speed = -2.5
			jump_current--
			canDash = true
		}
		else
		{
			y_speed = -2.5
			jump_current = 0
			canDash = true
		}
	}
	
	if(place_meeting(x, y + y_speed, GroundObject))
	{
		while(!place_meeting(x, y + sign(y_speed), GroundObject))
		{
			y += sign(y_speed)
		}
 
		if(y_speed > 0)
		{
			jump_current = jump_number
		}
 
		y_speed = 0
	}

	y += y_speed
}

// "Grapple"
// Find closest target object within range
var detection_range = 100; // Adjust as needed
var closest_target = instance_nearest(x, y, GrappleObject)

// Check if target is in range
if (closest_target != noone) 
{
    var target_distance = point_distance(x, y, closest_target.x, closest_target.y)
    
    // Check if target is in range
    if (target_distance <= detection_range)
	{
        target_in_range = true
        target_x = closest_target.x
        target_y = closest_target.y
    } 
	
	else
	{
        target_in_range = false
    }
}

else 
{
    // No target exists
    target_in_range = false
}


if (grapple_cooldown > 0) 
{
    grapple_cooldown--
}

// Handle grappling movement
if (grappling) 
{
    var dir_to_target = point_direction(x, y, target_x, target_y)
    var dist_to_target = point_distance(x, y, target_x, target_y)
    
    if (dist_to_target > grapple_speed)
	{
        // Move toward target
        x_speed = lengthdir_x(grapple_speed, dir_to_target)
        y_speed = lengthdir_y(grapple_speed, dir_to_target)
    } 
	
	else
	{
        // Reached target
        x = target_x
        y = target_y
        grappling = false
		y_speed = -2.5
    }
}

// Dashing and Grappling
if (target_in_range && keyboard_check_pressed(vk_space) && !grappling && grapple_cooldown == 0 && global.grappleUnlock)
{
    grappling = true
	grapple_cooldown = 20
}
else if(keyboard_check_pressed(vk_space) && onGround && (dir != 0))	
{
	dash_timer = 10
	dash_speed = 5
	dashing = true
	ground_dash = true
	
	i_frame_timer = 32
}
else if(keyboard_check_pressed(vk_space) && canDash && !onGround)
{
	canDash = false
    dash_timer = 10 // Number of frames for the dash
    dash_speed = 5
	dashing = true
}

// Animation for dash (frame-by-frame)
if (dash_timer > 0) 
{
	var new_x = dir * dash_speed
	
	if(ground_dash)
	{
		move_and_collide(new_x, 0, GroundObject)
	
	}
    else
	{
		move_and_collide(new_x, -1.5, GroundObject)
	}
	
	// Dash visualization
	with(instance_create_depth(x, y, depth + 1, TrailObject))
	{
		sprite_index = other.sprite_index
		image_blend = c_fuchsia
		image_alpha = 0.7
	}
}
else
{
	dashing = false
	ground_dash = false
}


// Wall Jumping
if(onWall != 0 && (holdingLeft || holdingRight))
{
	image_xscale = onWall
	y_speed = 0.25
	jump_current = jump_number
}

// Wall Jumping Animation (frame-by-frame)
if(wall_jump_timer > 0)
{
	y_speed = -3
    x_speed = onWall * 6
}

move_and_collide(x_speed, y_speed, GroundObject)

// Ground Pound
if (!onGround && keyboard_check_pressed(ord("S")) && global.groundPoundUnlock)
{
	x_speed = 0
	y_speed = 5
	groundPounding = true
	
	with(instance_create_depth(x, y, depth + 1, TrailObject))
	{
		sprite_index = other.sprite_index
		image_blend = c_fuchsia
		image_alpha = 0.7
	}

}

if (onGround && groundPounding)
{
	//Make sure player stops ground pounding after hitting the ground
	groundPounding = false	
}

// Invicibility Frames Visualization
if(i_frame_timer > 0)
{
	image_alpha = 0.5 + 0.5 * sin(i_frame_timer * 0.5);
}
else
{
	image_alpha = 1	
}

// Collision Events

// Ground Enemy
if(place_meeting(x, y, GroundEnemyObject))
{
	if(i_frame_timer == 0)
	{
		TakeDamage(5);
		i_frame_timer = 32
	}
	
	if(global.player_health == 0)
	{
		LifeReduction();
	}
}
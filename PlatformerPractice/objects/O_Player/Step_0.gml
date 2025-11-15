/// @description Player Actions
// You can write your code in this editor

// Ensure camera remains centered on player
var cam_x = x - (camera_get_view_width(view_camera[0]) / 2)
var cam_y = camera_get_view_y(view_camera[0])

camera_set_view_pos(view_camera[0], cam_x, cam_y)

if (!beingFired) 
{
	y_speed += 0.2 // Gravity
}

if(input_enabled)
{
	// Player Functionality

	dir = keyboard_check(ord("D")) - keyboard_check(ord("A")) // Direction the player is facing

	onGround = place_meeting(x, y + sprite_height, O_Ground) || place_meeting(x, y + y_speed, O_Shelf);
	onWall = place_meeting(x - 1.5, y, O_Ground) - place_meeting(x + 1.5, y, O_Ground)

	if(onWall == 1)
	{
		wall_jump_x_speed = 8;
	}
	
	else if(onWall == -1)
	{
		wall_jump_x_speed = -8;
	}

	else if(onWall == 0)
	{
		last_wall = 0;
	}

	var holdingLeft = keyboard_check(ord("A"))
	var holdingRight = keyboard_check(ord("D"))

	// Reduce timers and/or cooldowns, frame-by-frame
	dash_timer = max(dash_timer - 1, 0)
	wall_jump_timer = max(wall_jump_timer - 1, 0)
	i_frame_timer = max(i_frame_timer - 1, 0)

	grapple_cooldown = max(grapple_cooldown - 1, 0)
	dash_cooldown = max(dash_cooldown - 1, 0)


	if(!beingFired) 
	{
		x_speed = dir * 2
	}
	
	// Jumping
	if(keyboard_check_pressed(ord("W")) && jump_counter < 2)
	{
		if(onWall != 0 && !onGround)
		{
			if(onWall != 0 && last_wall != onWall)
			{
				wall_jump_timer = 0;
				wall_jump_timer = 5;
				last_wall = onWall;
			}
		
			if(wall_jump_timer == 5)
			{
				y_speed = -2.8;
			}
		}
	
		else if (global.doubleJumpUnlock)
		{
			y_speed = -2.5
			jump_counter += 1
			canDash = true
		}
		
		else
		{
			y_speed = -2.5
			jump_counter = 2
			canDash = true
		}
	}
	
	if(place_meeting(x, y + y_speed, O_Ground) || place_meeting(x, y + y_speed, O_Shelf))
	{
		// Check if we're colliding with a jumpthrough platform
		var jumpthrough = instance_place(x, y + y_speed, O_Shelf);
    
		if (jumpthrough != noone)
		{
			// Only collide if player is above the platform and falling down
			if (y < jumpthrough.y && y_speed > 0 && !groundPounding)
			{
				// Normal collision - land on top
				while(!place_meeting(x, y + sign(y_speed), O_Shelf))
				{
					y += sign(y_speed)
					vspeed = 0
				}
			
				jump_counter = 0
				y_speed = 0
				wall_jump_timer = 0;
				last_wall = 0;
			}
		
			// If player is below or jumping up, don't collide - let them pass through
		}
	
		else
		{
			// Normal ground collision for regular GroundObjects
			while(!place_meeting(x, y + sign(y_speed), O_Ground))
			{
				y += sign(y_speed)
			}
        
			if(y_speed > 0)
			{
				jump_counter = 0
			}
        
			y_speed = 0
			wall_jump_timer = 0;
			last_wall = 0;
		}
	}

	y += y_speed


	// Handle movement for dashing
	if (dash_timer > 0) 
	{
		var new_x = dir * dash_speed
	
		if(ground_dash)
		{
			move_and_collide(new_x, 0, O_Ground)
	
		}
	
		else
		{
			move_and_collide(new_x, -1.5, O_Ground)
		}
	
		// Dash visualization
		with(instance_create_depth(x, y, depth + 1, O_Trail))
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
	if(onWall != 0 && !onGround && !groundPounding)
	{
		y_speed = min(y_speed, 0.25);
		jump_counter = 0;
	}

	// Handle movement for wall-jumping
	if (!beingFired)
	{
		if(wall_jump_timer > 0)
		{	
			x_speed = wall_jump_x_speed;
		}
		
		else
		{
			x_speed = dir * 2;
		}
	}


	// Grappling

	// Find closest target object within range
	var detection_range = 100; // Adjust as needed
	var closest_target = instance_nearest(x, y, O_GrapplePoint)

	// Check if target is in range
	if (closest_target != noone) 
	{
		var target_distance = point_distance(x, y, closest_target.x, closest_target.y)
	
		var collision_list = ds_list_create();
		var collisions = collision_line_list(x, y, closest_target.x, closest_target.y, all, false, true, collision_list, false);
    
		var line_blocked = false;
		for (var i = 0; i < collisions; i++) 
		{
			var obj = collision_list[| i];
			// Only count it as blocking if it's not the player or the target
			if (obj != self && obj != closest_target) 
			{
				line_blocked = true;
				break;
			}
		}
    
		ds_list_destroy(collision_list);
	
		// Check if target is in range
		if (target_distance <= detection_range && !line_blocked)
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


	// Handle movement for grappling
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


	// Ground Pound
	if(!onGround && keyboard_check_pressed(ord("S")) && global.groundPoundUnlock)
	{
		x_speed = 0
		y_speed = 5
		groundPounding = true
	
		with(instance_create_depth(x, y, depth + 1, O_Trail))
		{
			sprite_index = other.sprite_index
			image_blend = c_fuchsia
			image_alpha = 0.7
		}
	}

	if(onGround && groundPounding)
	{
		//Make sure player stops ground pounding after hitting the ground
		groundPounding = false	
	}

	// Visualization for Invicibility Frames
	if(i_frame_timer > 0)
	{
		image_alpha = 0.5 + 0.5 * sin(i_frame_timer * 0.5);
	}

	else
	{
		image_alpha = 1	
	}

	// Handle direct flight to target
	if (beingFired)
	{
		// Calculate how far we've traveled this frame
		var frame_distance = sqrt(x_speed * x_speed + y_speed * y_speed);
		flight_traveled += frame_distance;
    
		// Check if we've reached the target distance
		if (flight_traveled >= flight_distance) 
		{
			// We've reached the target, turn gravity back on
			beingFired = false;
			show_debug_message("Reached target distance, enabling gravity");
        
			// Optional: Give a small downward boost when gravity kicks in
			y_speed = 1;
		}
    
		// Also stop if we hit something during flight
		if (place_meeting(x + sign(x_speed), y, O_Ground) || 
			place_meeting(x, y + sign(y_speed), O_Ground))
		{
			beingFired = false;
			show_debug_message("Hit obstacle during flight");
		}
	}
}

// Handle standard movement
move_and_collide(x_speed, y_speed, O_Ground)
 
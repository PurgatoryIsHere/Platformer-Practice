/// @description Initializtion
// You can write your code in this editor

// --------------------------------------------
// Camera
// --------------------------------------------
camera_width = camera_get_view_width(view_camera[0])
camera_height = camera_get_view_height(view_camera[0])

// --------------------------------------------
// Core Movement Variables
// --------------------------------------------
x_speed = 0;
y_speed = 0;
dir = 0;
input_enabled = true;

movement_speed = 2;
max_falling_speed = 6;

facing = 1;
state_locked = false;

// --------------------------------------------
// Jumping
// --------------------------------------------
jump_counter = 0;
max_jumps = 2;
on_ground = false;

// --------------------------------------------
// Dash
// --------------------------------------------
dashing = false;
dash_timer = 0;
dash_speed = 5;
dash_cooldown = 0;
ground_dashing = false;

// --------------------------------------------
// Wall-Jumping
// --------------------------------------------
wall_sliding = false;
on_wall = 0;
wall_slide_speed = 0.25;
movement_lock_timer = 0;

// --------------------------------------------
// Ground Pounding
// --------------------------------------------
groundPounding = false;
ground_pound_speed = 10;

// --------------------------------------------
// Grappling
// --------------------------------------------
grappling = false;
grapple_speed = 10;
grapple_cooldown = 0;

target_in_range = false;
target_x = 0;
target_y = 0;

// --------------------------------------------
// Cannon-Related
// --------------------------------------------
beingFired = false
flight_target_x = 0;
flight_target_y = 0;
flight_distance = 0;
flight_traveled = 0;

// --------------------------------------------
// Damage & Life System
// --------------------------------------------
i_frame_timer = 0;

TakeDamage = function(damage)
{
	global.player_health -= damage;
	
	if(global.player_health <= 0)
	{
		LifeReduction();
	}
}

LifeReduction = function()
{
	global.lives -= 1;
		
	if(global.lives == 0)
	{
		room = MainMenu;
		global.lives = 3;
		global.player_health = global.player_max_health;
	}
		
	else
	{
		if (file_exists("checkpoint.ini"))
		{
			ini_open("checkpoint.ini");
			x = ini_read_real("player", "x", x);
			y = ini_read_real("player", "y", y);
			ini_close();
		}
		
		global.player_health = global.player_max_health;
	}
}

// --------------------------------------------
// States
// --------------------------------------------
stateFree = function()
{
	if(movement_lock_timer <= 0)
	{
		// Horizontal Movement
		x_speed = dir * movement_speed;
	
	
		// Jumping
		if(keyboard_check_pressed(global.jump_key) && jump_counter < max_jumps)
		{
			sprite_index = S_PlayerJump;
			image_xscale = facing / 2;
		
			if(on_wall != 0 && wall_sliding)
			{
				x_speed = on_wall * 4;
				y_speed = -7;
				movement_lock_timer = 10;
			}
		
			if(global.doubleJumpUnlock)
			{
				y_speed = -3.5;
				jump_counter += 1;
			}
		
			else
			{
				y_speed -= 3.5;
				jump_counter = max_jumps;
			}
		
			dash_cooldown = 0;
		}
	
		if(on_wall != 0 && !on_ground)
		{
			wall_sliding = true;
			facing = on_wall;
			jump_counter = 1;
			
			sprite_index = S_PlayerOnWallLeft;
			image_xscale = facing / 2;
		}
	
		else 
		{ 
			wall_sliding = false;
		}
	
		// State Changes
		if(dashing)
		{
			state = stateDash;
		}
		
		
		if(groundPounding)
		{
			state = stateGroundPound;
		}
		
		if(grappling)
		{
			state = stateGrapple;
		}
	}
}

stateDash = function()
{
	sprite_index = S_PlayerDash;
	image_xscale = facing / 2;
	
	if(on_ground && dir != 0)
	{
		ground_dashing = true;
	}
		
	else if(!on_ground)
	{
		ground_dashing = false;
	}
	
	// Handling for dash movement
	if (dash_timer > 0) 
	{
		var new_x = dir * dash_speed;
	
		if(ground_dashing)
		{
			move_and_collide(new_x, -1.5, O_Ground);
		}
	
		else
		{
			move_and_collide(new_x, -1.5, O_Ground);
		}
	
		// Dash visualization
		with(instance_create_depth(x, y, depth + 1, O_Trail))
		{
			sprite_index = S_PlayerDashing
			image_blend = c_fuchsia
			image_alpha = 0.7
		}
	}

	else
	{
		dashing = false
		ground_dashing = false
		state = stateFree;
	}
}

stateGroundPound = function()
{	
	if(keyboard_check_pressed(global.jump_key))
	{
		groundPounding = false;
		y_speed = -3.5;
		jump_counter = max_jumps;
		state = stateFree;
		exit;
	}
	
	if(!on_ground)
	{	
		sprite_index = S_PlayerGroundPound;
		image_xscale = facing / 2;
		
		x_speed = 0;
		y_speed = ground_pound_speed;
		
		with(instance_create_depth(x, y, depth + 1, O_Trail))
		{
			sprite_index = S_PlayerGroundPoundFall;
			image_xscale = other.facing;
			image_blend = c_fuchsia;
			image_alpha = 0.7;
		}
	}
	
	else
	{
		groundPounding = false;
		state = stateFree;
	}
}

stateGrapple = function()
{
	sprite_index = S_PlayerGrapple
	image_xscale = facing / 2;
	
	var dir_to_target = point_direction(x, y, target_x, target_y)
	var dist_to_target = point_distance(x, y, target_x, target_y)
    
	if (dist_to_target > grapple_speed)
	{
		// Move toward target
		x_speed = lengthdir_x(grapple_speed, dir_to_target)
		y_speed = lengthdir_y(grapple_speed, dir_to_target)
			
		sprite_index = S_PlayerGrappling
		image_xscale = facing / 2;
	} 
	
	else
	{
		// Reached target
		x = target_x
		y = target_y
		y_speed = -2.5;
		grappling = false
		state = stateFree;
	}
}

stateCannonball = function()
{
	// Calculate how far we've traveled this frame
	var frame_distance = sqrt(x_speed * x_speed + y_speed * y_speed);
	flight_traveled += frame_distance;
    
	// Check if we've reached the target distance
	if (flight_traveled >= flight_distance) 
	{
		show_debug_message("Reached target distance, enabling gravity");
        
		// Optional: Give a small downward boost when gravity kicks in
		input_enabled = true;
		y_speed = 0;
		x_speed = 0;
		alarm[0] = 5;
		
		beingFired = false;
		dashing = false;
		groundPounding = false;
		grappling = false;
		input_enabled = true;
		state = stateFree;
	}
    
	// Also stop if we hit something during flight
	if (place_meeting(x + sign(x_speed), y, O_Ground) || place_meeting(x, y + sign(y_speed), O_Ground))
	{
		show_debug_message("Hit obstacle during flight");
		beingFired = false;
		dashing = false;
		groundPounding = false;
		grappling = false;
		input_enabled = true;
		state = stateFree;
	}
}

state = stateFree;
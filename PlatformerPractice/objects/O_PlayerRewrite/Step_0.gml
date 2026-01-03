/// @description Player Actions
// You can write your code in this editor

// --------------------------------------------
// Input Reading
// --------------------------------------------
var left = keyboard_check(global.left_key);
var right = keyboard_check(global.right_key);
var jump = keyboard_check_pressed(global.jump_key);

dir = right - left;

if(dir != 0)
{
	facing = dir;
}


// --------------------------------------------
// Condtion Checks
// --------------------------------------------
on_ground = place_meeting(x, y + bbox_bottom, O_Ground);


// --------------------------------------------
// Constants (Factors that are checked/applied every frame, regardless of circumstance)
// --------------------------------------------
if(!on_ground)
{
	y_speed += gravity;
	y_speed = clamp(y_speed, -1000, max_falling_speed);
}


// --------------------------------------------
// Movement
// --------------------------------------------
if(input_enabled)
{
	// Horizontal Movement
	x_speed = dir * movement_speed;
	
	
	// Jumping
	if(jump && jump_counter < max_jumps)
	{
		if(global.doubleJumpUnlock)
		{
			y_speed = -3.5;
			jump_counter += 1;
		}
		
		else
		{
			y_speed -= 3.5;
			jump_counter = 2;
		}
	}
}


// --------------------------------------------
// Collisions
// --------------------------------------------
move_and_collide(x_speed, y_speed, O_Ground);

// --------------------------------------------
// Update Sprite
// --------------------------------------------
if(!on_ground) 
{ 
	if(y_speed < 0) 
	{ 
		sprite_index = S_PlayerMidairRising; 
	} 
	
	else 
	{ 
		sprite_index = S_PlayerMidairFalling; 
	} 
} 

else if(dir != 0) 
{ 
	sprite_index = S_PlayerRun; 
	image_xscale = facing; 
} 

else 
{ 
	sprite_index = S_Player; 
}
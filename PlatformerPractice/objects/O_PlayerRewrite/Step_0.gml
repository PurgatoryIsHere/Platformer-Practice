/// @description Player Actions
// You can write your code in this editor

// --------------------------------------------
// Camera
// --------------------------------------------
var cam_x = x - (camera_get_view_width(view_camera[0]) / 2);
var cam_y = camera_get_view_y(view_camera[0]);

camera_set_view_pos(view_camera[0], cam_x, cam_y);


// --------------------------------------------
// Input Reading
// --------------------------------------------
var left = keyboard_check(global.left_key);
var right = keyboard_check(global.right_key);
var dash = keyboard_check_pressed(global.dash_key);
var ground_pound = keyboard_check_pressed(global.gp_key);

dir = right - left;

if(dir != 0)
{
	facing = dir;
}

if(dash && dash_cooldown == 0)
{
	dashing = true;
	dash_timer = 10;
	dash_cooldown = 40;
	i_frame_timer = 32;
}


if(ground_pound && global.groundPoundUnlock)
{
	groundPounding = true;
}


// --------------------------------------------
// Condtion Checks
// --------------------------------------------
on_ground = place_meeting(x, y + 5, O_Ground);
on_wall = place_meeting(x - 3, y, O_Ground) - place_meeting(x + 3, y, O_Ground);

// --------------------------------------------
// Constants (Factors that are checked/applied every frame, regardless of circumstance)
// --------------------------------------------

// Wall Sliding Gravity
if(on_wall != 0 && !on_ground && !groundPounding)
{
	y_speed = min(y_speed + 1, wall_slide_speed);
}

// Normal Gravity
else
{
	y_speed += 0.2;
}

// Reset jump_counter
if(on_ground && place_meeting(x, y + y_speed, O_Ground))
{
	jump_counter = 0;
}

// Disable movement lock if player starts sliding on another wall after wall-jumping
if(on_wall != 0 && movement_lock_timer > 0)
{
	movement_lock_timer = 0;
}

// Timer & Cooldown Decrementation
dash_timer = max(dash_timer - 1, 0);
dash_cooldown = max(dash_cooldown - 1, 0);
movement_lock_timer = max(movement_lock_timer - 1, 0);
i_frame_timer = max(i_frame_timer - 1, 0);

// --------------------------------------------
// Movement
// --------------------------------------------
if(input_enabled)
{
	state();
}


// --------------------------------------------
// Collisions
// --------------------------------------------
if(place_meeting(x, y, O_Ground))
{
    for(var i = 0; i < 1000; i++)
    {
        if(!place_meeting(x + i, y, O_Ground)) { x += i; break; }
        if(!place_meeting(x - i, y, O_Ground)) { x -= i; break; }
        if(!place_meeting(x, y - i, O_Ground)) { y -= i; break; }
        if(!place_meeting(x, y + i, O_Ground)) { y += i; break; }
    }
}

if(place_meeting(x + x_speed, y, O_Ground))
{
    while(!place_meeting(x + sign(x_speed), y, O_Ground))
    {
        x += sign(x_speed);
    }
    
	x_speed = 0;
}

if(place_meeting(x, y + y_speed, O_Ground))
{
    while (!place_meeting(x, y + sign(y_speed), O_Ground))
    {
        y += sign(y_speed);
    }
    
	y_speed = 0;
}

x += x_speed;
y += y_speed;

// --------------------------------------------
// Update Sprite
// --------------------------------------------
if(dashing || groundPounding || grappling)
{
	
}

else if(wall_sliding)
{
	sprite_index = S_PlayerOnWallLeft;
	image_xscale = facing / 2;
}


else if(dashing)
{
	sprite_index = S_PlayerDash;
}

else if(!on_ground) 
{ 
	if(y_speed < 0) 
	{ 
		sprite_index = S_PlayerMidairRising; 
		image_xscale = facing / 2;
	} 
	
	else 
	{ 
		sprite_index = S_PlayerMidairFalling; 
		image_xscale = facing / 2;
	} 
} 

else if(dir != 0) 
{ 
	sprite_index = S_PlayerRun; 
	image_xscale = facing / 2; 
} 

else 
{ 
	sprite_index = S_Player; 
}
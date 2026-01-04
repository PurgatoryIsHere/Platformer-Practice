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


// --------------------------------------------
// Condtion Checks
// --------------------------------------------
on_ground = place_meeting(x, y + 1, O_Ground);


// --------------------------------------------
// Constants (Factors that are checked/applied every frame, regardless of circumstance)
// --------------------------------------------

// Gravity
y_speed += 0.2;

// Reset jump_counter
if(on_ground)
{
	jump_counter = 0;
}

dash_timer = max(dash_timer - 1, 0);
dash_cooldown = max(dash_cooldown - 1, 0);
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

else if(!on_ground) 
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

else if(dir != 0 && !dashing) 
{ 
	sprite_index = S_PlayerRun; 
	image_xscale = facing / 2; 
} 

else if(dashing)
{
	sprite_index = S_PlayerDash;
}

else 
{ 
	sprite_index = S_Player; 
}
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
gravity = 0.2;
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
dash_timer = 10;
dash_speed = 5;
dash_cooldown = 0;
ground_dashing = false;


// --------------------------------------------
// Wall-Jumping
// --------------------------------------------
wall_jumping = false;
wall_jump_timer = 0;
last_wall = 0;
on_wall = 0;
wall_slide_speed = 0.25; 
wall_jump_x_speed = 0;


// --------------------------------------------
// Ground Pounding
// --------------------------------------------
ground_pounding = false;

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
/// @description Initialize
// You can write your code in this editor

x_speed = 0
y_speed = 0
dir = 0


// Double Jump
jump_counter = 0 // How many jumps the player has performed


// Dash
canDash = true
dash_timer = 0
dash_speed = 0
dashing = false
ground_dash = false
dash_cooldown = 0


// Wall Jump
onGround = 0
onWall = 0
wall_jump_timer = 0
last_wall = 0
wall_jump_x_speed = 0


// Grapple
grappling = false
grapple_speed = 10
grapple_cooldown = 0

target_in_range =  false
target_x = 0
target_y = 0

//Ground Pound
groundPounding = false

//Check if being fired from cannon
beingFired = false

flight_target_x = 0;
flight_target_y = 0;
flight_distance = 0;
flight_traveled = 0;

// Invincibility Frames
i_frame_timer = 0

//Pause Functionality
paused = false;
paused_surf = -1;

camera_width = camera_get_view_width(view_camera[0])
camera_height = camera_get_view_height(view_camera[0])

// Damage Functionality
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
	global.lives -= 1
		
	if(global.lives == 0)
	{
		room = global.starting_room
		global.lives = 3
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
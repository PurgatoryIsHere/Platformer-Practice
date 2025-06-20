/// @description Initialize
// You can write your code in this editor
window_set_size(1280, 720)
window_center()

x_speed = 0
y_speed = 0
dir = 0


// Double Jump
jump_number = 2 // How many jumps the player can make
jump_current = 0 // How many jumps the player has remaining


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
movement_locked_timer = 0
wall_jump_timer = 0
last_wall = 0


// Grapple
grappling = false
grapple_speed = 10
grapple_cooldown = 0

target_in_range =  false
target_x = 0
target_y = 0

//Ground Pound
groundPounding = false

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
}

LifeReduction = function()
{
	global.lives -= 1
		
	if(global.lives == 0)
	{
		room = global.starting_room
		global.lives = 3
		global.out_of_lives = false
		global.player_health = 100
	}
		
	else
	{
		room_restart()
		global.player_health = 100
	}
}
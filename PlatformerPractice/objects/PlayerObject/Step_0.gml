/// @description Movement
// You can write your code in this editor

//Camera Stuff
var cam_x = x - camera_get_view_width(view_camera[0]) / 2;
var cam_y = camera_get_view_y(view_camera[0]);

camera_set_view_pos(view_camera[0], cam_x, cam_y);


//Player Functionality

y_speed += 0.2; //Gravity
x_speed = 0; //Stationary Speed

dir = (keyboard_check(ord("D")) || keyboard_check(vk_right)) - (keyboard_check(ord("A")) || keyboard_check(vk_left)); //Direction the player is facing

//onGround = place_meeting(x, y + 1, GroundObject);
onWall = place_meeting(x - 0.075, y, GroundObject) - place_meeting(x + 0.075, y, GroundObject);
var holdingLeft = (keyboard_check(ord("A")) || keyboard_check(vk_left));
var holdingRight = (keyboard_check(ord("D")) || keyboard_check(vk_right));

dash_timer = max(dash_timer - 1, 0);
movement_locked_timer = max(movement_locked_timer - 1, 0);
wall_jump_timer = max(wall_jump_timer - 1, 0);

if(movement_locked_timer <= 0)
{
	//Movement
	x_speed = dir * 2;
	
	//Jumping
	if((keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)) && jump_current > 0)
	{
		if(onWall != 0)
		{
			movement_locked_timer = 10;
			wall_jump_timer = 7.5;
		}
	
		else
		{
			y_speed = -2.5;
			jump_current--;
			canDash = true
		}
	}
	
	if(place_meeting(x, y + y_speed, GroundObject))
	{
		while(!place_meeting(x, y + sign(y_speed), GroundObject))
		{
			y += sign(y_speed);
		}
 
		if(y_speed > 0)
		{
			jump_current = jump_number;
		}
 
		y_speed = 0;
	}

	y += y_speed;
}


//Dashing
if(keyboard_check_pressed(vk_space) && canDash)
{
	canDash = false;
    dash_timer = 10; // Number of frames for the dash
    dash_speed = 5;
}

//Animation for dash (frame-by-frame)
if (dash_timer > 0) 
{
    var new_x = dir * dash_speed;
	move_and_collide(new_x, -1.5, GroundObject)
	
	//Dash visualization
	with(instance_create_depth(x, y, depth + 1, TrailObject))
	{
		sprite_index = other.sprite_index
		image_blend = c_fuchsia
		image_alpha = 0.7
	}
}


//Wall Jumping
if(onWall != 0 && (holdingLeft || holdingRight))
{
	image_xscale = onWall;
	y_speed = 0.25;
	jump_current = jump_number;
}

//Wall Jumping Animation (frame-by-frame)
if(wall_jump_timer > 0)
{
	y_speed = -2.5;
    x_speed = onWall * 5;
}

move_and_collide(x_speed, y_speed, GroundObject)


//Spike and Flag collision

if place_meeting(x, y+1, FlagObject) {
	room_goto_next()
}	

if place_meeting(x, y+1, SpikeObject) 
{
	global.lives -= 1
	
	if(global.lives == 0)
	{
		room = global.starting_room
		global.lives = 3
	}
	
	else
	{
		room_restart()
	}
}	
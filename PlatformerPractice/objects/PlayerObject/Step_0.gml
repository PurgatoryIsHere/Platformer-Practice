/// @description Movement
// You can write your code in this editor

//Basic Movement and Gravity

y_speed += 0.2
x_speed = 0

var dash_key_pressed = keyboard_check_pressed(vk_space)
var keyLeft = keyboard_check(ord("A")) || keyboard_check(vk_left)
var keyRight = keyboard_check(ord("D")) || keyboard_check(vk_right)

if keyLeft{
	x_speed = -2
	dir = -1
}

if keyRight{
	x_speed = +2
	dir = 1
}

if dash_key_pressed && canDash{
	canDash = false;
    dash_timer = 10; // Number of frames for the dash
    dash_speed = 5;
}

if dash_timer > 0 {
    var new_x = dir * dash_speed;
	move_and_collide(new_x, -1.5, GroundObject)
    dash_timer -= 1;
	
	//Dash visualization
	with(instance_create_depth(x, y, depth + 1, TrailObject)){
		sprite_index = other.sprite_index
		image_blend = c_fuchsia
		image_alpha = 0.7
	}
}

//Double Jump
if((keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) && jump_current > 0)
{
    y_speed = -2.5;
    jump_current--;
	canDash = true
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
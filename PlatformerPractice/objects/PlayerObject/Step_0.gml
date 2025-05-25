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

if place_meeting(x, y+1, GroundObject) {
	y_speed = 0
	
	if keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up){
		y_speed = -3.5
		canDash = true
	}
}

if dash_key_pressed && canDash{
	canDash = false;
    dash_timer = 10; // Number of frames for the dash
    dash_speed = 5;
}

if dash_timer > 0 {
    var new_x = dir * dash_speed;
	move_and_collide(new_x, y_speed, GroundObject)
    dash_timer -= 1;
	
	with(instance_create_depth(x, y, depth + 1, TrailObject)){
		sprite_index = other.sprite_index
		image_blend = c_fuchsia
		image_alpha = 0.7
	}
}

move_and_collide(x_speed, y_speed, GroundObject)


//Spike and Flag collision

if place_meeting(x, y+1, FlagObject) {
	room_goto_next()
}	

if place_meeting(x, y+1, SpikeObject) {
	room_restart()
}	
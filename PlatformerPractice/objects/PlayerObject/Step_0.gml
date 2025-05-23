/// @description Movement
// You can write your code in this editor

//Basic Movement and Gravity

y_speed += 0.2
x_speed = 0

if keyboard_check(ord("A")) || keyboard_check(vk_left){
	x_speed = -2
}

if keyboard_check(ord("D")) || keyboard_check(vk_right){
	x_speed = +2
}

if place_meeting(x, y+1, GroundObject) {
	y_speed = 0
	
	if keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space){
		y_speed = -3.5
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
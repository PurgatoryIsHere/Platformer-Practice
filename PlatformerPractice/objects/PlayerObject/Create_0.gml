/// @description Initialize
// You can write your code in this editor
window_set_size(1280, 720)
window_center()

x_speed = 0
y_speed = 0
dir = 0

canDash = false
dash_timer = 0
dash_speed = 0

jump_number = 2; //How many jumps the player can make
jump_current = 0; //How many jumps the player has remaining

onGround = 0;
onWall = 0
movement_locked_timer = 0;
wall_jump_timer = 0;
last_wall = 0;
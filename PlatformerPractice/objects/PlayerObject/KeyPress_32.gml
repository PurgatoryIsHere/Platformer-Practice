/// @description Dash and Grapple Mechanics
// You can write your code in this editor

if (target_in_range && !grappling && grapple_cooldown == 0 && global.grappleUnlock)
{
    grappling = true
	grapple_cooldown = 20
}

else if(onGround && (dir != 0) && dash_cooldown == 0)	
{
	dash_timer = 10
	dash_speed = 5
	dashing = true
	ground_dash = true
	
	i_frame_timer = 32
	dash_cooldown = 40
}

else if(canDash && !onGround)
{
	canDash = false
    dash_timer = 10 // Number of frames for the dash
    dash_speed = 5
	dashing = true
}
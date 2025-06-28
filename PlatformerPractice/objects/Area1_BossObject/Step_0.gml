/// @description Insert description here
// You can write your code in this editor
boss_i_frame_timer = max(boss_i_frame_timer - 1, 0);

image_xscale = dir * 1.5;

if place_free(x + dir, y) && !place_free(x + (dir * 16), y + 9)
{
	hspeed = dir * 1
}
else 
{
	image_xscale = dir * 1.5;
	dir *= -1
}

// Damaging the player
if(place_meeting(x, y, PlayerObject) && !PlayerObject.dashing && !PlayerObject.groundPounding)
{
	if(PlayerObject.i_frame_timer == 0)
	{
		PlayerObject.TakeDamage(15);
		PlayerObject.i_frame_timer = 32
	}
	
	if(global.player_health == 0)
	{
		PlayerObject.LifeReduction();
	}
}

// Taking damage from player
if(place_meeting(x, y, PlayerObject) && (PlayerObject.groundPounding || PlayerObject.dashing))
{
	if(boss_i_frame_timer == 0)
	{
		TakeDamage(10);
	}
}

// I-frames visualization (after being damaged by player)
if(boss_i_frame_timer > 0)
{
	image_alpha = 0.5 + 0.5 * sin(boss_i_frame_timer * 0.5);
}

else
{
	image_alpha = 1	
}

//Set a timer for the boss to do something every 3 seconds
alarm[0] = room_speed * 3

move_timer = max(move_timer - 1, 0);
var jump_count = 0
var has_pounded = false

if jump
{
	move_timer = 32
	
	if move_timer > 0
	{
		vspeed = -5
	}
	else
	{
		jump = false
	}
}
else if doubleJump
{
	move_timer = 32
	jump_count += 1
	
	if move_timer > 0
	{
		vspeed = -5
	}
	else if move_timer <= 0 && jump_count < 2
	{
		vspeed = -5
	}
	else
	{
		doubleJump = false
		jump_count = 0
	}
}
else if groundPound
{
	move_timer = 32
	
	if move_timer > 0
	{
		hspeed = 0
		vspeed = -5
		has_pounded = true
	}
	else if move_timer <= 0 && has_pounded
	{
		hspeed = 0
		vspeed = 10
		
		if point_distance(x, y, PlayerObject.x, PlayerObject.y) && place_meeting(x, y + sprite_height, GroundObject)
		{
			PlayerObject.TakeDamage(20)
		}
	}
	else
	{
		groundPound = false
		has_pounded = false
	}
	
}

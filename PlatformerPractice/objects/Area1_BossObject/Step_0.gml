/// @description Insert description here
// You can write your code in this editor

y_speed += 0.2;

boss_i_frame_timer = max(boss_i_frame_timer - 1, 0);

image_xscale = dir * 1.5;

if place_free(x + dir, y) && !place_free(x + (dir * 16), y + 9)
{
	x_speed = dir * 1
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
	
	if(global.player_health <= 0)
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


move_timer = max(move_timer - 1, 0);

if(jump)
{
	if(move_timer == 0)
	{
		move_timer = 32;
	}
	
	y_speed = -5;
	jump = false;
}

else if(doubleJump)
{	
	if(move_timer == 0)
	{
		move_timer = 60;
		
		y_speed = -5;
		jump_count += 1;
	}
	
	else if(jump_count < 2 && move_timer == 30)
	{
		y_speed = -5;
		doubleJump = false;
		jump_count = 0;
	}
}

else if(groundPound)
{
	if(move_timer == 0)
	{
		move_timer = 60;
		
		x_speed = 0;
		y_speed = -10;
		has_pounded = true;
	}
	
	else if(has_pounded && move_timer <= 30)
	{
		x_speed = 0;
		y_speed = 10;
		
		if point_distance(x, y, PlayerObject.x, PlayerObject.y) && place_meeting(x, y + sprite_height, GroundObject)
		{
			PlayerObject.TakeDamage(20);
			
			groundPound = false;
			has_pounded = false;
			move_timer = 0;
		}
	}
	
	if(move_timer == 0)
	{
		groundPound = false;
		has_pounded = false;
	}
}

move_and_collide(x_speed, y_speed, GroundObject);

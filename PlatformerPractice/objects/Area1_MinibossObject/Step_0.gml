/// @description Insert description here
// You can write your code in this editor

y_speed += 0.2;
boss_i_frame_timer = max(boss_i_frame_timer - 1, 0);

// Damaging the player
if(place_meeting(x, y, PlayerObject) && !PlayerObject.dashing && !PlayerObject.groundPounding)
{
	if(PlayerObject.i_frame_timer == 0)
	{
		PlayerObject.TakeDamage(20);
		PlayerObject.i_frame_timer = 32
	}
}

// Taking damage from player
if(place_meeting(x, y, PlayerObject) && (PlayerObject.groundPounding || PlayerObject.dashing))
{
	if(boss_i_frame_timer == 0)
	{
		TakeDamage(20);
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

// Move timer countdown
move_timer = max(move_timer - 1, 0);

//Movement Logic
if (jump || doubleJump || groundPound)
{
	hspeed = dir
}
else if place_free(x + dir, y) && !place_free(x + (dir * 24), y + 9)
{
	hspeed = dir
}

else if place_meeting(x, y + 1, GroundObject)
{
	image_xscale = dir * -1.5;
	dir *= -1
}

// Special move logic
if(jump) 
{
    if(move_timer == 0)
	{
        move_timer = 32;
        y_speed = -5;
        jump = false;
    }
}

else if(doubleJump) 
{
    if(move_timer == 0)
	{
        move_timer = 60;
        y_speed = -5;
    }
	
    else if(move_timer == 30) 
	{
        y_speed = -5;
        doubleJump = false;
    }
}

else if(groundPound) 
{
	
    if(move_timer == 0) 
	{
        move_timer = 60;
        y_speed = -7;
        has_pounded = true;
    }
	
    else if(has_pounded && move_timer <= 30)
	{
        y_speed = 10;
        
        // Check for ground pound impact
        if(point_distance(x, y + 1, PlayerObject.x, PlayerObject.y) < 80 && PlayerObject.onGround && place_meeting(x, y + sprite_height, GroundObject)) 
		{
            PlayerObject.TakeDamage(40);
        }
        
        // End ground pound when hitting ground
        if(place_meeting(x, y + sprite_height, GroundObject))
		{
            groundPound = false;
            has_pounded = false;
            move_timer = 0;
        }
    }
}

// Apply movement with collision
boss_move_and_collide(hspeed, y_speed, GroundObject);

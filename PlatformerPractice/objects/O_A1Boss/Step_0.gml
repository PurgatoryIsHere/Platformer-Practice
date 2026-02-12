/// @description Boss Mechanics
// You can write your code in this editor

if(!boss_battle_active)
{
	if(O_Player.x > 64 && O_Player.x < 544 && O_Player.y < 640 && O_Player.y > 320)
	{
		boss_battle_active = true;
		//BGMController.StartBossMusic("Area1");
	}
}

else
{
	y_speed += 0.2;
	boss_i_frame_timer = max(boss_i_frame_timer - 1, 0);
	move_timer = max(move_timer - 1, 0);

	// --------------------------------------------
	// Dealing/Taking Damage
	// --------------------------------------------
	if(place_meeting(x, y, O_Player) && !O_Player.dashing && !O_Player.groundPounding)
	{
		if(O_Player.i_frame_timer == 0)
		{
			O_Player.TakeDamage(15);
			O_Player.i_frame_timer = 32
		}
	}

	if(place_meeting(x, y, O_Player) && (O_Player.groundPounding || O_Player.dashing))
	{
		if(boss_i_frame_timer == 0)
		{
			TakeDamage(10);
		}
	}

	// --------------------------------------------
	// I-frame Visualization
	// --------------------------------------------
	if(boss_i_frame_timer > 0)
	{
		image_alpha = 0.5 + 0.5 * sin(boss_i_frame_timer * 0.5);
	}

	else
	{
		image_alpha = 1	
	}

	// --------------------------------------------
	// Movement Logic
	// --------------------------------------------
	if(!place_meeting(x + 16 * dir, y, O_Ground))
	{
		x_speed = dir
	}

	else
	{
		image_xscale = dir * -1.5;
		dir *= -1
	}

	// --------------------------------------------
	// Special Move Logic
	// --------------------------------------------
	if(jump) 
	{
		if(move_timer == 0)
		{
			audio_play_sound(_706679__sadiquecat__low_whoosh_bamboo_4, 1, false)
			move_timer = 32;
			y_speed = -5;
			jump = false;
		}
	}

	else if(doubleJump) 
	{
		if(move_timer == 0)
		{
			audio_play_sound(_706679__sadiquecat__low_whoosh_bamboo_4, 1, false)
			move_timer = 60;
			y_speed = -5;
		}
	
		else if(move_timer == 30) 
		{
			audio_play_sound(_706679__sadiquecat__low_whoosh_bamboo_4, 1, false)
			y_speed = -5;
			doubleJump = false;
		}
	}

	else if(groundPound) 
	{
	
		if(move_timer == 0) 
		{
			audio_play_sound(_706679__sadiquecat__low_whoosh_bamboo_4, 1, false)
			move_timer = 60;
			y_speed = -7;
			has_pounded = true;
		}
	
		else if(has_pounded && move_timer <= 30)
		{
			y_speed = 10;
        
			// Check for ground pound impact
			if(point_distance(x, y + 1, O_Player.x, O_Player.y) < 80 && O_Player.on_ground && place_meeting(x, y + sprite_height, O_Ground)) 
			{
				O_Player.TakeDamage(20);
			}
        
			// End ground pound when hitting ground
			if(place_meeting(x, y + sprite_height, O_Ground))
			{
				audio_play_sound(_706679__sadiquecat__low_whoosh_bamboo_4, 1, false)
				groundPound = false;
				has_pounded = false;
				move_timer = 0;
			}
		}
	}

	// --------------------------------------------
	// Collision Handling
	// --------------------------------------------
	if(place_meeting(x, y, O_Ground))
	{
		for(var i = 0; i < 1000; i++)
		{
			if(!place_meeting(x + i, y, O_Ground)) { x += i; break; }
			if(!place_meeting(x - i, y, O_Ground)) { x -= i; break; }
			if(!place_meeting(x, y - i, O_Ground)) { y -= i; break; }
			if(!place_meeting(x, y + i, O_Ground)) { y += i; break; }
		}
	}

	if(place_meeting(x + x_speed, y, O_Ground))
	{
		while(!place_meeting(x + sign(x_speed), y, O_Ground))
		{
			x += sign(x_speed);
		}
    
		x_speed = 0;
	}

	if(place_meeting(x, y + y_speed, O_Ground))
	{
		while (!place_meeting(x, y + sign(y_speed), O_Ground))
		{
			y += sign(y_speed);
		}
    
		y_speed = 0;
	}

	x += x_speed;
	y += y_speed;
}

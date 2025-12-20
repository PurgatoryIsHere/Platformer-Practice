 /// @description Move to different areas
// You can write your code in this editor

boss_i_frame_timer = max(boss_i_frame_timer - 1, 0);

//destroy boss after all boss_phases are done
if (boss_phase >= 4)
{
	instance_destroy(self)	
}

//reset boss health and go to next boss_phase
if (boss_health <= 0)
{
	boss_phase += 1
	boss_health = 100
	PhaseSwitch();
}

//Stop Area 1 Boss timer if not in Area 1 Boss boss_phase
if(boss_phase != 1)
{
	alarm[0] = -1	
}
else if(boss_phase != 3)
{
	alarm[3] = -1	
}

//may have to teleport boss to each boss_phase

switch (boss_phase)
{
	//Area 1 Boss Mimic
    case 1:
	
        y_speed += 0.2;
		
		if (alarm_zero_started = false)
		{
			alarm[0] = 60 * 3
			alarm_zero_started = true
		}

		// Damaging the player
		if(place_meeting(x, y, O_Player) && !O_Player.dashing && !O_Player.groundPounding)
		{
			if(O_Player.i_frame_timer == 0)
			{
				O_Player.TakeDamage(15);
				O_Player.i_frame_timer = 32;
			}
		}

		// Taking damage from player
		if(place_meeting(x, y, O_Player) && (O_Player.groundPounding || O_Player.dashing))
		{
			if(boss_i_frame_timer == 0)
			{
				PhaseOneDamage(10);
			}
		}

		// Move timer countdown
		move_timer = max(move_timer - 1, 0);

		//Movement Logic
		if (jump || doubleJump || groundPound || shoot)
		{
			hspeed = dir
		}
		
		else if place_free(x + dir, y) && !place_free(x + dir, y + 9)
		{
			hspeed = dir
		}

		else if place_meeting(x, y + 1, O_Ground)
		{
			image_xscale = dir * -2;
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
				if(point_distance(x, y + 1, O_Player.x, O_Player.y) < 80 && O_Player.onGround && place_meeting(x, y + sprite_height, O_Ground)) 
				{
					O_Player.TakeDamage(20);
				}
        
				// End ground pound when hitting ground
				if(place_meeting(x, y + sprite_height, O_Ground))
				{
					groundPound = false;
					has_pounded = false;
					move_timer = 0;
				}
			}
		}
		
		else if(dash)
		{
			if(move_timer == 0 && has_dashed = false) 
			{
				move_timer = 15;
				has_dashed = true;
			}
			
			else if(move_timer == 0 && has_dashed = true) 
			{
				has_dashed = false;
				dash = false;
			}
			
			if place_meeting(x + 17, y, O_Ground) || place_meeting(x - 17, y, O_Ground)
			{
				image_xscale = dir * -2;
				dir *= -1
			}
			
			hspeed = dir * 5
		}
		
		else if (shoot)
		{
			for (var i = 0; i < bullet_count; i++) 
			{
				var _direction = ((360 / bullet_count) * i) + 5;
    
				var _bullet = instance_create_layer(x, y, "Instances", O_A8BossProjectile);
    
				_bullet.direction = _direction;
			}
			
			alarm[4] = 20
			
			shoot = false
		}
		
    break;


	//Area 3 Boss Stuff
    case 2:
	
        if(pillars_dropped)
		{
			pillar_timer += 1;
		
			if(pillar_timer > pillar_timeout)
			{
				with(O_Pillar)
				{
					self.alarm_triggered = true;
					self.alarm[0] = 30;
					self.shake_time = 30;
				}
			
				GroundPoundAOE();
				pillar_timer = 0;
				wave_spawned = false;
				wave_respawning = true;
				pillars_dropped = false;
			
				alarm[2] = 90;
			}
		}
	
		switch(wave)
		{
			case 1:
		
				if(!wave_spawned && !wave_respawning)
				{
					var ground_count = irandom_range(5, 8);
					
					Spawn_Wave("ground", ground_count);
					Spawn_Wave("flying", 12 - ground_count);
					
					wave_spawned = true;
				}
			
				else if(wave_spawned && !instance_exists(O_SpawnableEnemyParent) && !pillars_dropped)
				{
					Pillar_Drop_1();
					pillars_dropped = true;
				}
			
			case 2:
		
				if(!wave_spawned && !wave_respawning)
				{
					var ground_count = irandom_range(12, 15);
					
					Spawn_Wave("ground", ground_count);
					Spawn_Wave("flying", 20 - ground_count);
					wave_spawned = true;
				}
			
				else if(wave_spawned && !instance_exists(O_SpawnableEnemyParent) && !pillars_dropped)
				{
					Pillar_Drop_2();
					pillars_dropped = true;
				}
		}
		
		// Taking damage from player
		if(place_meeting(x, y, O_Player) && (O_Player.groundPounding || O_Player.dashing))
		{
			if(boss_i_frame_timer == 0)
			{
				PhaseTwoDamage(10);
			}
		}

    break;
	
	
	//Area 5 Boss Stuff
	case 3:
	
		//Gravity
		y_speed += 0.2;
	
		if (alarm_three_started = false)
		{
			alarm[3] = 60 * 1
			alarm_three_started = true
		}
		
		//Change direction on wall collision
		if place_free(x + dir, y) && !place_free(x + dir, y + 9)
		{
			hspeed = dir
		}

		else if place_meeting(x, y + 1, O_Ground)
		{
			image_xscale = dir * -2;
			dir *= -1
		}
	
	
		//Damage player on collision
		if(place_meeting(x, y, O_Player) && !O_Player.beingFired)
		{
			if(O_Player.i_frame_timer == 0)
			{
				O_Player.TakeDamage(15);
				O_Player.i_frame_timer = 32;
			}
		}
	
		//Damage Boss on collision with fired player
		if (place_meeting(x, y, O_Player) && O_Player.beingFired)
		{
			//move to next phase
			O_Player.beingFired = false
			PhaseOneDamage(30)
		}
    break;   
}

// Invicibility frames
if(boss_i_frame_timer > 0)
{
	image_alpha = 0.5 + 0.5 * sin(boss_i_frame_timer * 0.5);
}

else
{
	image_alpha = 1	;
}

// Apply movement with collision
boss_move_and_collide(hspeed, y_speed, O_Ground);
/// @description Move to different areas
// You can write your code in this editor

boss_i_frame_timer = max(boss_i_frame_timer - 1, 0);

//destroy boss after all boss_phases are done
if (boss_phase > 4)
{
	instance_destroy(self)	
}

//reset boss helath and go to next boss_phase
if (boss_health <= 0)
{
	boss_phase += 1
	boss_health = 100
}

//Atop Area 1 Boss timer if not in Area 1 Boss boss_phase
if (boss_phase != 1)
{
	alarm[0] = -1	
}

//may have to teleport boss to each boss_phase

switch (boss_phase)
{
	
	//Area 1 Boss Mimic
    case 1:
        y_speed += 0.2;

		// Damaging the player
		if(place_meeting(x, y, PlayerObject) && !PlayerObject.dashing && !PlayerObject.groundPounding)
		{
			if(PlayerObject.i_frame_timer == 0)
			{
				PlayerObject.PhaseOneDamage(15);
				PlayerObject.i_frame_timer = 32
			}
		}

		// Taking damage from player
		if(place_meeting(x, y, PlayerObject) && (PlayerObject.groundPounding || PlayerObject.dashing))
		{
			if(boss_i_frame_timer == 0)
			{
				PhaseOneDamage(10);
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
					PlayerObject.PhaseOneDamage(20);
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
    break;


	//Area 3 Boss Stuff
    case 2:
        if(pillars_dropped)
		{
			pillar_timer += 1;
		
			if(pillar_timer > pillar_timeout)
			{
				with(PillarObject)
				{
					self.alarm_triggered = true;
					self.alarm[1] = 30;
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
	
		switch(phase)
		{
			case 1:
		
				if(!wave_spawned && !wave_respawning)
				{
					Spawn_Wave(4);
					wave_spawned = true;
				}
			
				else if(wave_spawned && !instance_exists(ES_GroundEnemyObject) && !pillars_dropped)
				{
					Pillar_Drop_1();
					pillars_dropped = true;
				}
			
			case 2:
		
				if(!wave_spawned && !wave_respawning)
				{
					Spawn_Wave(6);
					wave_spawned = true;
				}
			
				else if(wave_spawned && !instance_exists(ES_GroundEnemyObject) && !pillars_dropped)
				{
					Pillar_Drop_2();
					pillars_dropped = true;
				}
			
			case 3:
		
				if(!wave_spawned && !wave_respawning)
				{
					Spawn_Wave(8);
					wave_spawned = true;
				}
			
				else if(wave_spawned && !instance_exists(ES_GroundEnemyObject) && !pillars_dropped)
				{
					Pillar_Drop_3();
					pillars_dropped = true;
				}
		}
		
		// Taking damage from player
		if(place_meeting(x, y, PlayerObject) && (PlayerObject.groundPounding || PlayerObject.dashing))
		{
			if(boss_i_frame_timer == 0)
			{
				PhaseTwoDamage(10);
			}
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
    break;
	
	
	//Area 5 Boss Stuff
	case 3:
        continue
    break;
	
	case 4:
        continue
    break;
    
    // more cases (with breaks)

    default:
        continue;
}

// Apply movement with collision
boss_move_and_collide(hspeed, y_speed, GroundObject);
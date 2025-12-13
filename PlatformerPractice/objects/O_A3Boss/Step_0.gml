/// @description Basic frame-by-frame mechanics
// You can write your code in this editor

boss_i_frame_timer = max(boss_i_frame_timer - 1, 0);

if(!boss_battle_active)
{
	var nearest_agd = instance_nearest(336, 944, O_AutoGateDetection);

	if(nearest_agd.activated && !boss_battle_active)
	{
		phase = 1;
		boss_battle_active = true;
	}
}

else if(boss_battle_active)
{
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
			
			ground_pounding = true;
			vspeed = -1;
			pillar_timer = 0;
			wave_spawned = false;
			wave_respawning = true;
			pillars_dropped = false;
			
			alarm[1] = 90;
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
			
			else if(wave_spawned && !instance_exists(O_GroundEnemy_ES) && !pillars_dropped)
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
			
			else if(wave_spawned && !instance_exists(O_GroundEnemy_ES) && !pillars_dropped)
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
			
			else if(wave_spawned && !instance_exists(O_GroundEnemy_ES) && !pillars_dropped)
			{
				Pillar_Drop_3();
				pillars_dropped = true;
			}
	}
}



// Taking damage from player
if(place_meeting(x, y, O_Player) && (O_Player.groundPounding || O_Player.dashing))
{
	if(boss_i_frame_timer == 0)
	{
		TakeDamage(10);
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

// Ground pound movement
if (ground_pounding)
{
    if (!destroy_platform_triggered)
    {
        DestroyPlatform();
        destroy_platform_triggered = true; // only once
    }

    // Apply gravity
    vspeed += 0.5;
    y += vspeed;

    // Check for ground, but skip breakable blocks
    var hit = instance_place(x, y + 5, O_Ground);
	if (hit != noone && hit.object_index != O_BreakableBlock)
	{
		// Snap to ground
		while (!place_meeting(x, y, O_Ground)) y += 1;

		vspeed = 0;
		ground_pounding = false;

		GroundPoundAOE();

		if (!respawn_platform_triggered)
		{
			RespawnPlatform();
			x = 328;
			y = 688;
			respawn_platform_triggered = true;
		}
	}
}

else
{
    // normal movement/collision
    boss_move_and_collide(hspeed, vspeed, O_Ground);
}

/// @description Basic frame-by-frame mechanics
// You can write your code in this editor

boss_i_frame_timer = max(boss_i_frame_timer - 1, 0);

if(!boss_battle_active)
{
	if(O_Player.x > 64 && O_Player.x < 576 && O_Player.y < 944 && O_Player.y > 608)
	{
		boss_battle_active = true;
		phase = 1;
		BGMController.StartBossMusic("Area3");
	}
}

else if(boss_battle_active)
{
	if(pillars_dropped)
	{
		pillar_timer += 1;
		
		if(pillar_timer > pillar_timeout)
		{	
			ground_pounding = true;
			vspeed = -2;
			pillar_timer = 0;
			wave_spawned = false;
			wave_respawning = true;
			pillars_dropped = false;
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
			
		break;
			
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
			
		break;
		
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
			
		break;
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
if(ground_pounding)
{
    if(!destroy_platform_triggered)
    {
        DestroyPlatform();
    }

    // Apply gravity
    vspeed += 0.5;
    y += vspeed;

    // Check for ground, but skip breakable blocks
    var hit = instance_place(x, y + 5, O_Ground);
	
	// On ground pound impact
	if (hit != noone && hit.object_index != O_BreakableBlock && hit.object_index != O_Pillar)
	{
		while (!place_meeting(x, y, O_Ground)) y += 1;

		vspeed = 0;
		ground_pounding = false;

		GroundPoundAOE();

		// Pillars shake & disappear
		with(O_Pillar)
		{
			self.alarm_triggered = true;
			self.alarm[0] = 30;
			self.shake_time = 30;
		}

		if(!respawn_platform_triggered)
		{
			alarm[2] = 30;
		}
	}
}

// Jumping back up to platform
if(jumping)
{
    y -= 8;

    if (y <= 688) // reached home position
    {
        y = 688;
        vspeed = 0;
		jumping = false;

        RespawnPlatform();
		respawn_platform_triggered = false;
		alarm[1] = 60;
    }
}

/// @description Basic frame-by-frame mechanics
// You can write your code in this editor

boss_i_frame_timer = max(boss_i_frame_timer - 1, 0);

if(!boss_battle_active)
{
	var nearest_agd = instance_nearest(336, 944, AutomaticGateDetectionObject);

	if(nearest_agd.activated && nearest_agd.tag = "boss" && !boss_battle_active)
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
			with(CollapsibleGroundObject)
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
}



// Taking damage from player
if(place_meeting(x, y, PlayerObject) && (PlayerObject.groundPounding || PlayerObject.dashing))
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

boss_move_and_collide(hspeed, vspeed, GroundObject);
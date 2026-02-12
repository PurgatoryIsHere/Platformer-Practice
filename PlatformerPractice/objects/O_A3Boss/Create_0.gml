/// @description Basic boss mechanics
// You can write your code in this editor

boss_health = 90;
boss_battle_active = false;
boss_i_frame_timer = 0;

dir = 1;

phase = 0;
wave_spawned = false;
wave_respawning = false;
pillars_dropped = false;
pillar_timer = 0;
pillar_timeout = 600; // time before pillars start collapsing

ground_pounding = false;
destroy_platform_triggered = false;
respawn_platform_triggered = false;
jumping = false;

TakeDamage = function(damage)
{
	boss_health -= damage;
	
	if(boss_health <= 0)
	{
		with(O_SpawnableEnemyParent)
		{
			instance_destroy(self)
		}
		
		with(O_Pillar)
		{
			self.alarm_triggered = true;
			self.alarm[0] = 30;
			self.shake_time = 30;
		}
		
		audio_play_sound(_629664__stumpbutt__retro_taking_damage_sfx2_boss, 1, false)
		instance_destroy(self);
		DropAbility();
	}
	
	else if(boss_health <= 30 && phase == 2)
	{
		//push player off platform
		with (O_Player)
		{
			if (x > 224 && x < 416)
			{
				hspeed = (x < other.x) ? -4 : 4;
				alarm[0] = 75;
			}
		}
		
		phase = 3;
		
		with(O_SpawnableEnemyParent)
		{
			instance_destroy(self)
		}
		
		with(O_Pillar)
		{
			self.alarm_triggered = true;
			self.alarm[0] = 30;
			self.shake_time = 30;
		}
		
		wave_spawned = false;
		wave_respawning = true;
		pillars_dropped = false;
		pillar_timer = 0;
		
		alarm[1] = 110;
	}
	
	else if(boss_health <= 60 && phase == 1)
	{
		//push player off platform
		with (O_Player)
		{
			if (x > 224 && x < 416)
			{
				hspeed = (x < other.x) ? -4 : 4;
				alarm[0] = 75;
			}
		}

		phase = 2;
		
		with(O_SpawnableEnemyParent)
		{
			instance_destroy(self)
		}
		
		with(O_Pillar)
		{
			self.alarm_triggered = true;
			self.alarm[0] = 30;
			self.shake_time = 30;
		}
		
		wave_spawned = false;
		wave_respawning = true;
		pillars_dropped = false;
		pillar_timer = 0;
		
		alarm[1] = 110;
	}
	
	boss_i_frame_timer = 32;
}

DropAbility = function()
{
	instance_create_layer(320, 928, "Instances", O_GroundPoundUnlock);
}

Spawn_Wave = function(enemy_count)
{
	for (var i = 0; i < enemy_count; i++)
    {
		instance_create_layer(irandom_range(96, 560), 944, "Instances", O_GroundEnemy_ES);
    }
}

Pillar_Drop_1 = function()
{
	instance_create_layer(112, 864, "Instances", O_Warning);
	instance_create_layer(192, 864, "Instances", O_Warning);
	instance_create_layer(400, 864, "Instances", O_Warning);
	instance_create_layer(480, 864, "Instances", O_Warning);
	
	audio_play_sound(_630529__mykiscool__earth_shaking_bones_rumbling, 1, false)
	
	alarm[0] = 90;
}

Pillar_Drop_2 = function()
{
	instance_create_layer(96, 864, "Instances", O_Warning);
	instance_create_layer(176, 864, "Instances", O_Warning);
	instance_create_layer(256, 864, "Instances", O_Warning);
	instance_create_layer(336, 864, "Instances", O_Warning);
	instance_create_layer(416, 864, "Instances", O_Warning);
	instance_create_layer(496, 864, "Instances", O_Warning);

	audio_play_sound(_630529__mykiscool__earth_shaking_bones_rumbling, 1, false)
	
	alarm[0] = 90;
}

Pillar_Drop_3 = function()
{
	instance_create_layer(64, 864, "Instances", O_Warning);
	instance_create_layer(96, 864, "Instances", O_Warning);
	instance_create_layer(128, 864, "Instances", O_Warning);
	instance_create_layer(160, 864, "Instances", O_Warning);
	instance_create_layer(192, 864, "Instances", O_Warning);
	instance_create_layer(224, 864, "Instances", O_Warning);
	instance_create_layer(256, 864, "Instances", O_Warning);
	
	instance_create_layer(336, 864, "Instances", O_Warning);
	instance_create_layer(368, 864, "Instances", O_Warning);
	instance_create_layer(400, 864, "Instances", O_Warning);
	instance_create_layer(432, 864, "Instances", O_Warning);
	instance_create_layer(464, 864, "Instances", O_Warning);
	instance_create_layer(496, 864, "Instances", O_Warning);
	instance_create_layer(528, 864, "Instances", O_Warning);
	
	audio_play_sound(_630529__mykiscool__earth_shaking_bones_rumbling, 1, false)
	
	alarm[0] = 120;
}

GroundPoundAOE = function()
{
	O_Player.TakeDamage(25);
}

DestroyPlatform = function()
{
	var starting_x = 240;
	
	while(starting_x <= 400)
    {
		var tile = instance_position(starting_x, 688, O_BreakableBlock);
		instance_destroy(tile);
		
		starting_x += 16;
    }
	
	destroy_platform_triggered = true;
}

RespawnPlatform = function()
{
	var starting_x = 240;
	
	while(starting_x <= 400)
    {
		instance_create_layer(starting_x, 688, "Instances", O_BreakableBlock);
		starting_x += 16;
    }
	
	respawn_platform_triggered = true;
}

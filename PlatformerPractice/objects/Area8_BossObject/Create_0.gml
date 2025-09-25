/// @description Initialize Variables
// You can write your code in this editor

boss_phase = 1;

boss_health = 100; // Health for boss; can be changed for each boss
boss_i_frame_timer = 0; // I-frames the boss gets upon taking damage


//Area 1 Boss Creation Stuff

if (boss_phase == 1)
{
	alarm[0] = 60 * 4	
}
else if (boss_phase == 3)
{
	alarm[3] = 60 * 3	
}
else
{
	alarm[0] = -1
	alarm[3] = -1
}

move_timer = 0
jump = false
jump_count = 0;
doubleJump = false
groundPound = false
has_pounded = false;

PhaseOneDamage = function(damage) // Basic damage calculation; aspects can be changed for each boss
{
	boss_health -= damage;
	
	boss_i_frame_timer = 32; // Standard amount of i-frames; can be changed for each boss
}


//Area 3 Boss Stuff

//Area 3 Damage
PhaseTwoDamage = function(damage) // Basic damage calculation; aspects can be changed for each boss
{
	boss_health -= damage;
	
	if(boss_health <= 0)
	{
		with(SpawnableEnemyParentObject)
		{
			instance_destroy(self)
		}
		
		with(PillarObject)
		{
			self.alarm_triggered = true;
			self.alarm[1] = 30;
			self.shake_time = 30;
		}
		
		global.isBossAlive = false; // Unlocks gate
		instance_destroy(self);
		
		if(global.drops_ability)
		{
			DropAbility();
		}
	}
	
	else if(boss_health <= 30 && phase == 2)
	{
		//push player off platform
		phase = 3;
		
		with(SpawnableEnemyParentObject)
		{
			instance_destroy(self)
		}
		
		with(PillarObject)
		{
			self.alarm_triggered = true;
			self.alarm[1] = 30;
			self.shake_time = 30;
		}
		
		wave_spawned = false;
		wave_respawning = true;
		pillars_dropped = false;
		
		alarm[2] = 60;
	}
	
	else if(boss_health <= 60 && phase == 1)
	{
		//push player off platform
		phase = 2;
		
		with(SpawnableEnemyParentObject)
		{
			instance_destroy(self)
		}
		
		with(PillarObject)
		{
			self.alarm_triggered = true;
			self.alarm[1] = 30;
			self.shake_time = 30;
		}
		
		wave_spawned = false;
		wave_respawning = true;
		pillars_dropped = false;
		
		alarm[2] = 60;
	}
	
	boss_i_frame_timer = 32; // Standard amount of i-frames; can be changed for each boss
}

phase = 0;
wave_spawned = false;
wave_respawning = false;
pillars_dropped = false;
pillar_timer = 0;
pillar_timeout = 600; // time before pillars start collapsing

Spawn_Wave = function(enemy_count)
{
	for (var i = 0; i < enemy_count; i++)
    {
		instance_create_layer(irandom_range(96, 560), 944, "Instances", ES_GroundEnemyObject);
    }
}

Pillar_Drop_1 = function()
{
	instance_create_layer(112, 864, "Instances", WarningObject);
	instance_create_layer(192, 864, "Instances", WarningObject);
	instance_create_layer(400, 864, "Instances", WarningObject);
	instance_create_layer(480, 864, "Instances", WarningObject);
	
	alarm[1] = 90;
}

Pillar_Drop_2 = function()
{
	instance_create_layer(96, 864, "Instances", WarningObject);
	instance_create_layer(176, 864, "Instances", WarningObject);
	instance_create_layer(256, 864, "Instances", WarningObject);
	instance_create_layer(336, 864, "Instances", WarningObject);
	instance_create_layer(416, 864, "Instances", WarningObject);
	instance_create_layer(496, 864, "Instances", WarningObject);

	
	alarm[1] = 90;
}

Pillar_Drop_3 = function()
{
	instance_create_layer(64, 864, "Instances", WarningObject);
	instance_create_layer(96, 864, "Instances", WarningObject);
	instance_create_layer(128, 864, "Instances", WarningObject);
	instance_create_layer(160, 864, "Instances", WarningObject);
	instance_create_layer(192, 864, "Instances", WarningObject);
	instance_create_layer(224, 864, "Instances", WarningObject);
	instance_create_layer(256, 864, "Instances", WarningObject);
	
	instance_create_layer(336, 864, "Instances", WarningObject);
	instance_create_layer(368, 864, "Instances", WarningObject);
	instance_create_layer(400, 864, "Instances", WarningObject);
	instance_create_layer(432, 864, "Instances", WarningObject);
	instance_create_layer(464, 864, "Instances", WarningObject);
	instance_create_layer(496, 864, "Instances", WarningObject);
	instance_create_layer(528, 864, "Instances", WarningObject);
	
	alarm[1] = 120;
}

//Pillar_Drop_3()

GroundPoundAOE = function()
{
	PlayerObject.PhaseTwoDamage(25);
}
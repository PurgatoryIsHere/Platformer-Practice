/// @description Initialize Variables
// You can write your code in this editor

boss_phase = 3;

boss_health = 100; // Health for boss; can be changed for each boss
boss_i_frame_timer = 0; // I-frames the boss gets upon taking damage


//Area 1 Boss Mimic
dir = 1;
y_speed = 0;

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


//Area 3 Boss Mimic

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
	}
	
	else if(boss_health <= 50 && phase == 1)
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

	
	alarm[1] = 120;
}


GroundPoundAOE = function()
{
	PlayerObject.PhaseTwoDamage(25);
}

function boss_move_and_collide(hsp, vsp, obj) 
{
    var steps = ceil(max(abs(hsp), abs(vsp)));
    var step_x = hsp / steps;
    var step_y = vsp / steps;

    for (var i = 0; i < steps; i++)
	{
        if (place_free(x + step_x, y))
		{
			x += step_x;
		}
		
        else 
		{
			hspeed = 0;
		}

        if (place_free(x, y + step_y))
		{
			y += step_y;
		}
		
        else 
		{
			y_speed = 0;
		}
    }
}

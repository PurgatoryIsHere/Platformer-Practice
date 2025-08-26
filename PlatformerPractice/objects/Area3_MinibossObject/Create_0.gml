/// @description Initialize
// You can write your code in this editor

/// @description Basic boss mechanics
// You can write your code in this editor

global.isBossAlive = true; // variable to unlock gate for the player once false
boss_health = 60; // Health for boss; can be changed for each boss
boss_i_frame_timer = 0; // I-frames the boss gets upon taking damage

dir = 1; // Starting Direction; can be changed depending on where boss will spawn

TakeDamage = function(damage) // Basic damage calculation; aspects can be changed for each boss
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
			self.alarm[0] = 30;
			self.shake_time = 30;
		}
		
		global.isBossAlive = false; // Unlocks gate
		
		DropKeyPiece();
		OpenGates();
		
		instance_destroy(instance_position(3376, 384, GroundObject));
		instance_destroy(instance_position(3392, 384, GroundObject));
		instance_create_layer(3376, 384, "Instances", BreakableBlockObject);
		instance_create_layer(3392, 384, "Instances", BreakableBlockObject);
		
		instance_destroy(self);
	}
	
	else if(boss_health <= 30 && phase == 1)
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
			self.alarm[0] = 30;
			self.shake_time = 30;
		}
		
		wave_spawned = false;
		wave_respawning = true;
		pillars_dropped = false;
		pillar_timer = 0;
		
		alarm[1] = 60;
	}
	
	boss_i_frame_timer = 32; // Standard amount of i-frames; can be changed for each boss
}

DropKeyPiece = function() // Spawns a keypiece
{
	instance_create_layer(3104, 352, "Instances", KeyPieceObject);
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

// Unique Boss Mechanics
boss_battle_active = false;
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
		instance_create_layer(irandom_range(2880, 3312), 384, "Instances", ES_GroundEnemyObject);
    }
}

Pillar_Drop_1 = function()
{
	instance_create_layer(2864, 304, "Instances", WarningObject);
	instance_create_layer(2944, 304, "Instances", WarningObject);
	instance_create_layer(3216, 304, "Instances", WarningObject);
	instance_create_layer(3296, 304, "Instances", WarningObject);
	
	alarm[0] = 90;
}

Pillar_Drop_2 = function()
{
	instance_create_layer(2832, 304, "Instances", WarningObject);
	instance_create_layer(2864, 304, "Instances", WarningObject);
	instance_create_layer(2896, 304, "Instances", WarningObject);
	instance_create_layer(2976, 304, "Instances", WarningObject);
	instance_create_layer(3008, 304, "Instances", WarningObject);
	instance_create_layer(3040, 304, "Instances", WarningObject);
	instance_create_layer(3104, 304, "Instances", WarningObject);
	instance_create_layer(3136, 304, "Instances", WarningObject);
	instance_create_layer(3168, 304, "Instances", WarningObject);
	instance_create_layer(3248, 304, "Instances", WarningObject);
	instance_create_layer(3280, 304, "Instances", WarningObject);
	instance_create_layer(3312, 304, "Instances", WarningObject);
	
	alarm[0] = 120;
}

GroundPoundAOE = function()
{
	PlayerObject.TakeDamage(25);
}

OpenGates = function()
{
	var gates = [instance_position(2784, 304, AutomaticGateObject), instance_position(2784, 320, AutomaticGateObject), instance_position(2784, 336, AutomaticGateObject)];
	
	for(var i = 0; i < array_length(gates); i++)
	{
		instance_destroy(gates[i]);
	}
}
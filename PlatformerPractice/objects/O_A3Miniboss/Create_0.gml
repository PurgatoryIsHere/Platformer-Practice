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
		
		global.isBossAlive = false; // Unlocks gate
		
		DropKeyPiece();
		OpenGates();
		
		instance_destroy(instance_position(1312, 384, O_Ground));
		instance_destroy(instance_position(1328, 384, O_Ground));
		instance_create_layer(1312, 384, "Instances", O_BreakableBlock);
		instance_create_layer(1328, 384, "Instances", O_BreakableBlock);
		
		instance_destroy(self);
	}
	
	else if(boss_health <= 30 && phase == 1)
	{
		//push player off platform
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
		
		alarm[1] = 60;
	}
	
	boss_i_frame_timer = 32; // Standard amount of i-frames; can be changed for each boss
}

DropKeyPiece = function() // Spawns a keypiece
{
	instance_create_layer(1040, 352, "Instances", O_A7KeyPiece);
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
		instance_create_layer(irandom_range(816, 1248), 384, "Instances", O_GroundEnemy_ES);
    }
}

Pillar_Drop_1 = function()
{
	instance_create_layer(800, 304, "Instances", O_Warning);
	instance_create_layer(880, 304, "Instances", O_Warning);
	instance_create_layer(1152, 304, "Instances", O_Warning);
	instance_create_layer(1232, 304, "Instances", O_Warning);
	
	alarm[0] = 90;
}

Pillar_Drop_2 = function()
{
	instance_create_layer(768, 304, "Instances", O_Warning);
	instance_create_layer(800, 304, "Instances", O_Warning);
	instance_create_layer(832, 304, "Instances", O_Warning);
	instance_create_layer(912, 304, "Instances", O_Warning);
	instance_create_layer(944, 304, "Instances", O_Warning);
	instance_create_layer(976, 304, "Instances", O_Warning);
	instance_create_layer(1040, 304, "Instances", O_Warning);
	instance_create_layer(1072, 304, "Instances", O_Warning);
	instance_create_layer(1104, 304, "Instances", O_Warning);
	instance_create_layer(1184, 304, "Instances", O_Warning);
	instance_create_layer(1216, 304, "Instances", O_Warning);
	instance_create_layer(1248, 304, "Instances", O_Warning);

	
	alarm[0] = 120;
}

GroundPoundAOE = function()
{
	O_Player.TakeDamage(25);
}

OpenGates = function()
{
	var gates = [
	instance_position(720, 304, O_AutoGate), instance_position(720, 320, O_AutoGate), 
	instance_position(720, 336, O_AutoGate), instance_position(672, 288, O_AutoGate),
	instance_position(688, 288, O_AutoGate), instance_position(704, 288, O_AutoGate),
	instance_position(304, 112, O_AutoGate), instance_position(304, 128, O_AutoGate),
	instance_position(304, 144, O_AutoGate)];
	
	for(var i = 0; i < array_length(gates); i++)
	{
		instance_destroy(gates[i]);
	}
}
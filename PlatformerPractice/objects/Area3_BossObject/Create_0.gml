/// @description Basic boss mechanics
// You can write your code in this editor

global.isBossAlive = true; // variable to unlock gate for the player once false
boss_health = 90; // Health for boss; can be changed for each boss
boss_i_frame_timer = 0; // I-frames the boss gets upon taking damage

dir = 1; // Starting Direction; can be changed depending on where boss will spawn

global.drops_ability = true; // Whether or not the boss drops an ability for the player

TakeDamage = function(damage) // Basic damage calculation; aspects can be changed for each boss
{
	boss_health -= damage;
	
	if(boss_health <= 0)
	{
		with(Area3_BossMinionObject)
		{
			instance_destroy(self)
		}
		
		with(CollapsibleGroundObject)
		{
			self.alarm_triggered = true;
			self.alarm[0] = 30;
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
		
		with(Area3_BossMinionObject)
		{
			instance_destroy(self)
		}
		
		with(CollapsibleGroundObject)
		{
			self.alarm_triggered = true;
			self.alarm[0] = 30;
			self.shake_time = 30;
		}
		
		wave_spawned = false;
		wave_respawning = true;
		pillars_dropped = false;
		
		alarm[1] = 60;
	}
	
	else if(boss_health <= 60 && phase == 1)
	{
		//push player off platform
		phase = 2;
		
		with(Area3_BossMinionObject)
		{
			instance_destroy(self)
		}
		
		with(CollapsibleGroundObject)
		{
			self.alarm_triggered = true;
			self.alarm[0] = 30;
			self.shake_time = 30;
		}
		
		wave_spawned = false;
		wave_respawning = true;
		pillars_dropped = false;
		
		alarm[1] = 60;
	}
	
	boss_i_frame_timer = 32; // Standard amount of i-frames; can be changed for each boss
}

DropAbility = function() // Spawns the ability that a boss would drop upon defeat
{
	// Have a place in the boss arena that the ability will spawn at; likely the center of the arena will do
	instance_create_layer(320, 928, "Instances", GroundPoundUnlockObject); // Change x and y to the specified coordinates
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
        instance_create_layer(irandom_range(96, 560), 944, "Instances", Area3_BossMinionObject);
    }
}

Pillar_Drop_1 = function()
{
	instance_create_layer(112, 864, "Instances", WarningObject);
	instance_create_layer(192, 864, "Instances", WarningObject);
	instance_create_layer(400, 864, "Instances", WarningObject);
	instance_create_layer(480, 864, "Instances", WarningObject);
	
	alarm[0] = 90;
}

Pillar_Drop_2 = function()
{
	instance_create_layer(96, 864, "Instances", WarningObject);
	instance_create_layer(176, 864, "Instances", WarningObject);
	instance_create_layer(256, 864, "Instances", WarningObject);
	instance_create_layer(336, 864, "Instances", WarningObject);
	instance_create_layer(416, 864, "Instances", WarningObject);
	instance_create_layer(496, 864, "Instances", WarningObject);
	
	alarm[0] = 90;
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
	
	alarm[0] = 120;
}

//Pillar_Drop_3()

GroundPoundAOE = function()
{
	PlayerObject.TakeDamage(25);
}

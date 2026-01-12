
/// @description Initialize Variables
// You can write your code in this editor

boss_phase = 2;

boss_health = 100; // Health for boss; can be changed for each boss
boss_i_frame_timer = 0; // I-frames the boss gets upon taking damage


alarm_zero_started = false
alarm_three_started = false

/* Function to help with teleporting the boss to the correct location depending on phase
	or handling anything else relating to a specific phase */
PhaseSwitch = function()
{
	if(boss_phase == 2)
	{
		var x_locations = [272, 288, 304, 320, 336, 352, 368, 384, 400, 416];
		
		for(var i = 0; i < array_length(x_locations); i ++)
		{
			instance_create_layer(x_locations[i], 864, "Instances", O_BreakableBlock);
		}
		
		x = 320;
		y = 800;
		
		wave = 1;
	}
	
	else if(boss_phase == 3)
	{
		
	}
	
	else if(boss_phase == 4)
	{
		
	}
}

//Area 1 Boss Mimic
dir = 1;
y_speed = 0;

move_timer = 0
jump = false
jump_count = 0;
doubleJump = false
groundPound = false
has_pounded = false;
dash = false;
has_dashed = false
shoot = false
bullet_count = 12
bullet_wave = 1

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
		with(O_SpawnableEnemyParent)
		{
			instance_destroy(self);
		}
		
		with(O_EnemyParent)
		{
			instance_destroy(self);
		}
		
		with(O_Pillar)
		{
			self.alarm_triggered = true;
			self.alarm[0] = 30;
			self.shake_time = 30;
		}
		
		with(O_DashBreakBlock)
		{
			instance_destroy(self);
		}
		
		instance_destroy(self);
	}
	
	else if(boss_health <= 50 && wave == 1)
	{
		//push player off platform
		wave = 2;
		
		with(O_SpawnableEnemyParent)
		{
			instance_destroy(self);
		}
		
		with(O_EnemyParent)
		{
			instance_destroy(self);
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
		
		alarm[2] = 90;
	}
	
	boss_i_frame_timer = 32; // Standard amount of i-frames; can be changed for each boss
}

wave = 1;
wave_spawned = false;
wave_respawning = false;
pillars_dropped = false;
pillar_timer = 0;
pillar_timeout = 600; // time before pillars start collapsing

Spawn_Wave = function(enemy_type, enemy_count)
{
	var enemy_object;
	
	switch(enemy_type)
    {
        case "ground":
		
            enemy_object = O_GroundEnemy_ES;
            break;

        case "flying":
		
            enemy_object = O_FlyingEnemy_ES;
            break;
    }
	
	var spawn_y = 1136;
	
	if(enemy_object == O_FlyingEnemy_ES)
	{
		spawn_y -= 48;
	}
	
	for (var i = 0; i < enemy_count; i++)
    {
		instance_create_layer(irandom_range(112, 584), spawn_y, "Instances", enemy_object);
    }
}

Pillar_Drop_1 = function()
{
	instance_create_layer(16, 1056, "Instances", O_Warning);
	instance_create_layer(96, 1056, "Instances", O_Warning);
	instance_create_layer(176, 1056, "Instances", O_Warning);
	instance_create_layer(464, 1056, "Instances", O_Warning);
	instance_create_layer(544, 1056, "Instances", O_Warning);
	instance_create_layer(624, 1056, "Instances", O_Warning);
	
	alarm[1] = 90;
}

Pillar_Drop_2 = function()
{
	instance_create_layer(16, 1056, "Instances", O_Warning);
	instance_create_layer(96, 1056, "Instances", O_Warning);
	instance_create_layer(176, 1056, "Instances", O_Warning);
	instance_create_layer(464, 1056, "Instances", O_Warning);
	instance_create_layer(544, 1056, "Instances", O_Warning);
	instance_create_layer(624, 1056, "Instances", O_Warning);
	
	alarm[1] = 120;
}


GroundPoundAOE = function()
{
	PhaseTwoDamage(25);
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

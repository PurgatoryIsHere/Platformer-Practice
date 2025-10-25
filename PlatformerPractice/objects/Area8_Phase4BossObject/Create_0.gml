/// @description Initialize variables
// You can write your code in this editor

boss_health = 90
;
randomise()
pattern = 0;

//Circle Burst
circle_count = 12;
burst_wave = 1;

//Spiral Spray
spiral_count = 0;
spiral_direction = 0;

//Chunk Shot
chunk_count = 7;
chunk_wave = 1;
chunk_direction = -45;

// Start the first alarm
alarm[0] = 30;

phase = 1;
shield_cores = 1;
shield_active = true;

PhaseChange = function()
{
	switch(phase)
	{
		case 1:
		
			phase = 2;
			boss_health = 90;
			shield_cores = 2;
			shield_active = true;
			break;
			
		case 2:
		
			phase = 3;
			boss_health = 90;
			shield_cores = 3;
			shield_active = true;
			break;
	}	
}

CoreDestruction = function()
{
	shield_cores -= 1;
	
	if(shield_cores == 0)
	{
		shield_active = false;
		
		with(TimerGateObject)
		{
			instance_destroy(self);
		}
	}
}

TakeDamage = function(current_phase)
{
	if(current_phase == 1)
	{
		TakeDamage_Phase1();
	}
	
	else if(current_phase == 2)
	{
		TakeDamage_Phase2();
	}
	
	else if(current_phase == 3)
	{
		TakeDamage_Phase3();
	}
}

TakeDamage_Phase1 = function()
{
	boss_health -= 30;
	
	if(boss_health == 0)
	{
		PhaseChange();
	}
}

TakeDamage_Phase2 = function()
{
	boss_health -= 15;
	
	if(boss_health == 0)
	{
		PhaseChange();
	}
	
	else if(boss_health == 45)
	{
		// Push player back, reactivate shield, regenerate cores
		shield_cores = 2;
		shield_active = true;
	}
}

TakeDamage_Phase3 = function()
{
	boss_health -= 10;
	
	if(boss_health == 0)
	{
		// Trigger death animation
	}
	
	else if(boss_health == 30)
	{
		// Push player back, reactivate shield, regenerate cores
		shield_cores = 3;
		shield_active = true;
	}
	
	else if(boss_health == 60)
	{
		// Push player back, reactivate shield, regenerate cores
		shield_cores = 3;
		shield_active = true;
	}
}
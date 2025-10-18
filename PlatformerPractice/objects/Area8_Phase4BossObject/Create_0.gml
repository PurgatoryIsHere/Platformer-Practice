/// @description Initialize variables
// You can write your code in this editor

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
			shield_cores = 2;
			break;
			
		case 2:
		
			phase = 3;
			shield_cores = 3;
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
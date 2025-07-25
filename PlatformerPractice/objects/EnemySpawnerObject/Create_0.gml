/// @description Initialize
// You can write your code in this editor

activated = false;
wave_spawned = false;
condition_unmet = true; // true if condition has not been met, false if it has

num_waves = 0;
current_wave = 0;
waves = [];

Spawn_Wave = function(spawn_x_min, spawn_x_max, spawn_y)
{	
	for (var i = 0; i < array_length(waves[current_wave]); i++)
    {
		if(waves[current_wave][i] == ES_FreeFlyEnemyObject)
		{
			spawn_y -= 48;
		}
		
        instance_create_layer(irandom_range(spawn_x_min, spawn_x_max), spawn_y, "Instances", waves[current_wave][i]);
		
		if(waves[current_wave][i] == ES_FreeFlyEnemyObject)
		{
			spawn_y += 48;
		}
    }
	
	wave_spawned = true;
}
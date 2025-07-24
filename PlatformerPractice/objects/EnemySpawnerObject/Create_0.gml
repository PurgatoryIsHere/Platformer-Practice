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
        instance_create_layer(irandom_range(spawn_x_min, spawn_x_max), spawn_y, "Instances", waves[current_wave][i]);
    }
	
	wave_spawned = true;
}
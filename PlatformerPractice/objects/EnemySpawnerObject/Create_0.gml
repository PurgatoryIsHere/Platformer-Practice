/// @description Initialize
// You can write your code in this editor

activated = false;
wave_spawned = false;
enemy_count = 0;
has_condition = false;
condition_unmet = true; // true if condition has not been met, false if it has

Spawn_Wave = function(spawn_x_min, spawn_x_max, spawn_y)
{
	for (var i = 0; i < enemy_count; i++)
    {
        instance_create_layer(irandom_range(spawn_x_min, spawn_x_max), spawn_y, "Instances", Area3_BossMinionObject);
    }
	
	wave_spawned = true;
}
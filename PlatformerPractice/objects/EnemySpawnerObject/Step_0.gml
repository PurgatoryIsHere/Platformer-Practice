/// @description Enemy spawning and condition checking
// You can write your code in this editor

if(place_meeting(x, y, PlayerObject) && !activated)
{
	activated = true;
}

if(activated)
{
	// Spawn wave
	if(!wave_spawned && (current_wave < num_waves))
	{
		Spawn_Wave(spawn_x_min, spawn_x_max, spawn_y);
	}
	
	// Check if all enemies in the wave have been defeated
    if (!instance_exists(Area3_BossMinionObject) && wave_spawned)
    {
        current_wave += 1;
        wave_spawned = false;
    }
	
	// Area 3 enemy spawner condition
	if(current_area == 3 && tag == "heart_piece_combat")
	{
		condition_unmet = instance_exists(Area3_BossMinionObject);
		
		if(!condition_unmet)
		{
			instance_create_layer(672, 80, "Instances", HeartPieceObject);
			
			var auto_gate1 = instance_position(816, 80, AutomaticGateObject);
			var auto_gate2 = instance_position(816, 96, AutomaticGateObject);
			
			instance_destroy(auto_gate1);
			instance_destroy(auto_gate2);
			
			activated = false;
			instance_destroy(self);
		}
	}
	
	// Area 4 enemy spawner conditions
}
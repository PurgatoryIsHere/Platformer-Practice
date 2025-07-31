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
    if (!instance_exists(SpawnableEnemyParentObject) && wave_spawned)
    {
        current_wave += 1;
        wave_spawned = false;
    }
	
	
	// Conditionals for when all waves have been cleared
	if(current_wave == num_waves)
	{
		switch(current_area)
		{
			// Area 3
			case 3:
		
				if(tag == "heart_piece_combat")
				{
					condition_unmet = instance_exists(ES_GroundEnemyObject);
		
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
			
			
			// Area 4
			case 4:
		
			if(tag == "layer_1")
			{
				condition_unmet = instance_exists(SpawnableEnemyParentObject);
			
				if(!condition_unmet)
				{
					var auto_gate1 = instance_position(432, 176, AutomaticGateObject);
					var auto_gate2 = instance_position(448, 176, AutomaticGateObject);
				
					instance_destroy(auto_gate1);
					instance_destroy(auto_gate2);
				
					instance_create_layer(432, 176, "Instances", BreakableBlockObject);
					instance_create_layer(448, 176, "Instances", BreakableBlockObject);
				
					instance_destroy(self);
				}
			}
		
			else if(tag == "layer_2")
			{
				condition_unmet = instance_exists(SpawnableEnemyParentObject);
			
				if(!condition_unmet)
				{
					var auto_gate1 = instance_position(240, 288, AutomaticGateObject);
					var auto_gate2 = instance_position(256, 288, AutomaticGateObject);
				
					instance_destroy(auto_gate1);
					instance_destroy(auto_gate2);
				
					instance_create_layer(240, 288, "Instances", BreakableBlockObject);
					instance_create_layer(256, 288, "Instances", BreakableBlockObject);
				
					instance_destroy(self);
				}
			}
			
			else if(tag == "layer_3")
			{
				condition_unmet = instance_exists(SpawnableEnemyParentObject);
			
				if(!condition_unmet)
				{
					var auto_gate1 = instance_position(448, 720, AutomaticGateObject);
					var auto_gate2 = instance_position(464, 720, AutomaticGateObject);
					var auto_gate3 = instance_position(480, 720, AutomaticGateObject);
				
					instance_destroy(auto_gate1);
					instance_destroy(auto_gate2);
					instance_destroy(auto_gate3);
					
					instance_create_layer(384, 816, "Instances", ShelfObject);
					instance_create_layer(400, 816, "Instances", ShelfObject);
					instance_create_layer(448, 784, "Instances", ShelfObject);
					instance_create_layer(464, 784, "Instances", ShelfObject);
				
					instance_destroy(self);
				}
			}
			
			else if(tag == "layer_4")
			{
				condition_unmet = instance_exists(SpawnableEnemyParentObject);
			
				if(!condition_unmet)
				{
					var auto_gate1 = instance_position(352, 1184, AutomaticGateObject);
					var auto_gate2 = instance_position(352, 1200, AutomaticGateObject);
				
					instance_destroy(auto_gate1);
					instance_destroy(auto_gate2);
				
					instance_destroy(self);
				}
			}
			
			else if(tag == "layer_5")
			{
				condition_unmet = instance_exists(SpawnableEnemyParentObject);
			
				if(!condition_unmet)
				{
					var auto_gate1 = instance_position(496, 1280, AutomaticGateObject);
					var auto_gate2 = instance_position(496, 1296, AutomaticGateObject);
					var auto_gate3 = instance_position(496, 1312, AutomaticGateObject);
				
					instance_destroy(auto_gate1);
					instance_destroy(auto_gate2);
					instance_destroy(auto_gate3);
				
					instance_destroy(self);
				}
			}
		}
	}
}
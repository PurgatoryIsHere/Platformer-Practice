/// @description Enemy spawning and condition checking
// You can write your code in this editor

if(place_meeting(x, y, O_Player) && !activated)
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
    if (!instance_exists(O_SpawnableEnemyParent) && wave_spawned)
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
					condition_unmet = instance_exists(O_GroundEnemy_ES);
		
					if(!condition_unmet)
					{
						var heart_piece = instance_create_layer(672, 80, "Instances", O_HeartPieceFragment);
						heart_piece.area = 2;
						heart_piece.key = 1;
						
						auto_gates = [instance_position(816, 80, O_AutoGate), instance_position(816, 96, O_AutoGate)];
			
						Open_Gates();
			
						instance_destroy(self);
					}
				}
			
			
			// Area 4
			case 4:
		
				if(tag == "layer_1")
				{
					condition_unmet = instance_exists(O_SpawnableEnemyParent);
			
					if(!condition_unmet)
					{
						auto_gates = [instance_position(432, 176, O_AutoGate), instance_position(448, 176, O_AutoGate)];
						
						Open_Gates();
				
						instance_create_layer(432, 176, "Instances", O_BreakableBlock);
						instance_create_layer(448, 176, "Instances", O_BreakableBlock);
				
						instance_destroy(self);
					}
				}
		
				else if(tag == "layer_2")
				{
					condition_unmet = instance_exists(O_SpawnableEnemyParent);
			
					if(!condition_unmet)
					{
						auto_gates = [instance_position(240, 288, O_AutoGate), instance_position(256, 288, O_AutoGate)];
						
						Open_Gates();
				
						instance_create_layer(240, 288, "Instances", O_BreakableBlock);
						instance_create_layer(256, 288, "Instances", O_BreakableBlock);
				
						instance_destroy(self);
					}
				}
			
				else if(tag == "layer_3")
				{
					condition_unmet = instance_exists(O_SpawnableEnemyParent);
			
					if(!condition_unmet)
					{
						auto_gates = [
						instance_position(448, 720, O_AutoGate), instance_position(464, 720, O_AutoGate),
						instance_position(480, 720, O_AutoGate)];
						
						Open_Gates();
					
						instance_create_layer(384, 816, "Instances", O_Shelf);
						instance_create_layer(400, 816, "Instances", O_Shelf);
						instance_create_layer(448, 784, "Instances", O_Shelf);
						instance_create_layer(464, 784, "Instances", O_Shelf);
				
						instance_destroy(self);
					}
				}
			
				else if(tag == "layer_4")
				{
					condition_unmet = instance_exists(O_SpawnableEnemyParent);
			
					if(!condition_unmet)
					{
						auto_gates = [instance_position(352, 1184, O_AutoGate), instance_position(352, 1200, O_AutoGate)];
						
						Open_Gates();
				
						instance_destroy(self);
					}
				}
			
				else if(tag == "layer_5")
				{
					condition_unmet = instance_exists(O_SpawnableEnemyParent);
			
					if(!condition_unmet)
					{
						auto_gates = [
						instance_position(496, 1280, O_AutoGate), instance_position(496, 1296, O_AutoGate),
						instance_position(496, 1312, O_AutoGate)];
						
						Open_Gates();
				
						instance_destroy(self);
					}
				}
				
			//Area 6
			case 6:
			
				if(tag == "key_piece_1")
				{
					condition_unmet = instance_exists(O_SpawnableEnemyParent);
					
					if(!condition_unmet)
					{
						instance_create_layer(1440, 768, "Instances", O_KeyPiece);
						
						auto_gates = [
						instance_position(1344, 768, O_AutoGate), instance_position(1344, 784, O_AutoGate),
						instance_position(1408, 672, O_AutoGate), instance_position(1424, 672, O_AutoGate),
						instance_position(1440, 672, O_AutoGate), instance_position(1456, 672, O_AutoGate),
						instance_position(1536, 768, O_AutoGate), instance_position(1536, 784, O_AutoGate)];
						
						Open_Gates();
						
						instance_destroy(self);
					}
				}
				
			//Area 7
			case 7:
			
				if(tag == "area_1_section_arena")
				{
					condition_unmet = instance_exists(O_SpawnableEnemyParent);
					
					if(!condition_unmet)
					{	
						auto_gates = [
						instance_position(1344, 432.099, O_AutoGate), instance_position(1344, 448.099, O_AutoGate),
						instance_position(1344, 464.099, O_AutoGate)];
						
						Open_Gates();
						
						instance_destroy(self);
					}
				}
				
				else if(tag == "heart_piece_1")
				{
					condition_unmet = instance_exists(O_SpawnableEnemyParent);
					
					if(!condition_unmet)
					{
						var heart_piece = instance_create_layer(1920, 128, "Instances", O_A7HeartPiece);
						heart_piece.area = 6;
						heart_piece.key = 0;
						
						auto_gates = [
						instance_position(1760, 112.099, O_AutoGate), 
						instance_position(1760, 128.099, O_AutoGate),
						instance_position(1760, 144.099, O_AutoGate)];
						
						Open_Gates();
						
						instance_destroy(self);
					}
				}
				
				else if(tag == "area_3_section_arena")
				{
					condition_unmet = instance_exists(O_SpawnableEnemyParent);
					
					if(!condition_unmet)
					{	
						auto_gates = [
						instance_position(144, 688, O_AutoGate), instance_position(160, 688, O_AutoGate)];
						
						Open_Gates();
						
						instance_create_layer(144, 688, "Instances", O_BreakableBlock);
						instance_create_layer(160, 688, "Instances", O_BreakableBlock);
						
						instance_destroy(self);
					}
				}
				
				else if(tag == "heart_piece_2")
				{
					condition_unmet = instance_exists(O_SpawnableEnemyParent);
					
					if(!condition_unmet)
					{	
						auto_gates = [instance_position(1168, 704, O_AutoGate), instance_position(1184, 704, O_AutoGate)];
						
						Open_Gates();
						
						instance_create_layer(1168, 688, "Instances", O_Shelf);
						instance_create_layer(1168, 736, "Instances", O_Shelf);
						instance_create_layer(1168, 784, "Instances", O_Shelf);
						
						instance_destroy(self);
					}
				}
		}
	}
}
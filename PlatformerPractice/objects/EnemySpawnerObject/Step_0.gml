/// @description Enemy spawning and condition checking
// You can write your code in this editor

if(place_meeting(x, y, PlayerObject) && !activated)
{
	activated = true;
}

if(activated)
{
	if(!wave_spawned)
	{
		if(current_area == 3 && tag == "heart_piece_combat")
		{
			enemy_count = 3;
		}
		
		Spawn_Wave(560, 768, 112);
	}
	
	if(has_condition)
	{
		condition_unmet = instance_exists(Area3_BossMinionObject);
		
		if(!condition_unmet && current_area == 3 && tag == "heart_piece_combat")
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
}
/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x, y, PlayerObject))
{
	global.heart_pieces_collected += 1;
	instance_destroy(self);
	
	var required = global.heart_pieces_to_collect[room];
	
	if(global.heart_pieces_collected == required && !global.all_heart_pieces_collected)
	{
		global.all_heart_pieces_collected = true;
		global.player_max_health += 10;
		global.player_health += 10;
	}
}

// Include draw event saying something along the lines of "Maximum Health Increased!"
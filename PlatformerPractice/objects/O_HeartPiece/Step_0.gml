/// @description Max Health Increase
// You can write your code in this editor

if(!global.collected_heart_piece[area][key] && place_meeting(x, y, O_Player))
{
	global.heart_pieces_collected += 1;
	global.collected_heart_piece[area][key] = true;
	
	var required = global.heart_pieces_to_collect[room];
	
	if(global.heart_pieces_collected == required)
	{
		global.player_max_health += 10;
		global.player_health += 10;
	}
	
	instance_destroy(self);

	// Include draw event saying something along the lines of "Maximum Health Increased!"
}

else if(global.collected_heart_piece[area][key])
{
	sprite_index = S_HeartPiece_Inactive;
}
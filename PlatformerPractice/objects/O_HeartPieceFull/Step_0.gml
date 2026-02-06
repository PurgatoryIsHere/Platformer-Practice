/// @description Insert description here
// You can write your code in this editor
if(!global.collected_heart_piece[area][key] && place_meeting(x, y, O_Player))
{
	global.collected_heart_piece[area][key] = true;
	global.player_max_health += 15;
	instance_destroy(self);
}

else if(global.collected_heart_piece[area][key])
{
	instance_destroy(self);
}
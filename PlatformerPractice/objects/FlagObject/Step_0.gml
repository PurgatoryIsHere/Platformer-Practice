/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y - 1, PlayerObject) 
{
	room_goto_next()
	global.player_health = global.player_max_health;
	global.heart_pieces_collected = 0;
	global.ability_collected = false;
}
/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y - 1, O_Player) 
{
	room_goto_next()
	global.player_health = global.player_max_health;
	global.lives = 3;
	global.heart_pieces_collected = 0;
	global.all_heart_pieces_collected = false;
	global.ability_collected = false;
	global.checkpoint_x = noone;
	global.checkpoint_y = noone;
}
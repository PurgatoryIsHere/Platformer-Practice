/// @description Insert description here
// You can write your code in this editor

global.checkpoint_x = noone;
global.checkpoint_y = noone;
global.respawn_queue = [];

room_goto_next()

global.player_health = global.player_max_health;
global.lives = 3;
global.ability_collected = false;
	
if (room_number < 8)
{
	global.levelUnlocked[room_number + 1] = true;
}
	
save_game()
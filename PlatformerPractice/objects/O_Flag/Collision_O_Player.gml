/// @description Insert description here
// You can write your code in this editor

global.area_index = noone;
global.checkpoint_x = noone;
global.checkpoint_y = noone;
global.respawn_queue = [];

if(dest == noone)
{
	room_goto_next()
}

else
{
	room_goto(dest);
}

global.player_health = global.player_max_health;
global.lives = 3;
global.ability_collected = false;
	
if (room_number < 8 && room_number != noone)
{
	global.levelUnlocked[room_number + 1] = true;
}
	
save_game()
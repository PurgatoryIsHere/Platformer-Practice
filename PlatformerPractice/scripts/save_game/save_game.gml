// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_game()
{
	var buffer = buffer_create(1024, buffer_grow, 1);
	
	buffer_write(buffer, buffer_bool, global.levelUnlocked[0]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[1]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[2]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[3]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[4]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[5]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[6]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[7]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[8]);
	
	buffer_save(buffer, "save.dat");
	
	buffer_delete(buffer);
}
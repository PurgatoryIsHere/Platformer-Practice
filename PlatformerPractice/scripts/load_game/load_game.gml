// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function load_game()
{
	if (file_exists("save.dat"))
	{
		var buffer = buffer_load("save.dat");
		buffer_seek(buffer, buffer_seek_start, 0);
		
		global.levelUnlocked[0] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[1] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[2] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[3] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[4] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[5] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[6] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[7] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[8] = buffer_read(buffer, buffer_bool);
		
		buffer_delete(buffer)
	}
	else
	{
		global.levelUnlocked[0] = true;
		global.levelUnlocked[1] = false;
		global.levelUnlocked[2] = false;
		global.levelUnlocked[3] = false;
		global.levelUnlocked[4] = false;
		global.levelUnlocked[5] = false;
		global.levelUnlocked[6] = false;
		global.levelUnlocked[7] = false;
		global.levelUnlocked[8] = false;
	}
}
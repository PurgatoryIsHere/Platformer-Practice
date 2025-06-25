/// @description Initial Save at Start of Room
// You can write your code in this editor

if (!file_exists("checkpoint.ini"))
		{
			ini_open("checkpoint.ini");
			ini_write_real("player", "x", other.x);
			ini_write_real("player", "y", other.y);
			ini_close();
		}
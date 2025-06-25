/// @description Create Checkpoint
// You can write your code in this editor

sprite_index = CheckpointActiveSprite

ini_open("checkpoint.ini");
ini_write_real("player", "x", other.x);
ini_write_real("player", "y", other.y);
ini_close();
/// @description Delete Existing Checkpoint
// You can write your code in this editor

if (file_exists("checkpoint.ini"))
{
        file_delete("checkpoint.ini");
}
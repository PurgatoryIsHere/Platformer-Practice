/// @description Create Checkpoint
// You can write your code in this editor

if(!checkpoint_reached)
{
	checkpoint_reached = true;
	sprite_index = S_Checkpoint_Active;
	global.checkpoint_x = x;
	global.checkpoint_y = y;
	audio_play_sound(_243701__ertfelda__correct, 1, false)
}
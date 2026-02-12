/// @description Increment variable in KeyObject
// You can write your code in this editor

if(place_meeting(x, y, O_Player))
{
	audio_play_sound(_243701__ertfelda__correct, 1, false)
	O_Key.key_pieces_collected += 1;
	instance_destroy(self);
}
/// @description Insert description here
// You can write your code in this editor

if(!instance_exists(O_A5Boss))
{
	audio_play_sound(_126041__mhtaylor67__gate_latch, 2, false)
	instance_destroy(self);
}
	

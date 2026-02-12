 /// @description Key Spawn Conditions
// You can write your code in this editor

if(key_pieces_collected == key_pieces_to_collect || global.area7_key_pieces_collected == key_pieces_to_collect)
{
	sprite_index = S_Key_Active;
	key_spawned = true;
}

if(key_spawned && place_meeting(x, y, O_Player))
{
	audio_play_sound(_243701__ertfelda__correct, 1, false)
	open_gate();
	instance_destroy(self);
}
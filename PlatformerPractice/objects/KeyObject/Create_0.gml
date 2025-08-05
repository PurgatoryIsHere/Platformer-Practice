/// @description Initialize
// You can write your code in this editor

key_pieces_to_collect = 0;
key_pieces_collected = 0;
sprite_index = KeySprite_inactive;

key_spawned = false;
corresponding_gates = [];

open_gate = function()
{
	for(var i = 0; i < array_length(corresponding_gates); i++)
	{
		instance_destroy(corresponding_gates[i]);
	}
}
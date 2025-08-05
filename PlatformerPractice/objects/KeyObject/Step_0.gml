/// @description Key Spawn Conditions
// You can write your code in this editor

if(key_pieces_collected == key_pieces_to_collect)
{
	sprite_index = KeySprite_Active;
	key_spawned = true;
}

if(key_spawned && place_meeting(x, y, PlayerObject))
{
	open_gate();
	instance_destroy(self);
}
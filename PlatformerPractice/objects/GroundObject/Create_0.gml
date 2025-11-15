 /// @description Insert description here
// You can write your code in this editor


if (sprite_index == TopGroundSprite && (place_meeting(x, y - 1, GroundObject) || place_meeting(x, y - 1, HiddenWallObject)))
{
	sprite_index = GroundSprite	
}
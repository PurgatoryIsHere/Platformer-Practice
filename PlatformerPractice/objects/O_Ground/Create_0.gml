 /// @description Insert description here
// You can write your code in this editor


if (sprite_index == S_TopGround && (place_meeting(x, y - 1, O_Ground) || place_meeting(x, y - 1, O_HiddenWall)))
{
	sprite_index = S_Ground	
}
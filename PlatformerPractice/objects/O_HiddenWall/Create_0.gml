 /// @description Initialize
// You can write your code in this editor

discovered = false;
is_fading = false;

tag = "";

if (sprite_index == S_TopGround && (place_meeting(x, y - 1, O_Ground) || place_meeting(x, y - 1, O_HiddenWall)))
{
	sprite_index = S_Ground	
}     
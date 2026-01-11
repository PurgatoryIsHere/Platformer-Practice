/// @description Initialize detector
// You can write your code in this editor

tag = "";
entrance_dir = noone; // which direction the player comes from
activated = false;

DirectionCheck = function()
{
	if(entrance_dir == "above")
	{
		return y < O_Player.y;
	}
	
	else if(entrance_dir == "below")
	{
		return y > O_Player.y;
	}
	
	else if(entrance_dir == "left")
	{
		return x < O_Player.x;
	}
	
	else if(entrance_dir == "right")
	{
		return x > O_Player.x;
	}
}
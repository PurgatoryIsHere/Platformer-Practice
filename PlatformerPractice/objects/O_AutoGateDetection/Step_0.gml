/// @description Check if detector is triggered
// You can write your code in this editor

if(!activated)
{
	var x1 = x - sprite_width;
    var y1 = y - sprite_height;
    var x2 = x + sprite_width;
    var y2 = y + sprite_height;
	
	if(collision_rectangle(x1, y1, x2, y2, O_Player, false, true)) 
	{
        activated = true;
		alarm[0] = 30;
    }
}
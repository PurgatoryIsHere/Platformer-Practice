/// @description Check if detector is triggered
// You can write your code in this editor

if(!activated)
{
	var x1 = x - O_Player.sprite_width / 8;
    var y1 = y - O_Player.sprite_height / 8;
    var x2 = x + O_Player.sprite_width / 8;
    var y2 = y + O_Player.sprite_height / 8;
	
	if(collision_rectangle(x1, y1, x2, y2, O_Player, false, true)) 
	{
        activated = true;
		alarm[0] = 30;
    }
}
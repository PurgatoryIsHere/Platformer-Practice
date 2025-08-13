/// @description Check if detector is triggered
// You can write your code in this editor

if(!activated)
{
	var x1 = x - PlayerObject.sprite_width / 8;
    var y1 = y - PlayerObject.sprite_height / 8;
    var x2 = x + PlayerObject.sprite_width / 8;
    var y2 = y + PlayerObject.sprite_height / 8;
	
	if(collision_rectangle(x1, y1, x2, y2, PlayerObject, false, true)) 
	{
        activated = true;
		alarm[0] = 30;
    }
}
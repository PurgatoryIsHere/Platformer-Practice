/// @description Break Logic
// You can write your code in this editor

if(O_Player.groundPounding) && place_meeting(x, y - sprite_height, O_Player)
{
	instance_destroy(self)	
	O_Player.groundPounding = false
}

if(O_Player.beingFired)
{
	var x1 = x - O_Player.sprite_width;
    var y1 = y - O_Player.sprite_height;
    var x2 = x + O_Player.sprite_width;
    var y2 = y + O_Player.sprite_height;

    if(collision_rectangle(x1, y1, x2, y2, O_Player, false, true)) 
	{
        instance_destroy(self);
    }
}
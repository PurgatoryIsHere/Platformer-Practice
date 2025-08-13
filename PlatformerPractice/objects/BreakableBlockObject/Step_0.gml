/// @description Break Logic
// You can write your code in this editor

if(PlayerObject.groundPounding) && place_meeting(x, y - sprite_height, PlayerObject)
{
	instance_destroy(self)	
	PlayerObject.groundPounding = false
}

if(PlayerObject.beingFired)
{
	var x1 = x - PlayerObject.sprite_width;
    var y1 = y - PlayerObject.sprite_height;
    var x2 = x + PlayerObject.sprite_width;
    var y2 = y + PlayerObject.sprite_height;

    if(collision_rectangle(x1, y1, x2, y2, PlayerObject, false, true)) 
	{
        instance_destroy(self);
    }
}
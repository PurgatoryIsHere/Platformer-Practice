/// @description Break Logic
// You can write your code in this editor

if(PlayerObject.groundPounding) && place_meeting(x, y - sprite_height, PlayerObject)
{
	instance_destroy(self)	
	PlayerObject.groundPounding = false
}

if(PlayerObject.beingFired)
{
	var px1 = x - PlayerObject.sprite_width;
    var py1 = y - PlayerObject.sprite_height;
    var px2 = x + PlayerObject.sprite_width;
    var py2 = y + PlayerObject.sprite_height;

    if(collision_rectangle(px1, py1, px2, py2, PlayerObject, false, true)) 
	{
        instance_destroy(self);
    }
}
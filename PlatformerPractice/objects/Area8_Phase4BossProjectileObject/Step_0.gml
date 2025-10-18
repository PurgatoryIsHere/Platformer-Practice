/// @description Insert description here
// You can write your code in this editor

if ((distance_to_object(Area8_Phase4BossObject) > 750) ||  (place_meeting(x, y, PlayerObject) && (PlayerObject.dashing || PlayerObject.beingFired)))
{
	instance_destroy(self);	
}
else if (place_meeting(x, y, PlayerObject))
{
	PlayerObject.TakeDamage(5);
	instance_destroy(self);
}

/// @description Projectile Logic
// You can write your code in this editor

if (place_meeting(x, y, [GroundObject, ShelfObject]) || (place_meeting(x, y, PlayerObject) && (PlayerObject.dashing || PlayerObject.beingFired)) || CannonObject.player_loaded)
{
	instance_destroy(self);	
}
else if (place_meeting(x, y, PlayerObject))
{
	PlayerObject.TakeDamage(10);
	instance_destroy(self);
}

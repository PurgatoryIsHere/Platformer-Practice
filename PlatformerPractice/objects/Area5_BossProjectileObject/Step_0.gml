 /// @description Projectile Logic
// You can write your code in this editor

if ((distance_to_object(Area5_BossObject) <= 750) ||  (place_meeting(x, y, PlayerObject) && (PlayerObject.dashing || PlayerObject.beingFired)) || CannonObject.player_loaded)
{
	instance_destroy(self);	
}
else if (place_meeting(x, y, PlayerObject))
{
	PlayerObject.TakeDamage(10);
	instance_destroy(self);
}

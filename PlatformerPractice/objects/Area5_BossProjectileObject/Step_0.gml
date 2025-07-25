/// @description Projectile Logic
// You can write your code in this editor

if (place_meeting(x, y, PlayerObject))
{
	PlayerObject.TakeDamage(10);
	instance_destroy(self);
}
else if (place_meeting(x, y, [GroundObject, ShelfObject]))
{
	instance_destroy(self);	
}
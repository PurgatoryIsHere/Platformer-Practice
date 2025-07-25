/// @description Fire Projectile at Player
// You can write your code in this editor

var target = instance_nearest(x, y, PlayerObject);

var detection_range = 500;
var target_distance = point_distance(x, y, target.x, target.y)

if (target_distance <= detection_range)
{
	with (instance_create_layer(x, y, "Instances", Area5_BossProjectileObject))
	{
		direction = point_direction(x, y, target.x, target.y);
	}
}

alarm[0] = 60 * 2;

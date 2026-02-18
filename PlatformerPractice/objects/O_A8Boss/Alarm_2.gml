/// @description Spiral Spray  
// You can write your code in this editor

if (spiral_count < 54)
{
	var _direction = spiral_direction;
	var _bullet = instance_create_layer(x, y, "Instances", O_A8BossProjectile);
	_bullet.direction = _direction;
	
	var _directionTwo = spiral_direction + 180;
	var _bulletTwo = instance_create_layer(x, y, "Instances", O_A8BossProjectile);
	_bulletTwo.direction = _directionTwo;
	
	spiral_count += 1;
	spiral_direction += 11 % 360;
	
	alarm[2] = 2
}

else
{
	spiral_count = 0;
	spiral_direction = 0;
	alarm[0] = 60
}
/// @description Shoot delay
// You can write your code in this editor

if (bullet_wave = 1)
{
	for (var j = 0; j < bullet_count; j++) 
	{
		var _direction = ((360 / bullet_count) * j) + 25;
    
		var _bullet = instance_create_layer(x, y, "Instances", Area8_BossProjectileObject);
    
		_bullet.direction = _direction;
	}
	
	bullet_wave = 2
	
	alarm[4] = 20
}

else if (bullet_wave = 2)
{
	for (var i = 0; i < bullet_count; i++) 
	{
		var _direction = ((360 / bullet_count) * i) + 15;
    
		var _bullet = instance_create_layer(x, y, "Instances", Area8_BossProjectileObject);
    
		_bullet.direction = _direction;
	}
	
	bullet_wave = 1
}

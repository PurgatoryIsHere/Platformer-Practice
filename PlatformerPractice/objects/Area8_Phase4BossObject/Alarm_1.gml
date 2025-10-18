/// @description Circle Burst
// You can write your code in this editor

//Circle burst
if (burst_wave == 1)
{
	for (var i = 0; i < circle_count; i++) 
	{
		var _direction = ((360 / circle_count) * i);
    
		var _bullet = instance_create_layer(x, y, "Instances", Area8_Phase4BossProjectileObject);
    
		_bullet.direction = _direction;
	}
	
	alarm[1] = 20
	burst_wave = 2
}

else if (burst_wave == 2)
{
	for (var j = 0; j < circle_count; j++) 
	{
		var _direction = ((360 / circle_count) * j) + 15;
    
		var _bullet = instance_create_layer(x, y, "Instances", Area8_Phase4BossProjectileObject);
    
		_bullet.direction = _direction;
	}
	
	alarm[1] = 20
	burst_wave = 3
}

else if (burst_wave == 3)
{
	for (var k = 0; k < circle_count; k++) 
	{
		var _direction = ((360 / circle_count) * k);
    
		var _bullet = instance_create_layer(x, y, "Instances", Area8_Phase4BossProjectileObject);
    
		_bullet.direction = _direction;
	}
	
	alarm[1] = 20
	burst_wave = 4
}

else if (burst_wave == 4)
{
	for (var m = 0; m < circle_count; m++) 
	{
		var _direction = ((360 / circle_count) * m) + 15;
    
		var _bullet = instance_create_layer(x, y, "Instances", Area8_Phase4BossProjectileObject);
    
		_bullet.direction = _direction;
	}
	
	alarm[0] = 60
	burst_wave = 1
}
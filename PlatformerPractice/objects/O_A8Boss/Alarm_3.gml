/// @description Chunk Shot
// You can write your code in this editor

if (chunk_wave <= 3)
{
	for (var i = 0; i < chunk_count; i++) 
	{
		var _direction = (round(point_direction(x, y, O_Player.x, O_Player.y)) + chunk_direction) % 360;
    
		var _bullet = instance_create_layer(x, y, "Instances", O_A8BossProjectile);
    
		_bullet.direction = _direction;
		
		chunk_direction += 15;
	}
	
	alarm[3] = 30;
	chunk_wave += 1;
	chunk_direction -= 9105
}
else
{
	chunk_wave = 1;
	alarm[0] = 60;
}
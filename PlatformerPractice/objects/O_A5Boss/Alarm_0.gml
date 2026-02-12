 /// @description Fire Projectile at Player
// You can write your code in this editor
var target = instance_nearest(x, y, O_Player);

if (target != noone) // Check if player exists
{
    var detection_range = 500;
    var target_distance = point_distance(x, y, target.x, target.y);
    
    if (target_distance <= detection_range)
    {
        // Store target coordinates before creating projectile
        var target_x = target.x;
        var target_y = target.y;
        var boss_x = x;
        var boss_y = y;
        
        with (instance_create_layer(boss_x, boss_y, "Instances", O_A5BossProjectile))
        {
            direction = point_direction(x, y, target_x, target_y);
        }
    }
	
	audio_play_sound(_554022__dodrio__pop, 1, false)
}

alarm[0] = 60 * 2;
/// @description Insert description here
// You can write your code in this editor

// Find closest target object within range
var detection_range = 100; // Adjust as needed
var closest_target = instance_nearest(x, y, PlayerObject)

// Check if target is in range
if (closest_target != noone) 
{
    var target_distance = point_distance(x, y, closest_target.x, closest_target.y)
	
    var collision_list = ds_list_create();
    var collisions = collision_line_list(x, y, closest_target.x, closest_target.y, all, false, true, collision_list, false);
    
    var line_blocked = false;
    for (var i = 0; i < collisions; i++) {
        var obj = collision_list[| i];
        // Only count it as blocking if it's not the player or the target
        if (obj != self && obj != closest_target) {
            line_blocked = true;
            break;
        }
    }
    
    ds_list_destroy(collision_list);
	
	// Check if target is in range
    if (target_distance <= detection_range && !line_blocked)
	{
        sees_player = true
        target_x = closest_target.x
        target_y = closest_target.y
    } 
	else
	{
		sees_player = false
		sprite_index = FreeFlyEnemyIdleSprite
	}
}

if sees_player
{
	sprite_index = FreeFlyEnemyActiveSprite
	
	var dir = point_direction(x, y, PlayerObject.x - 16, PlayerObject.y - 16);
    var spd = 2; // Example speed, adjust as needed
    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);
	
	
	// Damage the Player
	if(place_meeting(x, y, PlayerObject) && !PlayerObject.dashing && !PlayerObject.groundPounding)
	{
		if(PlayerObject.i_frame_timer == 0)
		{
			PlayerObject.TakeDamage(5);
			PlayerObject.i_frame_timer = 48
		}
	}

	// Damaged by the player
	if(place_meeting(x, y, PlayerObject) && (PlayerObject.groundPounding || PlayerObject.dashing))
	{
		instance_destroy(self)
	}

}
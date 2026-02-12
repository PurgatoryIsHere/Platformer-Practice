/// @description Chase player & damage handling
// You can write your code in this editor

if sees_player
{
	sprite_index = S_FlyingEnemy_Active
	
	var dir = point_direction(x, y, O_Player.x - 16, O_Player.y - 16);
    var spd = 2; // Example speed, adjust as needed
    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);
	
	
	// Damage the Player
	if(place_meeting(x, y, O_Player) && !O_Player.dashing && !O_Player.groundPounding)
	{
		if(O_Player.i_frame_timer == 0)
		{
			O_Player.TakeDamage(5);
			O_Player.i_frame_timer = 48
		}
	}
}

// Damaged by the player
if(place_meeting(x, y, O_Player) && (O_Player.groundPounding || O_Player.dashing))
{
	audio_play_sound(_629664__stumpbutt__retro_taking_damage_sfx2, 1, false)
	instance_destroy(self)
}
/// @description Damage Calculation
// You can write your code in this editor

// Damaging the player
if(place_meeting(x, y, O_Player) && !O_Player.dashing && !O_Player.groundPounding)
{
	if(O_Player.i_frame_timer == 0)
	{
		O_Player.TakeDamage(5);
		O_Player.i_frame_timer = 32
	}
}

// Damaged by the player
if(place_meeting(x, y - 1, O_Player) && (O_Player.groundPounding || O_Player.dashing))
{
	audio_play_sound(_629664__stumpbutt__retro_taking_damage_sfx2, 1, false)
	instance_destroy(self)
}
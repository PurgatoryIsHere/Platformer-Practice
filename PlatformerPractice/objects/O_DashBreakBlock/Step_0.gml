/// @description Break Logic
// You can write your code in this editor

if((O_Player.dashing) && (place_meeting(x + 1, y, O_Player) || place_meeting(x - 1, y, O_Player)))
{
	audio_play_sound(_267409__thestarking__building_destruction_noise_1_quiet, 1, false)
	instance_destroy(self);
}
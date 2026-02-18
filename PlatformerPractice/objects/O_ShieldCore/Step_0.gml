 /// @description Core Destruction
// You can write your code in this editor

if(place_meeting(x, y, O_Player) && (O_Player.dashing || O_Player.groundPounding))
{
	if(instance_exists(O_A8Boss))
	{
		O_A8Boss.CoreDestruction();
		audio_play_sound(_267409__thestarking__building_destruction_noise, 1, false)
		instance_destroy(self);
	}
}
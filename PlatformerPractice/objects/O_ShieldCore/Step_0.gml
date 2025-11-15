/// @description Core Destruction
// You can write your code in this editor

if(place_meeting(x, y, O_Player) && (O_Player.dashing || O_Player.groundPounding))
{
	if(instance_exists(O_A8Boss_P4))
	{
		O_A8Boss_P4.CoreDestruction();
		instance_destroy(self);
	}
}
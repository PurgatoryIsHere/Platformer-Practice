/// @description Core Destruction
// You can write your code in this editor

if(place_meeting(x, y, PlayerObject) && (PlayerObject.dashing || PlayerObject.groundPounding))
{
	if(instance_exists(Area8_Phase4BossObject))
	{
		Area8_Phase4BossObject.CoreDestruction();
		instance_destroy(self);
	}
}
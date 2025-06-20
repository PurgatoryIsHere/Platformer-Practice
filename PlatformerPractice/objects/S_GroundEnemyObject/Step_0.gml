/// @description Damage calculation
// You can write your code in this editor

if(place_meeting(x, y, PlayerObject) && (PlayerObject.groundPounding || PlayerObject.dashing))
{
	PlayerObject.TakeDamage(-5)
	PlayerObject.i_frame_timer = 0
	instance_destroy(self)
}
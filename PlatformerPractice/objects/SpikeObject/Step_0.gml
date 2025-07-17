/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y, PlayerObject) 
{
	if(PlayerObject.i_frame_timer == 0)
	{
		PlayerObject.TakeDamage(10);
		PlayerObject.i_frame_timer = 48
	}
}
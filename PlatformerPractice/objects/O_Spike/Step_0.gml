/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y, O_Player) 
{
	if(O_Player.i_frame_timer == 0)
	{
		O_Player.TakeDamage(10);
		O_Player.i_frame_timer = 48
	}
}
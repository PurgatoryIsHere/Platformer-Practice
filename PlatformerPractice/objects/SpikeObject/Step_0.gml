/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y - 1, PlayerObject) 
{
	if(global.i_frame_timer == 0)
	{
		PlayerObject.TakeDamage(10);
		global.i_frame_timer = 48
	}
	
	if(global.player_health == 0)
	{
		PlayerObject.LifeReduction();
	}
}
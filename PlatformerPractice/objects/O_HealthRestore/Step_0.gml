/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x, y, O_Player))
{
	if((global.player_health + 10) > global.player_max_health)
	{
		global.player_health = global.player_max_health;
	}
	
	else
	{
		global.player_health += 10;
	}
	
	instance_destroy(self);
}
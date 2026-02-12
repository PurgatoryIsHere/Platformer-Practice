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
	
	audio_play_sound(_243701__ertfelda__correct, 1, false)
	instance_destroy(self);
}
/// @description Insert description here
// You can write your code in this editor

if ((distance_to_object(O_A8Boss) >= 750) ||  (place_meeting(x, y, O_Player) && (O_Player.dashing || O_Player.beingFired)) || O_Cannon.player_loaded)
{
	instance_destroy(self);	
}
else if (place_meeting(x, y, O_Player))
{
	O_Player.TakeDamage(10);
	instance_destroy(self);
}

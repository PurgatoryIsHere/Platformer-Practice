/// @description Break Logic
// You can write your code in this editor

if((O_Player.dashing) && (place_meeting(x + 1, y, O_Player) || place_meeting(x - 1, y, O_Player)))
{
	instance_destroy(self);
}
/// @description Check for timer start
// You can write your code in this editor

if (place_meeting(x, y, PlayerObject) && timer_going == false)
{
	sprite_index = TimerOnSprite
	timer_going = true
	alarm[0] = room_speed * set_timer
	
	instance_deactivate_object(TimerGateObject)
}
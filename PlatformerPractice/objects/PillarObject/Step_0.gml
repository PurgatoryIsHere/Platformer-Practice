/// @description Mechanics and animation for collapse
// You can write your code in this editor
if(place_meeting(x, y - 1, PlayerObject) && !alarm_triggered)
{
	alarm_triggered = true;
    alarm[0] = 60; // Delay before destruction
    shake_time = 60;
}

shake_time = max(shake_time - 1, 0);

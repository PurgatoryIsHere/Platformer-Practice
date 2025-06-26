/// @description Mechanics and animation for collapse
// You can write your code in this editor
if(place_meeting(x, y - 1, PlayerObject) && !alarm_triggered)
{
	alarm_triggered = true;
    alarm[0] = 60; // Delay before destruction
    shake_time = 60;
}

// Visualization of collapsing tile(s)
if(shake_time > 0)
{
    shake_time--;
	
	x = x_origin;
	y = y_origin;
	
    x += random_range(-shake_magnitude, shake_magnitude);
    y += random_range(-shake_magnitude, shake_magnitude);
}


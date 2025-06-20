// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collapse_tile(target)
{
    if (!target.alarm_triggered)
    {
        target.alarm_triggered = true;
        target.alarm[0] = 60 * .2; // Delay before destruction
        target.shake_time = 60 * .2;
    }
}

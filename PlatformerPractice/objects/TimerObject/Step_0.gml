/// @description Check for timer start
// You can write your code in this editor

if(type = "")
{
	if (place_meeting(x, y, PlayerObject) && timer_going == false)
	{
		sprite_index = TimerOnSprite
		timer_going = true
		alarm[0] = room_speed * set_timer
	
		instance_deactivate_object(TimerGateObject)
	}
}


else if(type = "enemy")
{
	if(place_meeting(x, y, PlayerObject) && !timer_going)
	{
		sprite_index = TimerOnSprite;
		timer_going = true;
		alarm[1] = room_speed * set_timer;
	}
	
	if(timer_going && !instance_exists(EnemyParentObject))
	{
		instance_deactivate_object(TimerGateObject);
		instance_deactivate_object(self);
	}
}

if(timer_going)
{
	time_remaining = alarm[1] / room_speed;
}

// Screen white-out effects
if(fading_out) 
{
    fade_alpha += fade_speed;
	
    if (fade_alpha >= 1) 
	{
        fade_alpha = 1;
        fading_out = false;
		PlayerObject.input_enabled = false;
		
		room_restart();

        fading_in = true;
    }
}

if(fading_in) 
{
    fade_alpha -= fade_speed;
	
    if (fade_alpha <= 0) 
	{
        fade_alpha = 0;
        fading_in = false;
		
		PlayerObject.input_enabled = true;
    }
}
/// @description Insert description here
// You can write your code in this editor

y_speed += 0.2;
x_speed = dir * movement_speed;

if(!place_meeting(x + 16 * dir, y + 16, O_Ground) || place_meeting(x + x_speed, y, O_Ground))
{
	dir *= -1;
	image_xscale = -(dir / 2);
}

// Collision
if(place_meeting(x, y, O_Ground))
{
    for(var i = 0; i < 1000; i++)
    {
        if(!place_meeting(x + i, y, O_Ground)) { x += i; break; }
        if(!place_meeting(x - i, y, O_Ground)) { x -= i; break; }
        if(!place_meeting(x, y - i, O_Ground)) { y -= i; break; }
        if(!place_meeting(x, y + i, O_Ground)) { y += i; break; }
    }
}

if(place_meeting(x + x_speed, y, O_Ground))
{
    while(!place_meeting(x + sign(x_speed), y, O_Ground))
    {
        x += sign(x_speed);
    }
    
	x_speed = 0;
}

if(place_meeting(x, y + y_speed, O_Ground))
{
    while (!place_meeting(x, y + sign(y_speed), O_Ground))
    {
        y += sign(y_speed);
    }
    
	y_speed = 0;
}

x += x_speed;
y += y_speed;

// Damaging the player
if(place_meeting(x, y, O_Player) && !O_Player.dashing && !O_Player.groundPounding)
{
	if(O_Player.i_frame_timer == 0)
	{
		O_Player.TakeDamage(5);
		O_Player.i_frame_timer = 32
	}
}

// Damaged by the player
if(place_meeting(x, y - 1, O_Player) && (O_Player.groundPounding || O_Player.dashing))
{
	audio_play_sound(_629664__stumpbutt__retro_taking_damage_sfx2, 1, false)
	instance_destroy(self)
}
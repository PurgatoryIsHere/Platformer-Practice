
/// @description Basic boss mechanics
// You can write your code in this editor

global.isBossAlive = true; // variable to unlock gate for the player once false
boss_health = 100; // Health for boss; can be changed for each boss
boss_i_frame_timer = 0; // I-frames the boss gets upon taking damage

dir = 1; // Starting Direction; can be changed depending on where boss will spawn
y_speed = 0;

alarm[0] = 60 * 4; // Chooses a random attack action after 5 seconds.

move_timer = 0
jump = false
jump_count = 0;
doubleJump = false
groundPound = false
has_pounded = false;

TakeDamage = function(damage) // Basic damage calculation; aspects can be changed for each boss
{
	boss_health -= damage;
	
	if(boss_health == 0)
	{
		global.isBossAlive = false;
		
		var tiles_to_destroy = [instance_position(64, 320.099, O_Ground), instance_position(80, 320.099, O_Ground), instance_position(96, 320.099, O_Ground)];
		
		for(var i = 0; i < array_length(tiles_to_destroy); i++)
		{
			instance_destroy(tiles_to_destroy[i]);
		}
		
		instance_create_layer(112, 288, "Instances", O_A7KeyPiece);
		
		instance_destroy(self);
	}
	
	boss_i_frame_timer = 32; // Standard amount of i-frames; can be changed for each boss
}


function boss_move_and_collide(hsp, vsp, obj) 
{
    var steps = ceil(max(abs(hsp), abs(vsp)));
    var step_x = hsp / steps;
    var step_y = vsp / steps;

    for (var i = 0; i < steps; i++)
	{
        if (place_free(x + step_x, y))
		{
			x += step_x;
		}
		
        else 
		{
			hspeed = 0;
		}

        if (place_free(x, y + step_y))
		{
			y += step_y;
		}
		
        else 
		{
			y_speed = 0;
		}
    }
}

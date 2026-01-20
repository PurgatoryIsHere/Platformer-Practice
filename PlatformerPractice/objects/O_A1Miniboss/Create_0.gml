/// @description Basic boss mechanics
// You can write your code in this editor

boss_health = 100;
boss_battle_active = false;
boss_i_frame_timer = 0; // I-frames the boss gets upon taking damage

dir = 1;
x_speed = 0;
y_speed = 0;

alarm[0] = 60 * 4; // Chooses a random attack action after 4 seconds.

move_timer = 0
jump = false
jump_count = 0;
doubleJump = false
groundPound = false
has_pounded = false;
dash = false;
has_dashed = false

TakeDamage = function(damage) // Basic damage calculation; aspects can be changed for each boss
{
	boss_health -= damage;
	
	if(boss_health == 0)
	{	
		//BGMController.StopBossMusic();
		
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

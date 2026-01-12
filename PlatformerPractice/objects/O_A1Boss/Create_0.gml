/// @description Boss Initialization
// You can write your code in this editor

global.isBossAlive = true; // variable to unlock gate for the player once false
boss_health = 100; // Health for boss; can be changed for each boss
boss_i_frame_timer = 0; // I-frames the boss gets upon taking damage

dir = 1; // Starting Direction; can be changed depending on where boss will spawn
x_speed = 0;
y_speed = 0;

global.drops_ability = true; // Whether or not the boss drops an ability for the player

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
		global.isBossAlive = false; // Unlocks gate
		instance_destroy(self);
		
		if(global.drops_ability)
		{
			DropAbility();
		}
	}
	
	boss_i_frame_timer = 32; // Standard amount of i-frames; can be changed for each boss
}

DropAbility = function() // Spawns the ability that a boss would drop upon defeat
{
	// Have a place in the boss arena that the ability will spawn at; likely the center of the arena will do
	instance_create_layer(319, 623, "Instances", O_DoubleJumpUnlock); // Change x and y to the specified coordinates
}
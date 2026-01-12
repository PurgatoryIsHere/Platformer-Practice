/// @description Boss Initialization
// You can write your code in this editor

boss_health = 100;
boss_battle_active = false;
boss_i_frame_timer = 0;

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

TakeDamage = function(damage)
{
	boss_health -= damage;
	
	if(boss_health == 0)
	{
		instance_destroy(self);
		DropAbility();
	}
	
	boss_i_frame_timer = 32;
}

DropAbility = function()
{
	instance_create_layer(319, 623, "Instances", O_DoubleJumpUnlock);
}
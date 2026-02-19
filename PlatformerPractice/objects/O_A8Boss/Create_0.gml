  /// @description Initialize variables
// You can write your code in this editor

// --------------------------------------------
// Main Variables
// --------------------------------------------
boss_health = 90;
boss_battle_active = true;
boss_i_frame_timer = 0;

y_speed = 0;

phase = 1;
shield_cores = 1;
shield_active = true;

randomise()
pattern = 0;

// --------------------------------------------
// Shot Patterns
// --------------------------------------------
//Circle Burst
circle_count = 8;
burst_wave = 1;

//Spiral Spray
spiral_count = 0;
spiral_direction = 0;

//Chunk Shot
chunk_count = 6;
chunk_wave = 1;
chunk_direction = -45;

// Start the first alarm
alarm[0] = 30;

// --------------------------------------------
// White-out Variables for PhaseChange()
// --------------------------------------------
fade_alpha = 0;
fading_out = false;
fade_speed = 0.05;
whited_out = false;

// --------------------------------------------
// Damage-Related Functions
// --------------------------------------------
CoreDestruction = function()
{
	shield_cores -= 1;
	
	if(shield_cores == 0)
	{
		audio_play_sound(_702515__robinhood76__11762_quick_air_pop_and_vanish , 1, false)
		shield_active = false;
	}
}

TakeDamage = function(current_phase)
{
	if(current_phase == 1)
	{
		TakeDamage_Phase1();
	}
	
	else if(current_phase == 2)
	{
		TakeDamage_Phase2();
	}
	
	else if(current_phase == 3)
	{
		TakeDamage_Phase3();
	}
}

TakeDamage_Phase1 = function()
{
	boss_health -= 30;
	boss_i_frame_timer = 32;
	
	if(boss_health == 0)
	{
		PhaseChange();
	}
}

TakeDamage_Phase2 = function()
{
	boss_health -= 15;
	boss_i_frame_timer = 32;
	
	if(boss_health == 0)
	{
		PhaseChange();
	}
	
	else if(boss_health == 45)
	{
		// Push player back, reactivate shield, regenerate cores
		instance_create_layer(624, 64, "Instances", O_ShieldCore);
		instance_create_layer(48, 416, "Instances", O_ShieldCore);
		shield_cores = 2;
		shield_active = true;
	}
}

TakeDamage_Phase3 = function()
{
	boss_health -= 10;
	boss_i_frame_timer = 32;
	
	if(boss_health == 0)
	{
		// Trigger death animation
		audio_play_sound(_629664__stumpbutt__retro_taking_damage_sfx2_boss, 1, false)
	}
	
	else if(boss_health == 30)
	{
		// Push player back, reactivate shield, regenerate cores
		shield_cores = 3;
		shield_active = true;
	}
	
	else if(boss_health == 60)
	{
		// Push player back, reactivate shield, regenerate cores
		shield_cores = 3;
		shield_active = true;
	}
}

PhaseChange = function()
{
	fading_out = true;
	boss_battle_active = false;
	
	if(whited_out)
	{
		switch(phase)
		{
			case 1:
				phase = 2;
				shield_cores = 2;
				shield_active = true;
				room_goto(Area8_2);
			break;
			
			case 2:
				phase = 3;
				shield_cores = 3;
				shield_active = true;
				room_goto(Area8_3);
			break;
		}
	}
}
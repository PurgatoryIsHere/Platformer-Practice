/// @description Move to different areas
// You can write your code in this editor

//destroy boss after all phases are done
if (phase > 4)
{
	instance_destroy(self)	
}

//reset boss helath and go to next phase
if (boss_health <= 0)
{
	phase += 1
	boss_health = 100
}

//may have to teleport boss to each phase
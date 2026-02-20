/// @description Insert description here
// You can write your code in this editor

if place_meeting(x, y, O_Player)
{
	if(room = Tutorial) {
		global.tutorialGroundPoundUnlock = true;
	}
	else {
		global.groundPoundUnlock = true;
		global.ability_collected = true;
	}

	audio_play_sound(_243701__ertfelda__correct, 1, false)
	instance_destroy(self)
}
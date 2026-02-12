/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x, y, O_Player) && O_Player.grappling)
{
	O_Player.grappling = false;
	O_Player.y_speed = -2.5;
	
	var respawn_data = {
		timer: 180,
		object_index: object_index,
		x: x,
		y: y
	};
	
	array_push(global.respawn_queue, respawn_data);
	
	audio_play_sound(_629664__stumpbutt__retro_taking_damage_sfx2, 1, false)
	instance_destroy();
}
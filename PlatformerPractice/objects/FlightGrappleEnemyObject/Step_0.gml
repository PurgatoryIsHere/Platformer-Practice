/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x, y, PlayerObject) && PlayerObject.grappling)
{
	PlayerObject.grappling = false;
	PlayerObject.y_speed = -2.5;
	
	var respawn_data = {
		timer: 180,
		object_index: object_index,
		x: x,
		y: y
	};
	
	array_push(global.respawn_queue, respawn_data);
	
	instance_destroy();
}
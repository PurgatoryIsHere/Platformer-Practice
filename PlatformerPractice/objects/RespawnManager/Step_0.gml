/// @description Stores objects to be respawned in a queue, respawning them after a certain period of time
// You can write your code in this editor

for (var i = array_length(global.respawn_queue) - 1; i >= 0; i--)
{
    global.respawn_queue[i].timer--;

    if (global.respawn_queue[i].timer <= 0)
	{
		var respawn = global.respawn_queue[i];
		instance_create_layer(respawn.x, respawn.y, "Instances", respawn.object_index);
        array_delete(global.respawn_queue, i, 1);
    }
}
TriggerEvent = function()
{
	if(global.returning_from_EX_2)
	{
		if(instance_exists(O_Player))
		{
			var player = instance_place(x, y, O_Player);
			player.x = 344;
			player.y = 488;
			player.dir = -1;
			global.returning_from_EX_2 = false;
		}
	}
	
	instance_destroy(self);
}
TriggerEvent = function()
{
	if(global.returning_from_EX_1)
	{
		if(instance_exists(O_Player))
		{
			var player = instance_place(x, y, O_Player);
			player.x = 24;
			player.y = 168;
			global.returning_from_EX_1 = false;
		}
	}
	
	instance_destroy(self);
}
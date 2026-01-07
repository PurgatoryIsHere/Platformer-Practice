TriggerEvent = function()
{
	var tiles_to_destroy = [instance_position(1008, 320, O_BreakableBlock), instance_position(1008, 336, O_BreakableBlock)];
	
	for(var i = 0; i < array_length(tiles_to_destroy); i++)
	{
		instance_destroy(tiles_to_destroy[i]);
	}
	
	with(O_Player)
	{
		beingFired = false;
		dashing = false;
		groundPounding = false;
		grappling = false;
		input_enabled = true;
	}
}
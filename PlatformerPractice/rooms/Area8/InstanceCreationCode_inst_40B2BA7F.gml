TriggerEvent = function()
{
	if(global.returning_from_8_1)
	{
		PlayerObject.x = global.area8_1_returnX;
		PlayerObject.y = global.area8_1_returnY;
		global.returning_from_8_1 = false;
	}
}
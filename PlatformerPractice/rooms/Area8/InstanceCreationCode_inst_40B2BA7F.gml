TriggerEvent = function()
{
	if(global.returning_from_8_1)
	{
		PlayerObject.x = global.area8_returnX;
		PlayerObject.y = global.area8_returnY;
		global.returning_from_8_1 = false;
	}
	
	if(global.returning_from_8_2)
	{
		PlayerObject.x = global.area8_returnX;
		PlayerObject.y = global.area8_returnY;
		global.returning_from_8_2 = false;
	}
}
TriggerEvent = function()
{
	if(global.returning_from_8_1)
	{
		O_Player.x = global.area8_returnX;
		O_Player.y = global.area8_returnY;
		global.returning_from_8_1 = false;
	}
	
	else if(global.returning_from_8_2)
	{
		O_Player.x = global.area8_returnX;
		O_Player.y = global.area8_returnY;
		global.returning_from_8_2 = false;
	}
	
	/*else
	{
		PlayerObject.input_enabled = false;
	}*/
}
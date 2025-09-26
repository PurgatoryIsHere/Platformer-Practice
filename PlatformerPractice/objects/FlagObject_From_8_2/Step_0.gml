/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y - 1, PlayerObject) 
{
	global.returning_from_8_2 = true;
	global.area8_returnX = 7;
	global.area8_returnY = 288;
	room_goto(Area8);
}
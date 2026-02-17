/// @description Insert description here
// You can write your code in this editor
	
if(O_Player.y_speed > 0 && O_Player.bbox_bottom >= self.bbox_top)
{
	instance_change(O_SolidShelf, true);
}

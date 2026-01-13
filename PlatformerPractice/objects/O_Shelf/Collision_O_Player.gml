 /// @description Insert description here
// You can write your code in this editor

if (O_Player.y_speed > 0 && O_Player.bbox_bottom > self.bbox_top)
{
	y_speed = 0;
	
	var target_y = O_Player.y + (self.bbox_top - O_Player.bbox_bottom);
    O_Player.y = lerp(O_Player.y, target_y, 0.3);
	
	instance_change(O_SolidShelf, true)
}
/// @description Draw submenu
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_font(MainMenuFont);

var _gap = 80;

if(sub_menu = 1)
{
	for(var i = 0; i < array_length(menu[sub_menu]); ++i)
	{
		draw_set_colour(c_white);
	
		if(i == index)
		{
			draw_set_colour(c_teal);
		}
	
		draw_text(room_width / 2, room_height * .4 + _gap * i, menu[sub_menu][i]);
	}
}
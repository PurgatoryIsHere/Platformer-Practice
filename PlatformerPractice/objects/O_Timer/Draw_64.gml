/// @description Screen white-out effect
// You can write your code in this editor

if(fade_alpha > 0) 
{
    draw_set_alpha(fade_alpha);
    draw_set_color(c_white);
    draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
    draw_set_alpha(1);
}

if(type == "" && timer_going)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	var w = display_get_gui_width();
	draw_text_outline(w * 0.5, 0, "Time Remaining: " + string(round(time_remaining)) + "s", 1.2, 1.2, c_white, c_black);
}

else if (type == "enemy" && timer_going)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	var w = display_get_gui_width();
	draw_text_outline(w * 0.5, 0, "Time Remaining: " + string(round(time_remaining)) + "s", 1.2, 1.2, c_white, c_black);
	
    var enemy_count = instance_number(O_EnemyParent);
	draw_text_outline(w * 0.5, 32, "Enemies: " + string(enemy_count), 1.2, 1.2, c_white, c_black);
}


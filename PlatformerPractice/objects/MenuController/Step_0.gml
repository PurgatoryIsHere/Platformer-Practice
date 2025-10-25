/// @description Scroll through menu options
// You can write your code in this editor
// Step event
var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _select = keyboard_check_pressed(vk_enter);

var _move = _down - _up;

if(_move != 0)
{
	// Move the index
	index += _move;
	
	// Clamp values (ensure selection cycles through menu options)
	var _size = array_length(menu[sub_menu]);
	
	if(sub_menu == 1)
	{
		if(index < 1)
		{
			index = _size - 1; // At start, so loop to last menu option
		}
	
		else if(index > _size - 1)
		{
			index = 1; // At end, so loop to first menu option
		}
	}
	
	else
	{
		if(index < 0)
		{
			index = _size - 1; // At start, so loop to last menu option
		}
	
		else if(index > _size - 1)
		{
			index = 0; // At end, so loop to first menu option
		}
	}
}

if(_select)
{
	switch(sub_menu)
	{
		case 0:
		
			if(index == 0)
			{
				//room_goto(Area5);

				sub_menu = 1;
				layer_set_visible("MainMenu", false)
				index = 1;

			}
	
			else if(index == 1)
			{
				
			}
	
			else if(index == 2)
			{
				game_end();
			}
			
		break;
			
		case 1:
		
			if(index == 1)
			{
				room_goto(Area1);
			}
			
			else if(index == 2)
			{
				room_goto(Area2);
			}
			
			else if(index == 3)
			{
				room_goto(Area3);
			}
			
			else if(index == 4)
			{
				room_goto(Area4);
			}
			
			else if(index == 5)
			{
				room_goto(Area5);
			}
			
			else if(index == 6)
			{
				room_goto(Area6);
			}
			
			else if(index == 7)
			{
				room_goto(Area7);
			}
			
			else if(index == 8)
			{
				room_goto(Area8);
			}
			
			else if(index == 9)
			{
				room_goto(Area8_1);
			}
			
			else if(index == 10)
			{
				room_goto(Area8_2);
			}
			
			else if(index == 11)
			{
				room_goto(Area8_3_1);
			}
			
			else if(index == 12)
			{
				room_goto(Area8_3_2);
			}
			
		break;
			
	}
}
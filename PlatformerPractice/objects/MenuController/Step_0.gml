/// @description Scroll through menu options
// You can write your code in this editor
// Step event
var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _select = keyboard_check_pressed(vk_enter);

var _move = _down - _up;

if(_move != 0 && !waiting_for_input)
{
	// Move the index
	index += _move;
	
	// Clamp values (ensure selection cycles through menu options)
	var _size = array_length(menu[sub_menu]);
	
	if(sub_menu == 0)
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
	
	else
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
}

if(_select)
{
	switch(sub_menu)
	{
		case 0:
		
			if(index == 0)
			{
				sub_menu = 1; // Go to Play menu
				instance_deactivate_object(O_ButtonParent);
				index = 1;

			}
	
			else if(index == 1)
			{
				sub_menu = 2; // Go to Controls menu
				instance_deactivate_object(O_ButtonParent);
				index = 1;
			}
	
			else if(index == 2)
			{
				game_end();
			}
			
			else if(index == 3)
			{
				sub_menu = 3;
				instance_deactivate_object(O_ButtonParent);
				index = 1;
			}
			
		break;
			
		case 1:
		
			if (index == 1)
			{
				room_goto(Tutorial)
			}
			
			else if(index == 2 && global.levelUnlocked[index - 1])
			{
				room_goto(Area1);
			}
			
			else if(index == 3 && global.levelUnlocked[index - 1])
			{
				room_goto(Area2);
			}
			
			else if(index == 4 && global.levelUnlocked[index - 1])
			{
				room_goto(Area3);
			}
			
			else if(index == 5 && global.levelUnlocked[index - 1])
			{
				room_goto(Area4);
			}
			
			else if(index == 6 && global.levelUnlocked[index - 1])
			{
				room_goto(Area5);
			}
			
			else if(index == 7 && global.levelUnlocked[index - 1])
			{
				room_goto(Area6);
			}
			
			else if(index == 8 && global.levelUnlocked[index - 1])
			{
				room_goto(Area7);
			}
			
			else if(index == 9 && global.levelUnlocked[index - 1])
			{
				room_goto(Area8);
			}
			
		break;
		
		case 2:
		
			if(!waiting_for_input)
			{
				if(index >= 1 && index <= 6)
				{
					waiting_for_input = true;
					locked_index = index;
				}
		
				if(index == 8)
				{
					save_game();
					sub_menu = 0;
					instance_activate_object(O_ButtonParent);
					index = 1;
				}
			}
			
		break;
		
		case 3:
		
		/*
			if(index == 1)
			{
				room_goto(Tutorial);
			}
			
			else if(index == 2)
			{
				room_goto(Area1);
			}*/
		
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
				room_goto(AreaEX_1);
			}
			
			else if(index == 10)
			{
				room_goto(AreaEX_2);
			}
			
			else if(index == 11)
			{
				room_goto(Area8_3_1);
			}
			
			else if(index == 12)
			{
				room_goto(Area8_3_2);
			}
			
			else if(index == 13)
			{
				room_goto(Area8_3_3);
			}
			
		break;
		
		case 4:
		
			if(index == 1)
			{
				file_delete("save.dat");
				load_game();
				sub_menu = 2;
				index = 1;
			}
			
			else if(index == 2)
			{
				sub_menu = 2;
				index = 1;
			}
		
		break;
	}
}

// Keybind menu
if(waiting_for_input)
{
    var new_keybind = keyboard_lastkey;

    // Ignore Enter (since it was the selection key)
    if(new_keybind != vk_enter && new_keybind != ord("R") && new_keybind != ord("r") && new_keybind != vk_backspace)
    {
        switch(locked_index)
        {
            case 1: 
			
                global.left_key = new_keybind;
                global.left_keybind_text = "Move Left: " + keycode_to_string(new_keybind);
				menu[2][1] = global.left_keybind_text;
				
            break;
			
			case 2: 
			
                global.right_key = new_keybind;
                global.right_keybind_text = "Move Right: " + keycode_to_string(new_keybind);
				menu[2][2] = global.right_keybind_text;
				
            break;
			
			case 3: 
			
                global.jump_key = new_keybind;
                global.jump_keybind_text = "Jump: " + keycode_to_string(new_keybind);
				menu[2][3] = global.jump_keybind_text;
				
            break;
			
			case 4: 
			
                global.dash_key = new_keybind;
                global.dash_keybind_text = "Dash: " + keycode_to_string(new_keybind);
				menu[2][4] = global.dash_keybind_text;
				
            break;
			
			case 5: 
			
                global.gp_key = new_keybind;
                global.gp_keybind_text = "Ground Pound: " + keycode_to_string(new_keybind);
				menu[2][5] = global.gp_keybind_text;
				
            break;
			
			case 6: 
	
                global.grapple_key = new_keybind;
                global.grapple_keybind_text = "Grapple: " + keycode_to_string(new_keybind);
				menu[2][6] = global.grapple_keybind_text;
				
            break;
        }
		
        waiting_for_input = false;
    }
}


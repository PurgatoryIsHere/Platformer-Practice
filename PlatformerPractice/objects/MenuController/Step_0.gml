/// @description Scroll through menu options
// You can write your code in this editor
// Step event
var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _select = keyboard_check_pressed(vk_enter);

var _move = _down - _up;

if(_move != 0 && !waiting_for_input)
{
	audio_play_sound(_268108__nenadsimic__button_tick, 1, false)
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
	audio_play_sound(_269303__kwahmah_02__swoosh34_edited, 1, false)
	
	switch(sub_menu)
	{
		case 0:
		
			if(index == 0)
			{
				sub_menu = 1; // Go to Play menu
				index = 1;

			}
			
			else if(index == 1)
			{
				sub_menu = 2; // Go to Settings menu
				index = 1;
			}
	
			else if(index == 2)
			{
				sub_menu = 3; // Go to Controls menu
				index = 1;
			}
	
			else if(index == 3)
			{
				room_goto(CreditsScreen);
			}
			
			else if(index == 4)
			{
				game_end();
			}
			
			else if(index == 5)
			{
				sub_menu = 4;
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
				room_goto(Area8_1);
			}
			
			else if(index == 10)
			{
				sub_menu = 0;
				index = 0;
			}
			
		break;
		
		case 2:

			// Display
			if(index == 1)
			{
				global.fullscreen = !global.fullscreen;

				if(global.fullscreen)
				{
					// Fullscreen
					window_enable_borderless_fullscreen(true);
					window_set_fullscreen(true);
					surface_resize(application_surface, display_get_gui_width(), display_get_gui_height());

				}
				
				else
				{
					// Windowed
					window_set_fullscreen(false);
					window_enable_borderless_fullscreen(false);
					window_set_size(1280, 720);
					window_center();
					surface_resize(application_surface, display_get_gui_width(), display_get_gui_height());
				}
			}

			// Back
			if(index == 5)
			{
				sub_menu = 0;
				index = 1;
			}

		break;

		
		case 3:
		
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
					index = 2;
				}
			}
			
		break;
		
		case 4:
		
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
				room_goto(Area8_1);
			}
			
			else if(index == 9)
			{
				room_goto(Area8_2);
			}
			
			else if(index == 10)
			{
				room_goto(Area8_3);
			}
			
			else if(index == 11)
			{
				room_goto(AreaEX_1);
			}
			
			else if(index == 12)
			{
				room_goto(AreaEX_2);
			}
			
		break;
		
		case 5:
		
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

// Slider Logic
if(sub_menu == 2)
{
    // Master Volume
    if(index == 2)
    {
        if (keyboard_check(vk_left))  global.master_volume = clamp(global.master_volume - 0.01, 0, 1);
        if (keyboard_check(vk_right)) global.master_volume = clamp(global.master_volume + 0.01, 0, 1);
    }

    // BGM Volume
    if(index == 3)
    {
        if (keyboard_check(vk_left))  global.bgm_volume = clamp(global.bgm_volume - 0.01, 0, 1);
        if (keyboard_check(vk_right)) global.bgm_volume = clamp(global.bgm_volume + 0.01, 0, 1);
    }

    // SFX Volume
    if (index == 4)
    {
        if (keyboard_check(vk_left))  global.sfx_volume = clamp(global.sfx_volume - 0.01, 0, 1);
        if (keyboard_check(vk_right)) global.sfx_volume = clamp(global.sfx_volume + 0.01, 0, 1);
    }

    // Apply Changes
    audio_group_set_gain(audiogroup_bgm, global.master_volume * global.bgm_volume, 0);
    audio_group_set_gain(audiogroup_sfx, global.master_volume * global.sfx_volume, 0);
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
				menu[3][1] = global.left_keybind_text;
				
            break;
			
			case 2: 
			
                global.right_key = new_keybind;
                global.right_keybind_text = "Move Right: " + keycode_to_string(new_keybind);
				menu[3][2] = global.right_keybind_text;
				
            break;
			
			case 3: 
			
                global.jump_key = new_keybind;
                global.jump_keybind_text = "Jump: " + keycode_to_string(new_keybind);
				menu[3][3] = global.jump_keybind_text;
				
            break;
			
			case 4: 
			
                global.dash_key = new_keybind;
                global.dash_keybind_text = "Dash: " + keycode_to_string(new_keybind);
				menu[3][4] = global.dash_keybind_text;
				
            break;
			
			case 5: 
			
                global.gp_key = new_keybind;
                global.gp_keybind_text = "Ground Pound: " + keycode_to_string(new_keybind);
				menu[3][5] = global.gp_keybind_text;
				
            break;
			
			case 6: 
	
                global.grapple_key = new_keybind;
                global.grapple_keybind_text = "Grapple: " + keycode_to_string(new_keybind);
				menu[3][6] = global.grapple_keybind_text;
				
            break;
        }
		
        waiting_for_input = false;
    }
}


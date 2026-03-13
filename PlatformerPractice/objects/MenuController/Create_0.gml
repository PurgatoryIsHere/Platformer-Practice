  /// @description Controls menu events
// You can write your code in this editor

// Main menu
menu[0][0] = "PLAY";
menu[0][1] = "SETTINGS";
menu[0][2] = "CONTROLS";
menu[0][3] = "CREDITS";
menu[0][4] = "QUIT"; 
menu[0][5] = "DEV MENU";

// Area selection menu - using a different structure
menu[1][0] = "Area Select"; // Title (non-selectable)
menu[1][1] = "Tutorial";
menu[1][2] = "Area 1";
menu[1][3] = "Area 2";
menu[1][4] = "Area 3";
menu[1][5] = "Area 4";
menu[1][6] = "Area 5";
menu[1][7] = "Area 6";
menu[1][8] = "Area 7";
menu[1][9] = "Area 8";
menu[1][10] = "Back";

// Settings Menu
menu[2][0] = "Settings";
menu[2][1] = "Display: ";
menu[2][2] = "Master Volume: ";
menu[2][3] = "BGM Volume: ";
menu[2][4] = "SFX Volume: ";
menu[2][5] = "Back";

// Controls Menu
menu[3][0] = "Controls"; // Title (non-selectable)
menu[3][1] = global.left_keybind_text;
menu[3][2] = global.right_keybind_text;
menu[3][3] = global.jump_keybind_text;
menu[3][4] = global.dash_keybind_text;
menu[3][5] = global.gp_keybind_text;
menu[3][6] = global.grapple_keybind_text;
menu[3][7] = "Pause: Backspace";
menu[3][8] = "Back";

// Test Unlock System Screen
menu[4][0] = "Which area?"; // Title (non-selectable)
menu[4][1] = "Area 1";
menu[4][2] = "Area 2";
menu[4][3] = "Area 3";
menu[4][4] = "Area 4";
menu[4][5] = "Area 5";
menu[4][6] = "Area 6";
menu[4][7] = "Area 7";
menu[4][8] = "Area 8.1";
menu[4][9] = "Area 8.2";
menu[4][10] = "Area 8.3";
menu[4][11] = "Area EX-1";
menu[4][12] = "Area EX-2";

// Clear Save Data Propmt
menu[5][0] = "Are you sure?"
menu[5][1] = "Yes"
menu[5][2] = "No"

index = 0;
sub_menu = 0;


// Grid layout variables for area selection
grid_cols = 3;      // 3 columns
grid_rows = 3;      // 3 rows (2 full rows + 1 partial)

// Key Binding
waiting_for_input = false;
locked_index = 0;

function keycode_to_string(key) 
{
    switch (key) 
	{
        // Common keys
        case vk_space:      return "Space";
        case vk_enter:      return "Enter";
        case vk_shift:      return "Shift";
        case vk_control:    return "Ctrl";
        case vk_alt:        return "Alt";
        case vk_escape:     return "Escape";
        case vk_backspace:  return "Backspace";
        case vk_tab:        return "Tab";
        case vk_left:       return "Left Arrow";
        case vk_right:      return "Right Arrow";
        case vk_up:         return "Up Arrow";
        case vk_down:       return "Down Arrow";

        // Function keys
        case vk_f1: return "F1";
        case vk_f2: return "F2";
        case vk_f3: return "F3";
        case vk_f4: return "F4";
        case vk_f5: return "F5";
        case vk_f6: return "F6";
        case vk_f7: return "F7";
        case vk_f8: return "F8";
        case vk_f9: return "F9";
        case vk_f10: return "F10";
        case vk_f11: return "F11";
        case vk_f12: return "F12";

        // Printable characters (letters/numbers)
        default:
		
            if (key >= ord("0") && key <= ord("9")) 
			{
                return string(chr(key));
            }
			
            if (key >= ord("A") && key <= ord("Z")) 
			{
                return string(chr(key));
            }
			
            if (key >= ord("a") && key <= ord("z")) 
			{
                return string(chr(key));
            }
    }
}






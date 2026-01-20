 /// @description Controls menu events
// You can write your code in this editor

// Main menu
menu[0][0] = O_PlayButton;
menu[0][1] = O_HelpButton;
menu[0][2] = O_QuitButton;
menu[0][3] = O_DevMenuButton; 


/*
// Play menu (yes or no to tutorial)
menu[1][0] = "Would you like to play a tutorial?"; // Title (non-selectable)
menu[1][1] = "Yes";
menu[1][2] = "No";
*/
// Area selection menu - using a different structure
menu[1][0] = "Which area?"; // Title (non-selectable)
menu[1][1] = "Tutorial";
menu[1][2] = "Area 1";
menu[1][3] = "Area 2";
menu[1][4] = "Area 3";
menu[1][5] = "Area 4";
menu[1][6] = "Area 5";
menu[1][7] = "Area 6";
menu[1][8] = "Area 7";
menu[1][9] = "Area 8";

// Help Menu
menu[2][0] = "Controls"; // Title (non-selectable)
menu[2][1] = "Move Left: A";
menu[2][2] = "Move Right: D";
menu[2][3] = "Jump: W";
menu[2][4] = "Dash: Space";
menu[2][5] = "Ground Pound: S";
menu[2][6] = "Grapple: Space";
menu[2][7] = "Pause: Backspace";
menu[2][8] = "Back to Main Menu";

// Test Unlock System Screen
menu[3][0] = "Which area?"; // Title (non-selectable)
menu[3][1] = "Area 1";
menu[3][2] = "Area 2";
menu[3][3] = "Area 3";
menu[3][4] = "Area 4";
menu[3][5] = "Area 5";
menu[3][6] = "Area 6";
menu[3][7] = "Area 7";
menu[3][8] = "Area 8";
menu[3][9] = "Area 8.1";
menu[3][10] = "Area 8.2";
menu[3][11] = "Area 8.3.1";
menu[3][12] = "Area 8.3.2";
menu[3][13] = "Area 8.3.3";

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






/// @description Controls menu events
// You can write your code in this editor

window_set_size(1280, 720);
window_center();
window_set_cursor(cr_none);

// Main menu
menu[0][0] = O_PlayButton;
menu[0][1] = O_HelpButton;
menu[0][2] = O_QuitButton;


/*
// Play menu (yes or no to tutorial)
menu[1][0] = "Would you like to play a tutorial?"; // Title (non-selectable)
menu[1][1] = "Yes";
menu[1][2] = "No";
*/
// Area selection menu - using a different structure
menu[1][0] = "Which area?"; // Title (non-selectable)
menu[1][1] = "Area 1";
menu[1][2] = "Area 2";
menu[1][3] = "Area 3";
menu[1][4] = "Area 4";
menu[1][5] = "Area 5";
menu[1][6] = "Area 6";
menu[1][7] = "Area 7";
menu[1][8] = "Area 8";
menu[1][9] = "Area 8.1";
menu[1][10] = "Area 8.2";
menu[1][11] = "Area 8.3.1";
menu[1][12] = "Area 8.3.2";
menu[1][13] = "Area 8.3.3";

// Help Menu
menu[2][0] = "Controls"; // Title (non-selectable)
menu[2][1] = "Move Left: A";
menu[2][2] = "Move Right: D";
menu[2][3] = "Jump: W";
menu[2][4] = "Dash: Space";
menu[2][5] = "Ground Pound: S";
menu[2][6] = "Grapple: Space (When Applicable)";
menu[2][7] = "Back to Main Menu";

index = 0;
sub_menu = 0;


// Grid layout variables for area selection
grid_cols = 3;      // 3 columns
grid_rows = 3;      // 3 rows (2 full rows + 1 partial)




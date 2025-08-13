/// @description Controls menu events
// You can write your code in this editor

window_set_size(1280, 720)
window_center()
window_set_cursor(cr_none); // Hides mouse


menu[0, 0] = PlayButtonObject;
menu[0, 1] = HelpButtonObject;
menu[0, 2] = QuitButtonObject;

/*
menu[1, 0] = "Would you like to play a tutorial?";
menu[1, 1] = "Yes";
menu[1, 2] = "No";
*/

menu[1, 0] = "Which area?";
menu[1, 1] = "Area 6";
menu[1, 2] = "Area 7";

index = 0;
sub_menu = 0;





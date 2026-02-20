/// @description Insert description here
// You can write your code in this editor

// Window & Mouse
window_set_size(1280, 720);
window_center();
window_set_cursor(cr_none);

// Default font used in draw functions
global.default_font = draw_get_font()
global.default_halign = draw_get_halign()
global.default_valign = draw_get_valign()

// Player Variables
global.lives = 3
global.player_max_health = 100;
global.player_health = 100;

global.area_index = noone;

global.heart_pieces_to_collect = [0, 2, 3, 3, 2, 3, 3, 3];
global.heart_pieces_collected = [0, 0, 0, 0, 0, 0, 0, 0];
global.collected_heart_piece =[[false, false],
							   [false, false, false],
							   [false, false, false],
							   [false, false],
							   [false, false, false],
							   [false, false, false],
							   [false, false, false],
							   [false, false]];
							   

// Ability Unlocks
global.doubleJumpUnlock = false
global.groundPoundUnlock = false
global.grappleUnlock = false

// Abilities only used in tutorial
global.tutorialDoubleJumpUnlock = false;
global.tutorialGroundPoundUnlock = false;
global.tutorialGrappleUnlock = false;

// Boss Variables
global.ability_collected = false;

// Area 7 Variables
global.area7_key_pieces_collected = 0;
global.area7_collected_key_piece = [false, false, false];

// Area EX Variables
global.returning_from_EX_1 = false;
global.returning_from_EX_2 = false;

// Default Keybinds
global.left_key = ord("A");
global.right_key = ord("D");
global.jump_key = ord("W");
global.dash_key = vk_space;
global.gp_key = ord("S");
global.grapple_key = vk_space;

global.left_keybind_text = "Move Left: A";
global.right_keybind_text = "Move Right: D";
global.jump_keybind_text = "Jump: W";
global.dash_keybind_text = "Dash: Space";
global.gp_keybind_text = "Ground Pound: S";
global.grapple_keybind_text = "Grapple: Space";

// Load save file (if it exists)
load_game();

randomize();
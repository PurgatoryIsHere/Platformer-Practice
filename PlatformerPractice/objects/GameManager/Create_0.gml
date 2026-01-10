/// @description Insert description here
// You can write your code in this editor

// Default font used in draw functions
global.default_font = draw_get_font()
global.default_halign = draw_get_halign()
global.default_valign = draw_get_valign()

// Player lives and health
global.lives = 3
global.player_max_health = 100;
global.player_health = 100

global.heart_pieces_to_collect = [0, 2, 3, 3, 2, 3, 3, 3, 0]
global.heart_pieces_collected = [0, 0, 0, 0, 0, 0, 0, 0, 0]
global.collected_heart_piece =[[false, false],
							   [false, false, false],
							   [false, false, false],
							   [false, false],
							   [false, false, false],
							   [false, false, false],
							   [false, false, false]];

// Ability Unlocks
global.doubleJumpUnlock = false
global.groundPoundUnlock = false
global.grappleUnlock = false

//Check if boss is on level
global.isBossAlive = false
global.drops_ability = false;
global.ability_collected = false;

//Interactions for Area 7
global.area7_key_pieces_collected = 0;

//Interactions for Area8
global.returning_from_8_1 = false;
global.returning_from_8_2 = false;
global.area8_returnX = 0;
global.area8_returnY = 0;

// Keybinds
global.left_key = ord("A");
global.right_key = ord("D");
global.jump_key = ord("W");
global.dash_key = vk_space;
global.gp_key = ord("S");
global.grapple_key = vk_space;

randomize()
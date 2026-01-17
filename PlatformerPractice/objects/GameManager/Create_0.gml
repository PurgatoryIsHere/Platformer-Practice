 /// @description Insert description here
// You can write your code in this editor

// Default font used in draw functions
global.default_font = draw_get_font()
global.default_halign = draw_get_halign()
global.default_valign = draw_get_valign()

// Player Variables
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

// Boss Variables
global.a1_boss_defeated = false;
global.a3_boss_defeated = false;
global.a5_boss_defeated = false;
global.a1_miniboss_defeated = false;
global.a3_miniboss_defeated = false;
global.a5_miniboss_defeated = false;

global.ability_collected = false;

// Area 7 Interactions
global.area7_key_pieces_collected = 0;

// Area 8 Interactions
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

//Level Unlock
global.levelUnlocked[0] = true
global.levelUnlocked[1] = false
global.levelUnlocked[2] = false
global.levelUnlocked[3] = false
global.levelUnlocked[4] = false
global.levelUnlocked[5] = false
global.levelUnlocked[6] = false
global.levelUnlocked[7] = false
global.levelUnlocked [8] = false

randomize()
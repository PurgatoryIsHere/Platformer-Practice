/// @description Insert description here
// You can write your code in this editor

// Anything defined in the game manager will carry over across rooms
persistent = true

// Default font used in draw functions
global.default_font = draw_get_font()
global.default_halign = draw_get_halign()
global.default_valign = draw_get_valign()

// Player lives and health
global.lives = 3
global.player_max_health = 100;
global.player_health = 100
global.heart_pieces_collected = 0;
global.all_heart_pieces_collected = false;
global.heart_pieces_to_collect = [0, 2, 3, 3, 2, 0, 0, 0]

// The room the player will be returned to upon death
global.starting_room = StartRoom

// Ability Unlocks
global.doubleJumpUnlock = false
global.groundPoundUnlock = false
global.grappleUnlock = false

// Restore player location after unpausing
global.player_positionX = 0.0
global.player_positionY = 0.0
global.player_velocityX = 0.0
global.player_velocityY = 0.0

// Key Bind Settings
global.rightBind = 0.0
global.leftBind = 0.0
global.jumpBind = 0.0
global.dashBind = 0.0
global.groundPoundBind = 0.0
global.grappleBind = 0.0

//Check if boss is on level
global.isBossAlive = false
global.drops_ability = false;
global.ability_collected = false;

randomize()
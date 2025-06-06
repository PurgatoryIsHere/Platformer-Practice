/// @description Insert description here
// You can write your code in this editor

// Anything defined in the game manager will carry over across rooms
persistent = true

// Player lives and health
global.lives = 3
global.player_health = 100
global.out_of_lives = false

// The room the player will be returned to upon death
global.starting_room = room

// Ability Unlocks
global.doubleJumpUnlock = false
global.groundPoundUnlock = false
global.grappleUnlock = false

// Restore playing location after unpausing
global.player_positionX = 0.0
global.player_positionY = 0.0
global.player_velocityX = 0.0
global.player_velocityY = 0.0


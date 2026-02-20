// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_game()
{
	var buffer = buffer_create(1024, buffer_grow, 1);
	
	// Levels Unlocked
	buffer_write(buffer, buffer_bool, global.levelUnlocked[0]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[1]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[2]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[3]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[4]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[5]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[6]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[7]);
	buffer_write(buffer, buffer_bool, global.levelUnlocked[8]);
	
	// Heart Piece Collection Status (Indiviually)
	buffer_write(buffer, buffer_u32, global.heart_pieces_collected[1]);
	buffer_write(buffer, buffer_u32, global.heart_pieces_collected[2]);
	buffer_write(buffer, buffer_u32, global.heart_pieces_collected[3]);
	buffer_write(buffer, buffer_u32, global.heart_pieces_collected[4]);
	buffer_write(buffer, buffer_u32, global.heart_pieces_collected[5]);
	buffer_write(buffer, buffer_u32, global.heart_pieces_collected[6]);
	buffer_write(buffer, buffer_u32, global.heart_pieces_collected[7]);
	
	// Heart Piece Collection Status (Individually)
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[0][0]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[0][1]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[1][0]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[1][1]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[1][2]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[2][0]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[2][1]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[2][2]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[3][0]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[3][1]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[4][0]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[4][1]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[4][2]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[5][0]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[5][1]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[5][2]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[6][0]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[6][1]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[6][2]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[7][0]);
	buffer_write(buffer, buffer_bool, global.collected_heart_piece[7][1]);
	
	// Player Max Health
	buffer_write(buffer, buffer_u32, global.player_max_health);
	
	// Unlocked Abilities
	buffer_write(buffer, buffer_bool, global.doubleJumpUnlock);
	buffer_write(buffer, buffer_bool, global.groundPoundUnlock);
	buffer_write(buffer, buffer_bool, global.grappleUnlock);
	
	// Keybinds
	buffer_write(buffer, buffer_u32, global.left_key);
	buffer_write(buffer, buffer_u32, global.right_key);
	buffer_write(buffer, buffer_u32, global.jump_key);
	buffer_write(buffer, buffer_u32, global.dash_key);
	buffer_write(buffer, buffer_u32, global.gp_key);
	buffer_write(buffer, buffer_u32, global.grapple_key);
	
	buffer_write(buffer, buffer_string, global.left_keybind_text);
	buffer_write(buffer, buffer_string, global.right_keybind_text);
	buffer_write(buffer, buffer_string, global.jump_keybind_text);
	buffer_write(buffer, buffer_string, global.dash_keybind_text);
	buffer_write(buffer, buffer_string, global.gp_keybind_text);
	buffer_write(buffer, buffer_string, global.grapple_keybind_text);

	
	buffer_save(buffer, "save.dat");
	
	buffer_delete(buffer);
}
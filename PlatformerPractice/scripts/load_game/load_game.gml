// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function load_game()
{
	if (file_exists("save.dat"))
	{
		var buffer = buffer_load("save.dat");
		buffer_seek(buffer, buffer_seek_start, 0);
		
		// Levels Unlocked
		global.levelUnlocked[0] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[1] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[2] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[3] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[4] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[5] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[6] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[7] = buffer_read(buffer, buffer_bool);
		global.levelUnlocked[8] = buffer_read(buffer, buffer_bool);
		
		// Heart Piece Collection Status (Per Area)
		global.heart_pieces_collected[1] = buffer_read(buffer, buffer_u32)
		global.heart_pieces_collected[2] = buffer_read(buffer, buffer_u32)
		global.heart_pieces_collected[3] = buffer_read(buffer, buffer_u32)
		global.heart_pieces_collected[4] = buffer_read(buffer, buffer_u32)
		global.heart_pieces_collected[5] = buffer_read(buffer, buffer_u32)
		global.heart_pieces_collected[6] = buffer_read(buffer, buffer_u32)
		global.heart_pieces_collected[7] = buffer_read(buffer, buffer_u32)
		
		// Heart Piece Collection Status (Individually)
		global.collected_heart_piece[0][0] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[0][1] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[1][0] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[1][1] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[1][2] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[2][0] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[2][1] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[2][2] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[3][0] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[3][1] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[4][0] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[4][1] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[4][2] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[5][0] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[5][1] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[5][2] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[6][0] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[6][1] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[6][2] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[7][0] = buffer_read(buffer, buffer_bool);
		global.collected_heart_piece[7][1] = buffer_read(buffer, buffer_bool);
		
		// Player Max Health
		global.player_max_health = buffer_read(buffer, buffer_u32);
		
		// Unlocked Abilities
		global.doubleJumpUnlock = buffer_read(buffer, buffer_bool);
		global.groundPoundUnlock = buffer_read(buffer, buffer_bool);
		global.grappleUnlock = buffer_read(buffer, buffer_bool);
		
		// Keybinds
		global.left_key = buffer_read(buffer, buffer_u32);
		global.right_key = buffer_read(buffer, buffer_u32);
		global.jump_key = buffer_read(buffer, buffer_u32);
		global.dash_key = buffer_read(buffer, buffer_u32);
		global.gp_key = buffer_read(buffer, buffer_u32);
		global.grapple_key = buffer_read(buffer, buffer_u32);
		
		global.left_keybind_text = buffer_read(buffer, buffer_string);
		global.right_keybind_text = buffer_read(buffer, buffer_string);
		global.jump_keybind_text = buffer_read(buffer, buffer_string);
		global.dash_keybind_text = buffer_read(buffer, buffer_string);
		global.gp_keybind_text = buffer_read(buffer, buffer_string);
		global.grapple_keybind_text = buffer_read(buffer, buffer_string);
		
		buffer_delete(buffer)
	}
	
	else
	{
		global.levelUnlocked[0] = true;
		global.levelUnlocked[1] = false;
		global.levelUnlocked[2] = false;
		global.levelUnlocked[3] = false;
		global.levelUnlocked[4] = false;
		global.levelUnlocked[5] = false;
		global.levelUnlocked[6] = false;
		global.levelUnlocked[7] = false;
		global.levelUnlocked[8] = false;
		
		global.player_max_health = 100;
		
		global.doubleJumpUnlock = false;
		global.groundPoundUnlock = false;
		global.grappleUnlock = false;
		
		global.heart_pieces_collected = [0, 0, 0, 0, 0, 0, 0, 0]
		global.collected_heart_piece =[[false, false],
									   [false, false, false],
									   [false, false, false],
									   [false, false],
									   [false, false, false],
									   [false, false, false],
									   [false, false, false],
									   [false, false]];
		
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
	}
}
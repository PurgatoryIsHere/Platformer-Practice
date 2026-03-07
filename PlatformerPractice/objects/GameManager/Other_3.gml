/// @description Save before closing
// You can write your code in this editor

save_game();

// delete fonts to ensure no memory leakage
font_delete(global.title_font);
font_delete(global.menu_options_font);


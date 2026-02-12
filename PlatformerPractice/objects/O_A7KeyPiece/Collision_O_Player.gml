/// @description On collection
// You can write your code in this editor

global.area7_collected_key_piece[key] = true;
global.area7_key_pieces_collected += 1;
audio_play_sound(_243701__ertfelda__correct, 1, false)
instance_destroy(self);
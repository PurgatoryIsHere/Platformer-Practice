/// @description Insert description here
// You can write your code in this editor


bgm_map = ds_map_create();

ds_map_add(bgm_map, MainMenu, Sketchbook_2024_09_12);
ds_map_add(bgm_map, Tutorial, Sketchbook_2024_08_21); 
ds_map_add(bgm_map, Area1, Three_Red_Hearts___Go__No_Vocal_);
ds_map_add(bgm_map, Area2, Sketchbook_2024_10_23);
ds_map_add(bgm_map, Area3, Sketchbook_2024_09_04_LOOP);
//2024-12-21 Area 3 Boss Music
ds_map_add(bgm_map, Area4, Of_Far_Different_Nature___Windfish__CC_BY_4_0_);
ds_map_add(bgm_map, Area5, Sketchbook_2024_07_04);
ds_map_add(bgm_map, Area7, Sketchbook_2024_10_26);
ds_map_add(bgm_map, Area7_2, Sketchbook_2025_11_13);
ds_map_add(bgm_map, Area7_3,Of_Far_Different_Nature___Oldskool__v2___CC_BY_4_0_);

current_bgm = noone;
previous_bgm = noone;

StartBossMusic = function(boss)
{
	if(boss == "Area1")
	{
		audio_sound_gain(current_bgm, 0, 1000);
		audio_stop_sound(current_bgm);
				
		previous_bgm = bgm_map[? room];
		current_bgm = audio_play_sound(Of_Far_Different_Nature___Voltage__CC_BY_, 1, true);
				
		audio_sound_gain(current_bgm, 1, true);
	}
}

StopBossMusic = function()
{
	audio_sound_gain(current_bgm, 0, 1000);
	audio_stop_sound(current_bgm);
				
	current_bgm = audio_play_sound(previous_bgm, 1, true);
	previous_bgm = noone;
				
	audio_sound_gain(current_bgm, 1, true);
}
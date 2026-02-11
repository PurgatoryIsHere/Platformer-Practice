/// @description DS Map entries for bgm
// You can write your code in this editor

bgm_map = ds_map_create();

ds_map_add(bgm_map, MainMenu, Sketchbook_2024_09_12);
ds_map_add(bgm_map, Tutorial, Sketchbook_2024_08_21); 
ds_map_add(bgm_map, Area1, Three_Red_Hearts___Go__No_Vocal_);
ds_map_add(bgm_map, Area2, Sketchbook_2024_10_23);
ds_map_add(bgm_map, Area3, Sketchbook_2024_09_04_LOOP);
ds_map_add(bgm_map, Intermission1, nojisuma_black_box_153858);
ds_map_add(bgm_map, Area4, Of_Far_Different_Nature___Windfish__CC_BY_4_0_);
ds_map_add(bgm_map, Area5, Sketchbook_2024_12_21);
ds_map_add(bgm_map, Intermission2, nojisuma_black_box_153858);
ds_map_add(bgm_map, Area6, nojisuma_white_breath_114103);
ds_map_add(bgm_map, Area7, Sketchbook_2024_10_26);
ds_map_add(bgm_map, Area7_1, nojisuma_the_oldest_144980);
ds_map_add(bgm_map, Area7_2, Sketchbook_2025_11_13);
ds_map_add(bgm_map, Area7_3, Sketchbook_2024_07_04);
ds_map_add(bgm_map, CreditsScreen, _180128_piano_ennui_nostalgic_emotional_lofi_96266);

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
	
	if(boss == "Area3")
	{
		audio_sound_gain(current_bgm, 0, 1000);
		audio_stop_sound(current_bgm);
				
		previous_bgm = bgm_map[? room];
		current_bgm = audio_play_sound(nojisuma_the_oldest_144980, 1, true);
				
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
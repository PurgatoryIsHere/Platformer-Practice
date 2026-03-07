/// @description Play BGM functionality
// You can write your code in this editor

if(room != previous_room)
{
	var new_sound;

	// Get the sound for the current room
	if (ds_map_exists(bgm_map, room)) 
	{
		new_sound = bgm_map[? room];
	}

	if(new_sound == current_bgm_sound) 
	{
		exit;
	}

	// If a track is playing, fade it out
	if (current_bgm != noone) 
	{
		audio_sound_gain(current_bgm, 0, 1000); // fade to 0 volume over 1 second
		audio_stop_sound(current_bgm);          // stop after fade
	}

	// Start the new track
	current_bgm = audio_play_sound(new_sound, 1, true);
	current_bgm_sound = new_sound;

	// Fade in the new track
	audio_sound_gain(current_bgm, 1, 1000); // fade to full volume over 1 second
	
	previous_room = room;
}

